// core/permissions/domain/repositories/permission_repository.dart

import 'package:folder_structure/core/permissions/domain/entities/permissions_status_enum.dart';
import 'package:folder_structure/core/permissions/permission_type.dart';

abstract class PermissionRepository {
  Future<PermissionStatusEntity> requestPermission(AppPermissionType type);
  Future<PermissionStatusEntity> checkPermission(AppPermissionType type);
}
