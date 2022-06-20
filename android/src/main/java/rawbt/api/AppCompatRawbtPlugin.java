package rawbt.api;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;

import androidx.activity.ComponentActivity;
import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.floodcoding.printer.R;

import rawbt.sdk.ICallback;
import rawbt.sdk.IRawBtPrintService;

abstract public class AppCompatRawbtPlugin extends ComponentActivity {
    Activity activity;
    final protected Handler handler = new Handler(Looper.getMainLooper());
    // -----------------------------------------

    public volatile IRawBtPrintService serviceRawBT = null;
    private final ServiceConnection connectService = new ServiceConnection() {

        @Override
        public void onServiceConnected(ComponentName name, IBinder s) {
            serviceRawBT = IRawBtPrintService.Stub.asInterface(s);
            try {
                serviceRawBT.registerCallback(serviceCallback);
                handler.post(()-> handleServiceConnected());
            } catch (Exception e) {
                handlePrintError(null,e.getLocalizedMessage());
            }
        }

        @Override
        public void onServiceDisconnected(ComponentName name) {
            serviceRawBT = null;
            handler.postDelayed(()-> bindRawBT(activity,false),5000);
        }

    };

    // -----------------------------------------

    final ICallback serviceCallback = new ICallback.Stub() {

        @Override
        public void onPrintSuccess(String jobId)  {
            final String finalJobId = jobId;
            handler.post(()-> handlePrintSuccess(finalJobId));
        }

        @Override
        public void onPrintError(String jobId,String errMessage) {
            final String finalJobId = jobId;
            final String finalMes = errMessage;
            handler.post(()-> handlePrintError(finalJobId,finalMes));
        }

        @Override
        public void onPrintCancel(String jobId) {
            final String finalJobId = jobId;
            handler.post(()-> handlePrintCancel(finalJobId));
        }

        @Override
        public void onProgress(String jobId, float p)  {
            final String finalJobId = jobId;
            final float finalP = p;
            handler.post(()-> handlePrintProgress(finalJobId,finalP));
        }


    };

    protected void bindRawBT(Activity activity, boolean allowRequestPerm){
        try {
            activity.bindService(RawbtApiHelper.createExplicitIntent(), connectService, Context.BIND_AUTO_CREATE);
        }catch (SecurityException s){
            if(allowRequestPerm){
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {

                    if (activity.checkSelfPermission(RawbtApiHelper.SERVICE_PERMISSION)
                            != PackageManager.PERMISSION_GRANTED) {

                        mRequestPermission.launch(RawbtApiHelper.SERVICE_PERMISSION);

                    }

                }
            }else {
                handlePrintError(null, activity.getString(R.string.rawbt_permission_not_granted));
            }
        }catch (Exception e) {
            handlePrintError(null, activity.getString(R.string.rawbt_connect_error));
        }
    }
    // --------------------------------------------------------
    private final ActivityResultLauncher<String> mRequestPermission = registerForActivityResult(new ActivityResultContracts.RequestPermission(), isGranted -> bindRawBT(activity, false));
    // --------------------------------------------------------

    public void init(Activity _activity) {
        activity = _activity;
        if(serviceRawBT==null) {
            bindRawBT(activity,true);
        }
    }

    public void destroy() {
        if(serviceRawBT != null){
            activity.unbindService(connectService);
        }
    }

    protected void printJob(@NonNull RawbtPrintJob job){
        if(serviceRawBT == null){
            if(!RawbtApiHelper.isServiceInstalled(activity)){
                handlePrintError(job.idJob, activity.getString(R.string.rawb_not_installed));
                return;
            }
            bindRawBT(activity,false);
            handlePrintError(job.idJob, activity.getString(R.string.rawbt_please_wait));
            return;
        }

        try{
            serviceRawBT.printRawbtPrintJob(job.GSON());
        }catch (SecurityException s){
            handlePrintError(job.idJob, activity.getString(R.string.rawbt_permission_not_granted));
        }catch (Exception e){
            handlePrintError(job.idJob,e.getLocalizedMessage());
        }
    }

    abstract protected void handleServiceConnected();
    abstract protected void handlePrintSuccess(String jobId);
    abstract protected void handlePrintCancel(String jobId);
    abstract protected void handlePrintError(@Nullable String jobId, String message);
    abstract protected void handlePrintProgress(String jobId,Float p);
}
