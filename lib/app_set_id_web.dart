// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'package:web/web.dart' as web;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'app_set_id_platform_interface.dart';

/// A web implementation of the AppSetIdPlatform of the AppSetId plugin.
class AppSetIdWeb extends AppSetIdPlatform {
  AppSetIdWeb();

  static void registerWith(Registrar registrar) {
    AppSetIdPlatform.instance = AppSetIdWeb();
  }

  /// Returns a [String] containing (on web) the browser user agent, as no
  /// real device identifier exists.
  @override
  Future<String?> getIdentifier() async {
    final version = web.window.navigator.userAgent;
    return version;
  }
}
