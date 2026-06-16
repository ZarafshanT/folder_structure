import 'package:get/get.dart';
import 'package:folder_structure/core/permissions/data/datasources/permission_remote_datasource.dart';
import 'package:folder_structure/core/permissions/data/repositories/permission_repository_impl.dart';
import 'package:folder_structure/core/permissions/domain/repositories/permission_repository.dart';
import 'package:folder_structure/core/permissions/domain/usecases/check_permission_use_case.dart';
import 'package:folder_structure/core/permissions/domain/usecases/request_permission_usecase.dart';
import '../controllers/permission_controller.dart';

class PermissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermissionRemoteDataSource>(
      () => PermissionRemoteDataSourceImpl(),
    );
    Get.lazyPut<PermissionRepository>(
      () => PermissionRepositoryImpl(Get.find<PermissionRemoteDataSource>()),
    );
    Get.lazyPut(
      () => RequestPermissionUseCase(Get.find<PermissionRepository>()),
    );
    Get.lazyPut(() => CheckPermissionUseCase(Get.find<PermissionRepository>()));
    Get.lazyPut(
      () => PermissionController(
        requestPermissionUseCase: Get.find<RequestPermissionUseCase>(),
        checkPermissionUseCase: Get.find<CheckPermissionUseCase>(),
      ),
    );
  }
}
