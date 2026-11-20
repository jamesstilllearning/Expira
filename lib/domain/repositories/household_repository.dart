import 'package:expira/core/errors/failure.dart';
import 'package:expira/core/errors/result.dart';
import 'package:expira/domain/models/household.dart';
import 'package:expira/domain/models/app_settings.dart';

/// Repository interface for household operations.
abstract class HouseholdRepository {
  /// Creates a new household.
  Future<Result<Household>> create({
    required String name,
    required String createdBy,
  });

  /// Joins a household via invitation.
  Future<Result<Household>> joinByInvitation(String invitationId);

  /// Leaves the current household.
  Future<Result<void>> leave(String householdId, String userId);

  /// Gets the household by ID.
  Future<Result<Household?>> getById(String householdId);

  /// Watches the household as a stream.
  Stream<Result<Household?>> watch(String householdId);

  /// Updates household settings.
  Future<Result<Household>> updateSettings(String householdId, HouseholdSettings settings);

  /// Invites a user to the household.
  Future<Result<Invitation>> invite({
    required String householdId,
    required String email,
    required MemberRole role,
    required String invitedBy,
    required String invitedByName,
  });

  /// Gets all members of a household.
  Future<Result<List<Membership>>> getMembers(String householdId);

  /// Watches household members as a stream.
  Stream<Result<List<Membership>>> watchMembers(String householdId);

  /// Updates a member's role.
  Future<Result<void>> updateMemberRole(
    String householdId,
    String userId,
    MemberRole role,
  );

  /// Removes a member from the household.
  Future<Result<void>> removeMember(String householdId, String userId);

  /// Gets the current user's household memberships.
  Future<Result<List<Household>>> getUserHouseholds(String userId);
}