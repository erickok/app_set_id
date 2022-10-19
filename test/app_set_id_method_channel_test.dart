import 'package:app_set_id/app_set_id_method_channel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  MethodChannelAppSetId platform = MethodChannelAppSetId();
  const MethodChannel channel = MethodChannel('app_set_id');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getIdentifier', () async {
    expect(await platform.getIdentifier(), '42');
  });
}
