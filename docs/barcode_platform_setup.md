# Barcode scanner platform setup

The barcode scanner uses `mobile_scanner`. These changes go in your
`android/` and `ios/` folders. They are not in the Dart code, because the
project copy I worked from did not include those folders.

## Android

### 1. `android/app/src/main/AndroidManifest.xml`

Add these two lines inside `<manifest>`, above `<application>`:

```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-feature android:name="android.hardware.camera" android:required="false" />
<uses-feature android:name="android.hardware.camera.flash" android:required="false" />
```

`required="false"` lets the app install on devices without a camera or flash.
The scanner handles those cases at runtime.

### 2. `android/app/build.gradle` (or `build.gradle.kts`)

`mobile_scanner` needs `minSdk` 21 or higher. Set it to at least 21:

```groovy
defaultConfig {
    minSdk 21
}
```

Kotlin DSL: `minSdk = 21`.

## iOS

### 3. `ios/Runner/Info.plist`

Add this key inside the top-level `<dict>`. iOS shows the text when it asks
for camera access:

```xml
<key>NSCameraUsageDescription</key>
<string>ExPIRA uses the camera to scan product barcodes.</string>
```

### 4. `ios/Podfile`

`mobile_scanner` needs iOS 13 or later:

```ruby
platform :ios, '13.0'
```

Then run `cd ios && pod install` from the project root.

## Verify

After these changes, run `flutter clean`, then `flutter pub get`, then
`flutter run` on a physical device. Simulators and emulators often have no
camera, so test the scanner on real hardware.
