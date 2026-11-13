# Expiry reminder platform setup

Apply these changes to `android/` and `ios/`. My copy of the project has no
platform folders, so these are not already in place.

## Android

### 1. `android/app/src/main/AndroidManifest.xml`

Add inside `<manifest>`, above `<application>`:

```xml
<uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED" />
```

Add inside `<application>`, so scheduled reminders survive a device reboot:

```xml
<receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver" />
<receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
    <intent-filter>
        <action android:name="android.intent.action.BOOT_COMPLETED" />
        <action android:name="android.intent.action.MY_PACKAGE_REPLACED" />
        <action android:name="android.intent.action.QUICKBOOT_POWERON" />
    </intent-filter>
</receiver>
```

POST_NOTIFICATIONS is requested at runtime on Android 13+. The app asks when
the user turns on Expiry reminders in Settings.

### 2. `android/app/build.gradle` (or `build.gradle.kts`)

`flutter_local_notifications` 17 needs core library desugaring:

```groovy
android {
    compileOptions {
        coreLibraryDesugaringEnabled true
    }
}

dependencies {
    coreLibraryDesugaring 'com.android.tools:desugar_jdk_libs:2.0.4'
}
```

Kotlin DSL: `isCoreLibraryDesugaringEnabled = true` inside `compileOptions`,
and `coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.0.4")`.

Exact alarms are not used. The plugin is configured for inexact scheduling,
so no `SCHEDULE_EXACT_ALARM` permission is needed.

## iOS

No manifest changes are needed. The notification permission prompt appears
the first time the user enables Expiry reminders. Test on a physical device.

## Verify

Run `flutter clean`, then `flutter pub get`, then install on a device. Turn on
Expiry reminders, add an item that expires in two days, and confirm the
reminder is scheduled. Reboot the device and confirm the reminder still
appears.
