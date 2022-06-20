package com.floodcoding.printer;

import android.app.Activity;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.ArrayList;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import rawbt.api.AppCompatRawbtPlugin;
import rawbt.api.RawbtPrintJob;

/** PrinterPlugin */
public class PrinterPlugin extends AppCompatRawbtPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Activity activity;
  private final RawbtPrintJob attrJob = new RawbtPrintJob();

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "com.floodcoding/printer_plugin");
    channel.setMethodCallHandler(this);
    attrJob.setCopies(1);
    attrJob.setPrinter(RawbtPrintJob.PRINTER_CURRENT);
    attrJob.setTemplate(RawbtPrintJob.TEMPLATE_DEFAULT);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("println")) {
      final String text = call.argument("text");
      println(text);
      result.success(null);
    } else {
      result.notImplemented();
    }
  }

  private void println(String text){
    RawbtPrintJob job = new RawbtPrintJob();

    job.setPrinter(attrJob.getPrinter());
    job.setTemplate(attrJob.getTemplate());
    job.setCopies(attrJob.getCopies());

    job.println(text);

    Toast.makeText(activity, "Print", Toast.LENGTH_SHORT).show();
    printJob(job);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    activity = binding.getActivity();;
    init(binding.getActivity());
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    activity = null;
    //onDestroy();
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    activity = binding.getActivity();
    //init(binding.getActivity());
  }

  @Override
  public void onDetachedFromActivity() {
    activity = null;
    destroy();
  }

  // ---------------------- implements ----------------

  @Override
  protected void handleServiceConnected() {
    // auto start print where
  }

  @Override
  protected void handlePrintSuccess(String jobId) {
    Toast.makeText(activity,"Success",Toast.LENGTH_SHORT).show();
  }

  @Override
  protected void handlePrintCancel(String jobId) {
    Toast.makeText(activity,"Canceled",Toast.LENGTH_SHORT).show();
  }

  @Override
  protected void handlePrintError(@Nullable String jobId, String message) {
    Toast.makeText(activity, message, Toast.LENGTH_SHORT).show();
  }

  @Override
  protected void handlePrintProgress(String jobId, Float p) {
    // nothing
  }
  // ------------------------------

  private ArrayList<String> getPrinterList() {
    ArrayList<String> arrayList = new ArrayList<>();
    arrayList.add(RawbtPrintJob.PRINTER_CURRENT);
    arrayList.add(RawbtPrintJob.PRINTER_VIRTUAL);
    return arrayList;
  }

  private ArrayList<String> getTemplateList() {
    ArrayList<String> arrayList = new ArrayList<>();

    arrayList.add(RawbtPrintJob.TEMPLATE_DEFAULT);
    arrayList.add(RawbtPrintJob.TEMPLATE_NONE);

    return arrayList;
  }

  private static ArrayList<String> getNumbersCopies(){
    ArrayList<String> arrayList = new ArrayList<>();

    arrayList.add("1");
    arrayList.add("2");
    arrayList.add("3");
    arrayList.add("4");
    arrayList.add("5");
    arrayList.add("6");
    arrayList.add("7");
    arrayList.add("8");
    arrayList.add("9");
    arrayList.add("10");

    return arrayList;
  }

  // ------------------------------

}
