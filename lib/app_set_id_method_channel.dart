import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'app_set_id_platform_interface.dart';

class MethodChannelAppSetId extends AppSetIdPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('app_set_id');

  @override
  Future<String?> getIdentifier() async {
    final identifier = await methodChannel.invokeMethod<String>('getIdentifier');
    return identifier;
  }
}
