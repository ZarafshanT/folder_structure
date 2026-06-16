import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:folder_structure/core/errors/failure.dart';
import 'package:folder_structure/core/permissions/domain/entities/permissions_status_enum.dart';
import 'package:folder_structure/core/permissions/domain/usecases/check_permission_use_case.dart';
import 'package:folder_structure/core/permissions/domain/usecases/request_permission_usecase.dart';
import 'package:folder_structure/core/permissions/permission_type.dart';

class PermissionController extends GetxController {
  final RequestPermissionUseCase requestPermissionUseCase;
  final CheckPermissionUseCase checkPermissionUseCase;

  PermissionController({
    required this.requestPermissionUseCase,
    required this.checkPermissionUseCase,
  });

  final permissionStatus = <AppPermissionType, PermissionStatusEntity>{
    AppPermissionType.camera: PermissionStatusEntity.undetermined,
    AppPermissionType.location: PermissionStatusEntity.undetermined,
    AppPermissionType.notifications: PermissionStatusEntity.undetermined,
    AppPermissionType.storage: PermissionStatusEntity.undetermined,
    AppPermissionType.microphone: PermissionStatusEntity.undetermined,
  }.obs;

  @override
  void onInit() {
    super.onInit();
    refreshAllPermissions();
  }

  Future<void> refreshAllPermissions() async {
    for (final type in permissionStatus.keys) {
      final result = await checkPermissionUseCase(type);
      result.fold(
        (failure) {
          _showError('Unable to verify ${type.name} permission', failure);
        },
        (status) {
          permissionStatus[type] = status;
        },
      );
    }
  }

  Future<void> request(AppPermissionType type) async {
    final result = await requestPermissionUseCase(type);
    result.fold((failure) => _showError('Request error', failure), (status) {
      permissionStatus[type] = status;
      Get.snackbar(
        'Permission Status',
        _messageFor(type, status),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black87,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      );
    });
  }

  String _messageFor(AppPermissionType type, PermissionStatusEntity status) {
    switch (status) {
      case PermissionStatusEntity.granted:
        return '${type.name} permission granted ✅';
      case PermissionStatusEntity.denied:
        return '${type.name} permission denied ❌';
      case PermissionStatusEntity.permanentlyDenied:
        return '${type.name} permission permanently denied 🚫\nGo to settings to enable it.';
      case PermissionStatusEntity.restricted:
        return '${type.name} permission restricted ⚠️';
      case PermissionStatusEntity.limited:
        return '${type.name} permission limited ⚠️';
      case PermissionStatusEntity.provisional:
        return '${type.name} permission provisionally granted ℹ️';
      case PermissionStatusEntity.undetermined:
        return '${type.name} permission status is undetermined';
    }
  }

  void _showError(String title, Failure failure) {
    Get.snackbar(
      title,
      failure.message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.shade700,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 4),
    );
  }
}
