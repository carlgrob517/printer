import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'printer_platform_interface.dart';

/// An implementation of [PrinterPlatform] that uses method channels.
class MethodChannelPrinter extends PrinterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.floodcoding/printer_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> start() async {
    final result = await methodChannel.invokeMethod<bool>('start');
    return result;
  }

  @override
  Future<bool> println(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('println', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to println $text: ${e.message}';
    }
  }

  @override
  Future<bool> setCopies(int copies) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('setCopies', <String, dynamic>{'copies': copies});
    } on PlatformException catch (e) {
      throw 'Unable to set copies: $copies: ${e.message}';
    }
  }

  @override
  Future<bool> printBold(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printBold', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printBold $text: ${e.message}';
    }
  }

  @override
  Future<bool> printUnderline(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printUnderline', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printUnderline $text: ${e.message}';
    }
  }

  @override
  Future<bool> printUnderlineBold(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printUnderlineBold', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printUnderlineBold $text: ${e.message}';
    }
  }

  @override
  Future<bool> printLeft(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printLeft', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printLeft $text: ${e.message}';
    }
  }

  @override
  Future<bool> printRight(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printRight', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printRight $text: ${e.message}';
    }
  }

  @override
  Future<bool> printCenter(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printCenter', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printCenter $text: ${e.message}';
    }
  }

  @override
  Future<bool> printLeftBold(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printLeftBold', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printLeftBold $text: ${e.message}';
    }
  }

  @override
  Future<bool> printRightBold(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printRightBold', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printRightBold $text: ${e.message}';
    }
  }

  @override
  Future<bool> printCenterBold(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printCenterBold', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printCenterBold $text: ${e.message}';
    }
  }

  @override
  Future<bool> printLeftUnderline(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printLeftUnderline', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printLeftUnderline $text: ${e.message}';
    }
  }

  @override
  Future<bool> printRightUnderline(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printRightUnderline', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printRightUnderline $text: ${e.message}';
    }
  }

  @override
  Future<bool> printCenterUnderline(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printCenterUnderline', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printCenterUnderline $text: ${e.message}';
    }
  }

  @override
  Future<bool> printLeftUnderlineBold(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printLeftUnderlineBold', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printLeftUnderlineBold $text: ${e.message}';
    }
  }

  @override
  Future<bool> printRightUnderlineBold(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printRightUnderlineBold', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printRightUnderlineBold $text: ${e.message}';
    }
  }

  @override
  Future<bool> printCenterUnderlineBold(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printCenterUnderlineBold', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printCenterUnderlineBold $text: ${e.message}';
    }
  }

  @override
  Future<bool> printDoubleHeightWidth(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printDoubleHeightWidth', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printDoubleHeightWidth $text: ${e.message}';
    }
  }

  @override
  Future<bool> printDoubleHeightWidthLeft(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printDoubleHeightWidthLeft', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printDoubleHeightWidthLeft $text: ${e.message}';
    }
  }

  @override
  Future<bool> printDoubleHeightWidthRight(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printDoubleHeightWidthRight', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printDoubleHeightWidthRight $text: ${e.message}';
    }
  }

  @override
  Future<bool> printDoubleHeightWidthCenter(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printDoubleHeightWidthCenter', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printDoubleHeightWidthCenter $text: ${e.message}';
    }
  }

  @override
  Future<bool> printDoubleHeightWidthBold(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printDoubleHeightWidthBold', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printDoubleHeightWidthBold $text: ${e.message}';
    }
  }

  @override
  Future<bool> printDoubleHeightWidthBoldLeft(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printDoubleHeightWidthBoldLeft', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printDoubleHeightWidthBoldLeft $text: ${e.message}';
    }
  }

  @override
  Future<bool> printDoubleHeightWidthBoldRight(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printDoubleHeightWidthBoldRight', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printDoubleHeightWidthBoldRight $text: ${e.message}';
    }
  }

  @override
  Future<bool> printDoubleHeightWidthBoldCenter(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('printDoubleHeightWidthBoldCenter', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print printDoubleHeightWidthBoldCenter $text: ${e.message}';
    }
  }

  @override
  Future<bool> ln(int lines) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('ln', <String, dynamic>{'lines': lines});
    } on PlatformException catch (e) {
      throw 'Unable to print ln $lines: ${e.message}';
    }
  }

  @override
  Future<bool> drawLine(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('drawLine', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print drawLine $text: ${e.message}';
    }
  }

  @override
  Future<bool> image(Uri uri) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('image', <String, dynamic>{'uri': uri.toString()});
    } on PlatformException catch (e) {
      throw 'Unable to print image $uri: ${e.message}';
    }
  }

  @override
  Future<bool> imageLeft(Uri uri) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('imageLeft', <String, dynamic>{'uri': uri.toString()});
    } on PlatformException catch (e) {
      throw 'Unable to print imageLeft $uri: ${e.message}';
    }
  }

  @override
  Future<bool> imageRight(Uri uri) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('imageRight', <String, dynamic>{'uri': uri.toString()});
    } on PlatformException catch (e) {
      throw 'Unable to print imageRight $uri: ${e.message}';
    }
  }

  @override
  Future<bool> imageCenter(Uri uri) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('imageCenter', <String, dynamic>{'uri': uri.toString()});
    } on PlatformException catch (e) {
      throw 'Unable to print imageCenter $uri: ${e.message}';
    }
  }

  @override
  Future<bool> flush() async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('flush');
    } on PlatformException catch (e) {
      throw 'Unable to flush: ${e.message}';
    }
  }
}
