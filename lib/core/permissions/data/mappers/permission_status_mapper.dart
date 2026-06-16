import 'package:permission_handler/permission_handler.dart';
import 'package:folder_structure/core/permissions/domain/entities/permissions_status_enum.dart';

extension PermissionHandlerStatusMapper on PermissionStatus {
  PermissionStatusEntity toEntity() {
    if (isGranted) return PermissionStatusEntity.granted;
    if (isPermanentlyDenied) return PermissionStatusEntity.permanentlyDenied;
    if (isRestricted) return PermissionStatusEntity.restricted;
    if (isLimited) return PermissionStatusEntity.limited;
    if (isProvisional) return PermissionStatusEntity.provisional;
    return PermissionStatusEntity.undetermined;
  }
}
