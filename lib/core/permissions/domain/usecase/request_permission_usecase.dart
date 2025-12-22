import 'package:folder_structure/core/permissions/domain/entities/permissions_status_enum.dart';
import 'package:folder_structure/core/permissions/domain/repositories/permission_repository.dart';
import 'package:folder_structure/core/permissions/permission_type.dart';

class RequestPermissionUseCase {
  final PermissionRepository repository;

  RequestPermissionUseCase(this.repository);

  Future<PermissionStatusEntity> call(AppPermissionType type) {
    return repository.requestPermission(type);
  }
}
