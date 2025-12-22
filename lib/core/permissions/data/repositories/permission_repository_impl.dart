import 'package:folder_structure/core/permissions/domain/entities/permissions_status_enum.dart';
// lib/core/permissions/data/repositories/permission_repository_impl.dart
import 'package:permission_handler/permission_handler.dart';
import '../../domain/repositories/permission_repository.dart';
import '../../permission_type.dart';

class PermissionRepositoryImpl implements PermissionRepository {
  @override
  Future<PermissionStatusEntity> requestPermission(
    AppPermissionType type,
  ) async {
    Permission permission;

    switch (type) {
      case AppPermissionType.location:
        permission = Permission.location;
        break;
      case AppPermissionType.camera:
        permission = Permission.camera;
        break;
      case AppPermissionType.storage:
        permission = Permission.storage;
        break;
      case AppPermissionType.notifications:
        permission = Permission.notification;
        break;
    }

    final status = await permission.request();

    if (status.isGranted) return PermissionStatusEntity.granted;
    if (status.isPermanentlyDenied) {
      return PermissionStatusEntity.permanentlyDenied;
    }
    return PermissionStatusEntity.denied;
  }

  @override
  Future<PermissionStatusEntity> checkPermission(AppPermissionType type) async {
    Permission permission;

    switch (type) {
      case AppPermissionType.location:
        permission = Permission.location;
        break;
      case AppPermissionType.camera:
        permission = Permission.camera;
        break;
      case AppPermissionType.storage:
        permission = Permission.storage;
        break;
      case AppPermissionType.notifications:
        permission = Permission.notification;
        break;
    }

    final status = await permission.status;

    if (status.isGranted) return PermissionStatusEntity.granted;
    if (status.isPermanentlyDenied) {
      return PermissionStatusEntity.permanentlyDenied;
    }
    return PermissionStatusEntity.denied;
  }
}
