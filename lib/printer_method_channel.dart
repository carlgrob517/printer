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
  Future<void> println(String text) async {
    // Errors occurring on the platform side cause invokeMethod to throw PlatformExceptions.
    try {
      return await methodChannel.invokeMethod('println', <String, dynamic>{'text': text});
    } on PlatformException catch (e) {
      throw 'Unable to print $text: ${e.message}';
    }
  }
}
