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
  private RawbtPrintJob job = new RawbtPrintJob();
  private AttributesString left = new AttributesString().setAlignment(ALIGNMENT_LEFT);
  private AttributesString right = new AttributesString().setAlignment(ALIGNMENT_RIGHT);
  private AttributesString center = new AttributesString().setAlignment(ALIGNMENT_CENTER);
  private AttributesString bold = new AttributesString().setBold(true);
  private AttributesString underline = new AttributesString().setUnderline(true);
  private AttributesString underlineBold = new AttributesString().setUnderline(true).setBold(true);

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
    }else if (call.method.equals("start")) {
      job = new RawbtPrintJob();
      result.success(true);
    } else if (call.method.equals("setCopies")) {
      final int copies = call.argument("copies");
      attrJob.setCopies(copies);
      result.success(true);
    } else if (call.method.equals("println")) {
      final String text = call.argument("text");
      println(text, null);
      result.success(true);
    } else if (call.method.equals("printBold")) {
      final String text = call.argument("text");
      println(text, bold);
      result.success(true);
    } else if (call.method.equals("printUnderline")) {
      final String text = call.argument("text");
      println(text, underline);
      result.success(true);
    } else if (call.method.equals("printUnderlineBold")) {
      final String text = call.argument("text");
      println(text, underlineBold);
      result.success(true);
    } else if (call.method.equals("printLeft")) {
      final String text = call.argument("text");
      println(text, left);
      result.success(true);
    } else if (call.method.equals("printRight")) {
      final String text = call.argument("text");
      println(text, right);
      result.success(true);
    } else if (call.method.equals("printCenter")) {
      final String text = call.argument("text");
      println(text, center);
      result.success(true);
    } else if (call.method.equals("printLeftBold")) {
      final String text = call.argument("text");
      AttributesString leftBold = left;
      leftBold.setBold(true);
      println(text, leftBold);
      result.success(true);
    } else if (call.method.equals("printRightBold")) {
      final String text = call.argument("text");
      AttributesString rightBold = right;
      rightBold.setBold(true);
      println(text, rightBold);
      result.success(true);
    } else if (call.method.equals("printCenterBold")) {
      final String text = call.argument("text");
      AttributesString centerBold = center;
      centerBold.setBold(true);
      println(text, centerBold);
      result.success(true);
    } else if (call.method.equals("printLeftUnderline")) {
      final String text = call.argument("text");
      AttributesString leftUnderline = left;
      leftUnderline.setUnderline(true);
      println(text, leftUnderline);
      result.success(true);
    } else if (call.method.equals("printRightUnderline")) {
      final String text = call.argument("text");
      AttributesString rightUnderline = right;
      rightUnderline.setUnderline(true);
      println(text, rightUnderline);
      result.success(true);
    }  else if (call.method.equals("printCenterUnderline")) {
      final String text = call.argument("text");
      AttributesString centerUnderline = center;
      centerUnderline.setUnderline(true);
      println(text, centerUnderline);
      result.success(true);
    }  else if (call.method.equals("printLeftUnderlineBold")) {
      final String text = call.argument("text");
      AttributesString leftUnderlineBold = left;
      leftUnderlineBold.setUnderline(true);
      leftUnderlineBold.setBold(true);
      println(text, leftUnderlineBold);
      result.success(true);
    } else if (call.method.equals("printRightUnderlineBold")) {
      final String text = call.argument("text");
      AttributesString rightUnderlineBold = right;
      rightUnderlineBold.setUnderline(true);
      rightUnderlineBold.setBold(true);
      println(text, rightUnderlineBold);
      result.success(true);
    } else if (call.method.equals("printCenterUnderlineBold")) {
      final String text = call.argument("text");
      AttributesString centerUnderlineBold = center;
      centerUnderlineBold.setUnderline(true);
      centerUnderlineBold.setBold(true);
      println(text, centerUnderlineBold);
      result.success(true);
    } else if (call.method.equals("printDoubleHeightWidth")) {
      final String text = call.argument("text");
      AttributesString fBw2h2 = (new AttributesString())
                .setPrinterFont(FONT_B)
                .setDoubleHeight(true)
                .setDoubleWidth(true);
      println(text, fBw2h2);
      result.success(true);
    } else if (call.method.equals("printDoubleHeightWidthLeft")) {
      final String text = call.argument("text");
      AttributesString fBw2h2 = (new AttributesString())
                .setPrinterFont(FONT_B)
                .setDoubleHeight(true)
                .setDoubleWidth(true)
                .setAlignment(ALIGNMENT_LEFT);
      println(text, fBw2h2);
      result.success(true);
    } else if (call.method.equals("printDoubleHeightWidthRight")) {
      final String text = call.argument("text");
      AttributesString fBw2h2 = (new AttributesString())
                .setPrinterFont(FONT_B)
                .setDoubleHeight(true)
                .setDoubleWidth(true)
                .setAlignment(ALIGNMENT_RIGHT);
      println(text, fBw2h2);
      result.success(true);
    } else if (call.method.equals("printDoubleHeightWidthCenter")) {
      final String text = call.argument("text");
      AttributesString fBw2h2 = (new AttributesString())
                .setPrinterFont(FONT_B)
                .setDoubleHeight(true)
                .setDoubleWidth(true)
                .setAlignment(ALIGNMENT_CENTER);
      println(text, fBw2h2);
      result.success(true);
    } else if (call.method.equals("printDoubleHeightWidthBold")) {
      final String text = call.argument("text");
      AttributesString fBw2h2 = (new AttributesString())
                .setPrinterFont(FONT_B)
                .setDoubleHeight(true)
                .setDoubleWidth(true)
                .setBold(true);
      println(text, fBw2h2);
      result.success(true);
    } else if (call.method.equals("printDoubleHeightWidthBoldLeft")) {
      final String text = call.argument("text");
      AttributesString fBw2h2 = (new AttributesString())
                .setPrinterFont(FONT_B)
                .setDoubleHeight(true)
                .setDoubleWidth(true)
                .setBold(true)
                .setAlignment(ALIGNMENT_LEFT);
      println(text, fBw2h2);
      result.success(true);
    } else if (call.method.equals("printDoubleHeightWidthBoldRight")) {
      final String text = call.argument("text");
      AttributesString fBw2h2 = (new AttributesString())
                .setPrinterFont(FONT_B)
                .setDoubleHeight(true)
                .setDoubleWidth(true)
                .setBold(true)
                .setAlignment(ALIGNMENT_RIGHT);
      println(text, fBw2h2);
      result.success(true);
    } else if (call.method.equals("printDoubleHeightWidthBoldCenter")) {
      final String text = call.argument("text");
      AttributesString fBw2h2 = (new AttributesString())
                .setPrinterFont(FONT_B)
                .setDoubleHeight(true)
                .setDoubleWidth(true)
                .setBold(true)
                .setAlignment(ALIGNMENT_CENTER);
      println(text, fBw2h2);
      result.success(true);
    } else if (call.method.equals("flush")) {
      Toast.makeText(activity, "Print", Toast.LENGTH_SHORT).show();
      printJob(job);
      result.success(true);
    } else {
      result.notImplemented();
    }
  }

  private void println(String text, AttributesString attr){
    job.setPrinter(attrJob.getPrinter());
    job.setTemplate(attrJob.getTemplate());
    job.setCopies(attrJob.getCopies());

    if(attr != null){
      job.println(text, attr);
    }else{
      job.println(text);
    }
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
