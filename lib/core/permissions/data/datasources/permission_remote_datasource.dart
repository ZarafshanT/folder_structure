import 'package:permission_handler/permission_handler.dart';

abstract class PermissionRemoteDataSource {
  Future<PermissionStatus> requestPermission(Permission permission);
  Future<PermissionStatus> checkPermission(Permission permission);
}

class PermissionRemoteDataSourceImpl implements PermissionRemoteDataSource {
  @override
  Future<PermissionStatus> requestPermission(Permission permission) {
    return permission.request();
  }

  @override
  Future<PermissionStatus> checkPermission(Permission permission) {
    return permission.status;
  }
}
