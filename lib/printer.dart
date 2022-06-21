import 'printer_platform_interface.dart';

class Printer {
  Future<String?> getPlatformVersion() {
    return PrinterPlatform.instance.getPlatformVersion();
  }

  Future<bool> println(String text) {
    return PrinterPlatform.instance.println(text);
  }

  Future<bool> setCopies(int copies) {
    return PrinterPlatform.instance.setCopies(copies);
  }

  Future<bool> printBold(String text) {
    return PrinterPlatform.instance.printBold(text);
  }

  Future<bool> printUnderline(String text) {
    return PrinterPlatform.instance.printUnderline(text);
  }

  Future<bool> printUnderlineBold(String text) {
    return PrinterPlatform.instance.printUnderlineBold(text);
  }

  Future<bool> printLeft(String text) {
    return PrinterPlatform.instance.printLeft(text);
  }

  Future<bool> printRight(String text) {
    return PrinterPlatform.instance.printRight(text);
  }

  Future<bool> printCenter(String text) {
    return PrinterPlatform.instance.printCenter(text);
  }

  Future<bool> printLeftBold(String text) {
    return PrinterPlatform.instance.printLeftBold(text);
  }

  Future<bool> printRightBold(String text) {
    return PrinterPlatform.instance.printRightBold(text);
  }

  Future<bool> printCenterBold(String text) {
    return PrinterPlatform.instance.printCenterBold(text);
  }

  Future<bool> printLeftUnderline(String text) {
    return PrinterPlatform.instance.printLeftUnderline(text);
  }

  Future<bool> printRightUnderline(String text) {
    return PrinterPlatform.instance.printRightUnderline(text);
  }

  Future<bool> printCenterUnderline(String text) {
    return PrinterPlatform.instance.printCenterUnderline(text);
  }

  Future<bool> printLeftUnderlineBold(String text) {
    return PrinterPlatform.instance.printLeftUnderlineBold(text);
  }

  Future<bool> printRightUnderlineBold(String text) {
    return PrinterPlatform.instance.printRightUnderlineBold(text);
  }

  Future<bool> printCenterUnderlineBold(String text) {
    return PrinterPlatform.instance.printCenterUnderlineBold(text);
  }

  Future<bool> printDoubleHeightWidth(String text) {
    return PrinterPlatform.instance.printDoubleHeightWidth(text);
  }

  Future<bool> printDoubleHeightWidthLeft(String text) {
    return PrinterPlatform.instance.printDoubleHeightWidthLeft(text);
  }

  Future<bool> printDoubleHeightWidthRight(String text) {
    return PrinterPlatform.instance.printDoubleHeightWidthRight(text);
  }

  Future<bool> printDoubleHeightWidthCenter(String text) {
    return PrinterPlatform.instance.printDoubleHeightWidthCenter(text);
  }

  Future<bool> printDoubleHeightWidthBold(String text) {
    return PrinterPlatform.instance.printDoubleHeightWidthBold(text);
  }

  Future<bool> printDoubleHeightWidthBoldLeft(String text) {
    return PrinterPlatform.instance.printDoubleHeightWidthBoldLeft(text);
  }

  Future<bool> printDoubleHeightWidthBoldRight(String text) {
    return PrinterPlatform.instance.printDoubleHeightWidthBoldRight(text);
  }

  Future<bool> printDoubleHeightWidthBoldCenter(String text) {
    return PrinterPlatform.instance.printDoubleHeightWidthBoldCenter(text);
  }

  Future<bool> ln(int lines) {
    return PrinterPlatform.instance.ln(lines);
  }

  Future<bool> drawLine(String text) {
    return PrinterPlatform.instance.drawLine(text);
  }

  Future<bool> image(Uri uri) {
    return PrinterPlatform.instance.image(uri);
  }

  Future<bool> imageLeft(Uri uri) {
    return PrinterPlatform.instance.imageLeft(uri);
  }

  Future<bool> imageRight(Uri uri) {
    return PrinterPlatform.instance.imageRight(uri);
  }

  Future<bool> imageCenter(Uri uri) {
    return PrinterPlatform.instance.imageCenter(uri);
  }

  Future<bool?> start() {
    return PrinterPlatform.instance.start();
  }

  Future<bool> flush() {
    return PrinterPlatform.instance.flush();
  }
}
