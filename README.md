# app_set_id

[![pub package](https://img.shields.io/pub/v/app_set_id.svg)](https://pub.dev/packages/app_set_id)

A tiny Flutter library to retrieve a vendor-specific privacy-friendly device-unique identifier, also called IDfV or App Set ID.

### Android

On Android it returns the App Set ID (ASID). As per [the developer documentation](https://developer.android.com/training/articles/app-set-id):

> For apps that are installed by the Google Play store, the app set ID API returns an ID scoped to the set of apps published under the same Google Play developer account.

### iOS

On iOS/iPadOS it returns the Identifier for Vendor (IDfV). as per [the developer documentation](https://developer.apple.com/documentation/uikit/uidevice/1620059-identifierforvendor):

> The value of this property is the same for apps that come from the same vendor running on the same device. (...) Normally, the vendor is determined by data provided by the App Store.

### MacOS

No true IDfV exists on MacOS, so it returns the MAC address of the first network interface (in hexadecimal format, without separators). This is not a real IDfV, but Apple recommends using it as a fallback in [the developer documentation](https://developer.apple.com/documentation/appstorereceipts/validating_receipts_on_the_device#//apple_ref/doc/uid/TP40010573-CH1-SW14), even in the context of validating purchases.

### Web

For ease of integration in web projects, on web it returns the browser user agent. This is NOT a good identifier and only here for development purposes.

## Installation

Add to your pubspec.yaml file:

```yaml
dependencies:
  app_set_id: ^1.2.0
```

Import the library and call `getIdentifer`:

```dart
import 'package:app_set_id/app_set_id.dart';

final appSetId = await AppSetId().getIdentifier();
```
