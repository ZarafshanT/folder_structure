import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:folder_structure/core/network/network_info/network_info.dart';
import 'package:folder_structure/core/network/network_info/network_info_impl.dart';
import 'package:folder_structure/core/network/api_services/api_service.dart';
import 'package:folder_structure/core/network/api_services/ia_api_service.dart';
import 'package:folder_structure/core/network/dio_client/dio_client.dart';
import 'package:folder_structure/core/permissions/data/datasources/permission_remote_datasource.dart';
import 'package:folder_structure/core/permissions/data/repositories/permission_repository_impl.dart';
import 'package:folder_structure/core/permissions/domain/repositories/permission_repository.dart';
import 'package:folder_structure/core/permissions/domain/usecases/check_permission_use_case.dart';
import 'package:folder_structure/core/permissions/domain/usecases/request_permission_usecase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:folder_structure/core/storage/secure_storage.dart';
import 'package:folder_structure/core/storage/impl/secure_storage_impl.dart';
import 'package:folder_structure/core/storage/token_storage.dart';
import 'package:folder_structure/core/storage/impl/secure_token_storage_impl.dart';

import 'package:get/get.dart';
import 'package:dio/dio.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Inject Storage Services
    Get.lazyPut<FlutterSecureStorage>(() => const FlutterSecureStorage());
    Get.lazyPut<SecureStorage>(() => SecureStorageImpl(Get.find<FlutterSecureStorage>()));
    Get.lazyPut<TokenStorage>(() => SecureTokenStorageImpl(Get.find<SecureStorage>()));

    // Inject Dio instance with interceptors (DioClient will retrieve TokenStorage via Get.find)
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
    Get.lazyPut<PermissionRemoteDataSource>(() => PermissionRemoteDataSourceImpl());
    Get.lazyPut<PermissionRepository>(
      () => PermissionRepositoryImpl(Get.find<PermissionRemoteDataSource>()),
    );
    Get.lazyPut(
      () => RequestPermissionUseCase(Get.find<PermissionRepository>()),
    );
    Get.lazyPut(() => CheckPermissionUseCase(Get.find<PermissionRepository>()));

    // Network Info
    Get.lazyPut<Connectivity>(() => Connectivity());
    Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl());
  }
}
