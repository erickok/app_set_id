import 'package:app_set_id/app_set_id.dart';
import 'package:app_set_id/app_set_id_method_channel.dart';
import 'package:app_set_id/app_set_id_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAppSetIdPlatform
    with MockPlatformInterfaceMixin
    implements AppSetIdPlatform {
  @override
  Future<String> getIdentifier() => Future.value('42');
}

void main() {
  final AppSetIdPlatform initialPlatform = AppSetIdPlatform.instance;

  test('$MethodChannelAppSetId is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAppSetId>());
  });

  test('getIdentifier', () async {
    AppSetId appSetIdPlugin = AppSetId();
    MockAppSetIdPlatform fakePlatform = MockAppSetIdPlatform();
    AppSetIdPlatform.instance = fakePlatform;

    expect(await appSetIdPlugin.getIdentifier(), '42');
  });
}
