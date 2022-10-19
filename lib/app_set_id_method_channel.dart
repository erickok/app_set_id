import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_set_id_platform_interface.dart';

class MethodChannelAppSetId extends AppSetIdPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('app_set_id');

  /// Returns a [String] containing the App Set ID (ASID, on Android) or
  /// Identifier for Vendor (IDfV, on iOS).
  @override
  Future<String?> getIdentifier() async {
    final identifier =
        await methodChannel.invokeMethod<String>('getIdentifier');
    return identifier;
  }
}
