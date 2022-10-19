import 'app_set_id_platform_interface.dart';

class AppSetId {
  /// Returns a [String] containing a device identifier that
  /// is unique per vendor. On Android this is the App Set ID
  /// (ASID), on iOS this is the Identifier for Vendor (IDfV)
  /// and on web it returns the user agent as no real device
  /// identifier exists.
  Future<String?> getIdentifier() {
    return AppSetIdPlatform.instance.getIdentifier();
  }
}
