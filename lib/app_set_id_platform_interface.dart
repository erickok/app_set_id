import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'app_set_id_method_channel.dart';

abstract class AppSetIdPlatform extends PlatformInterface {
  AppSetIdPlatform() : super(token: _token);

  static final Object _token = Object();

  static AppSetIdPlatform _instance = MethodChannelAppSetId();

  static AppSetIdPlatform get instance => _instance;

  static set instance(AppSetIdPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getIdentifier() {
    throw UnimplementedError('getIdentifier() has not been implemented.');
  }
}
