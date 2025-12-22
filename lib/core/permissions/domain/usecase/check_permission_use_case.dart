// lib/core/permissions/domain/usecases/check_permission_use_case.dart
import '../entities/permissions_status_enum.dart';
import '../repositories/permission_repository.dart';
import '../../permission_type.dart';

class CheckPermissionUseCase {
  final PermissionRepository repository;

  CheckPermissionUseCase(this.repository);

  Future<PermissionStatusEntity> call(AppPermissionType type) {
    return repository.checkPermission(type);
  }
}
