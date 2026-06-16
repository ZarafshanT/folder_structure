import 'package:permission_handler/permission_handler.dart';
import 'package:folder_structure/core/permissions/permission_type.dart';

extension AppPermissionTypeMapper on AppPermissionType {
  Permission toPermission() {
    switch (this) {
      case AppPermissionType.location:
        return Permission.location;
      case AppPermissionType.camera:
        return Permission.camera;
      case AppPermissionType.storage:
        return Permission.storage;
      case AppPermissionType.notifications:
        return Permission.notification;
      case AppPermissionType.microphone:
        return Permission.microphone;
    }
  }
}
