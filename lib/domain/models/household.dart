import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'app_settings.dart';

part 'household.freezed.dart';
part 'household.g.dart';

/// Household model for multi-user synchronization.
@freezed
abstract class Household with _$Household {
  const Household._();

  const factory Household({
    /// Unique household ID
    @Default('') String id,

    /// Household name
    @Default('') String name,

    /// Creator user ID
    @Default('') String createdBy,

    /// Creation timestamp
    DateTime? createdAt,

    /// Household settings
    @JsonKey(
      fromJson: _householdSettingsFromJson,
      toJson: _householdSettingsToJson,
    )
    @Default(HouseholdSettings()) HouseholdSettings settings,

    /// Number of admins (for security rules)
    @Default(1) int adminCount,

    /// Server document ID
    @Default('') String serverId,
  }) = _Household;

  factory Household.fromJson(Map<String, dynamic> json) => _$HouseholdFromJson(json);
}

/// Household membership (user + role).
@freezed
abstract class Membership with _$Membership {
  const Membership._();

  const factory Membership({
    /// Household ID
    @Default('') String householdId,

    /// User ID
    @Default('') String userId,

    /// Role in household
    @Default(MemberRole.member()) MemberRole role,

    /// When the user joined
    DateTime? joinedAt,

    /// Who invited this user
    @Default('') String invitedBy,

    /// Membership status
    @Default(MembershipStatus.active()) MembershipStatus status,

    /// Server document ID
    @Default('') String serverId,
  }) = _Membership;

  factory Membership.fromJson(Map<String, dynamic> json) => _$MembershipFromJson(json);

  /// Returns true if this member is an admin.
  bool get isAdmin => switch (role) { Admin() => true, _ => false };

  /// Returns true if this member is active.
  bool get isActive => switch (status) { Active() => true, _ => false };
}

/// Member role in household.
@freezed
abstract class MemberRole with _$MemberRole {
  const MemberRole._();

  const factory MemberRole.admin() = Admin;
  const factory MemberRole.member() = Member;

  factory MemberRole.fromJson(Map<String, dynamic> json) => _$MemberRoleFromJson(json);

  static MemberRole fromString(String value) {
    return switch (value.toLowerCase()) {
      'admin' => const Admin(),
      _ => const Member(),
    };
  }

  String get value => switch (this) {
        Admin() => 'admin',
        Member() => 'member',
        _ => 'member',
      };
}

/// Membership status.
@freezed
abstract class MembershipStatus with _$MembershipStatus {
  const MembershipStatus._();

  const factory MembershipStatus.membershipPending() = MembershipPending;
  const factory MembershipStatus.active() = Active;
  const factory MembershipStatus.removed() = Removed;

  factory MembershipStatus.fromJson(Map<String, dynamic> json) => _$MembershipStatusFromJson(json);
}

/// Household invitation.
@freezed
abstract class Invitation with _$Invitation {
  const Invitation._();

  const factory Invitation({
    /// Unique invitation ID
    @Default('') String id,

    /// Household ID
    @Default('') String householdId,

    /// Invitee email
    @Default('') String email,

    /// Role to assign
    @Default(MemberRole.member()) MemberRole role,

    /// Inviter user ID
    @Default('') String invitedBy,

    /// Inviter name (for display)
    @Default('') String invitedByName,

    /// Creation timestamp
    DateTime? createdAt,

    /// Expiry timestamp
    DateTime? expiresAt,

    /// Invitation status
    @Default(InvitationStatus.pending()) InvitationStatus status,

    /// Server document ID
    @Default('') String serverId,
  }) = _Invitation;

  factory Invitation.fromJson(Map<String, dynamic> json) => _$InvitationFromJson(json);

  /// Returns true if the invitation is still valid.
  bool get isValid {
    if (switch (status) { InvitationPending() => true, _ => false }) return false;
    if (expiresAt == null) return true;
    return DateTime.now().isBefore(expiresAt!);
  }
}

/// Invitation status.
@freezed
abstract class InvitationStatus with _$InvitationStatus {
  const InvitationStatus._();

  const factory InvitationStatus.pending() = InvitationPending;
  const factory InvitationStatus.accepted() = Accepted;
  const factory InvitationStatus.declined() = Declined;
  const factory InvitationStatus.expired() = Expired;

  factory InvitationStatus.fromJson(Map<String, dynamic> json) => _$InvitationStatusFromJson(json);
}

// JSON converters for nested classes
HouseholdSettings _householdSettingsFromJson(Map<String, dynamic> json) =>
    HouseholdSettings.fromJson(json);

Map<String, dynamic> _householdSettingsToJson(HouseholdSettings value) => value.toJson();