
import 'printer_platform_interface.dart';

class Printer {
  Future<String?> getPlatformVersion() {
    return PrinterPlatform.instance.getPlatformVersion();
  }

  Future<void> println( String text) {
    return PrinterPlatform.instance.println(text);
  }
}
