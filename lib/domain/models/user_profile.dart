import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'app_settings.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// User profile model.
@freezed
abstract class UserProfile with _$UserProfile {
  const UserProfile._();

  const factory UserProfile({
    /// Unique user ID (Firebase Auth UID)
    @Default('') String uid,

    /// Email address
    @Default('') String email,

    /// Display name
    @Default('') String displayName,

    /// Photo URL
    @Default('') String photoURL,

    /// Creation timestamp
    DateTime? createdAt,

    /// User settings
    @JsonKey(
      fromJson: _userSettingsFromJson,
      toJson: _userSettingsToJson,
    )
    @Default(UserSettings()) UserSettings settings,

    /// List of household IDs this user belongs to
    @Default([]) List<String> householdIds,

    /// FCM token for push notifications
    @Default('') String fcmToken,

    /// Platform (ios, android, web)
    @Default('') String platform,

    /// Last login timestamp
    DateTime? lastLoginAt,

    /// Server document ID
    @Default('') String serverId,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

  /// Returns the user's initials for avatar fallback.
  String get initials {
    final parts = displayName.trim().split(' ');
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return '${parts.first.substring(0, 1)}${parts.last.substring(0, 1)}'.toUpperCase();
  }

  /// Returns true if the user has completed onboarding.
  bool get hasCompletedOnboarding => displayName.isNotEmpty;
}

UserSettings _userSettingsFromJson(Map<String, dynamic> json) =>
    UserSettings.fromJson(json);

Map<String, dynamic> _userSettingsToJson(UserSettings value) => value.toJson();