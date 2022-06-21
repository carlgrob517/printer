import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'printer_method_channel.dart';

abstract class PrinterPlatform extends PlatformInterface {
  /// Constructs a PrinterPlatform.
  PrinterPlatform() : super(token: _token);

  static final Object _token = Object();

  static PrinterPlatform _instance = MethodChannelPrinter();

  /// The default instance of [PrinterPlatform] to use.
  ///
  /// Defaults to [MethodChannelPrinter].
  static PrinterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PrinterPlatform] when
  /// they register themselves.
  static set instance(PrinterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> setCopies(int copies) {
    throw UnimplementedError('setCopies() has not been implemented.');
  }

  Future<bool> println(String text) {
    throw UnimplementedError('println() has not been implemented.');
  }

  Future<bool> printBold(String text) {
    throw UnimplementedError('printBold() has not been implemented.');
  }

  Future<bool> printUnderline(String text) {
    throw UnimplementedError('printUnderline() has not been implemented.');
  }

  Future<bool> printUnderlineBold(String text) {
    throw UnimplementedError('printUnderlineBold() has not been implemented.');
  }

  Future<bool> printLeft(String text) {
    throw UnimplementedError('printLeft() has not been implemented.');
  }

  Future<bool> printRight(String text) {
    throw UnimplementedError('printRight() has not been implemented.');
  }

  Future<bool> printCenter(String text) {
    throw UnimplementedError('printCenter() has not been implemented.');
  }

  Future<bool> printLeftBold(String text) {
    throw UnimplementedError('printLeftBold() has not been implemented.');
  }

  Future<bool> printRightBold(String text) {
    throw UnimplementedError('printRightBold() has not been implemented.');
  }

  Future<bool> printCenterBold(String text) {
    throw UnimplementedError('printCenterBold() has not been implemented.');
  }

  Future<bool> printLeftUnderline(String text) {
    throw UnimplementedError('printLeftUnderline() has not been implemented.');
  }

  Future<bool> printRightUnderline(String text) {
    throw UnimplementedError('printRightUnderline() has not been implemented.');
  }

  Future<bool> printCenterUnderline(String text) {
    throw UnimplementedError('printCenterUnderline() has not been implemented.');
  }

  Future<bool> printLeftUnderlineBold(String text) {
    throw UnimplementedError('printLeftUnderlineBold() has not been implemented.');
  }

  Future<bool> printRightUnderlineBold(String text) {
    throw UnimplementedError('printRightUnderlineBold() has not been implemented.');
  }

  Future<bool> printCenterUnderlineBold(String text) {
    throw UnimplementedError('printCenterUnderlineBold() has not been implemented.');
  }

  Future<bool> printDoubleHeightWidth(String text) {
    throw UnimplementedError('printDoubleHeightWidth() has not been implemented.');
  }

  Future<bool> printDoubleHeightWidthLeft(String text) {
    throw UnimplementedError('printDoubleHeightWidthLeft() has not been implemented.');
  }

  Future<bool> printDoubleHeightWidthRight(String text) {
    throw UnimplementedError('printDoubleHeightWidthRight() has not been implemented.');
  }

  Future<bool> printDoubleHeightWidthCenter(String text) {
    throw UnimplementedError('printDoubleHeightWidthCenter() has not been implemented.');
  }

  Future<bool> printDoubleHeightWidthBold(String text) {
    throw UnimplementedError('printDoubleHeightWidthBold() has not been implemented.');
  }

  Future<bool> printDoubleHeightWidthBoldLeft(String text) {
    throw UnimplementedError('printDoubleHeightWidthBoldLeft() has not been implemented.');
  }

  Future<bool> printDoubleHeightWidthBoldRight(String text) {
    throw UnimplementedError('printDoubleHeightWidthBoldRight() has not been implemented.');
  }

  Future<bool> printDoubleHeightWidthBoldCenter(String text) {
    throw UnimplementedError('printDoubleHeightWidthBoldCenter() has not been implemented.');
  }

  Future<bool> ln(int lines) {
    throw UnimplementedError('ln() has not been implemented.');
  }

  Future<bool> drawLine(String text) {
    throw UnimplementedError('drawLine() has not been implemented.');
  }

  Future<bool> image(Uri uri) {
    throw UnimplementedError('image() has not been implemented.');
  }

  Future<bool> imageLeft(Uri uri) {
    throw UnimplementedError('imageLeft() has not been implemented.');
  }

  Future<bool> imageRight(Uri uri) {
    throw UnimplementedError('imageRight() has not been implemented.');
  }

  Future<bool> imageCenter(Uri uri) {
    throw UnimplementedError('imageCenter() has not been implemented.');
  }

  Future<bool?> start() {
    throw UnimplementedError('start() has not been implemented.');
  }

  Future<bool> flush() {
    throw UnimplementedError('flush() has not been implemented.');
  }
}
