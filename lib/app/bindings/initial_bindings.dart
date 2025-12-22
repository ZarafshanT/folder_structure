import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:folder_structure/core/network/network_info/network_info.dart';
import 'package:folder_structure/core/network/network_info/network_info_impl.dart';
import 'package:folder_structure/core/network/api_services/api__service.dart';
import 'package:folder_structure/core/network/api_services/ia_api_service.dart';
import 'package:folder_structure/core/network/dio_client/dio__client.dart';
import 'package:folder_structure/core/permissions/data/repositories/permission_repository_impl.dart';
import 'package:folder_structure/core/permissions/domain/repositories/permission_repository.dart';
import 'package:folder_structure/core/permissions/domain/usecase/check_permission_use_case.dart';
import 'package:folder_structure/core/permissions/domain/usecase/request_permission_usecase.dart';

import 'package:get/get.dart';
import 'package:dio/dio.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Inject Dio instance with interceptors
    Get.lazyPut<Dio>(() => DioClient().dioInstance);

    // Inject ApiService that depends on Dio
    // Core service
    Get.lazyPut<IApiService>(() => BaseApiService());

    // Feature service
    // Get.lazyPut<AuthApiService>(
    //   () => AuthApiService(api: Get.find<IApiService>()),
    // );

    // Register permission services

    // Permissions
    Get.lazyPut<PermissionRepository>(() => PermissionRepositoryImpl());
    Get.lazyPut(
      () => RequestPermissionUseCase(Get.find<PermissionRepository>()),
    );
    Get.lazyPut(() => CheckPermissionUseCase(Get.find<PermissionRepository>()));

    // Network Info
    Get.lazyPut<Connectivity>(() => Connectivity());
    Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl());
  }
}
