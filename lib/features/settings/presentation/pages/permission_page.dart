import 'package:flutter/material.dart';
import 'package:folder_structure/core/permissions/domain/entities/permissions_status_enum.dart';
import 'package:folder_structure/core/permissions/permission_type.dart';
import 'package:folder_structure/features/settings/presentation/controllers/permission_controller.dart';
import 'package:get/get.dart';

class PermissionsPage extends StatelessWidget {
  PermissionsPage({super.key});

  final controller = Get.find<PermissionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Permissions')),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _permissionTile(AppPermissionType.camera, 'Camera Permission'),
            const SizedBox(height: 16),
            _permissionTile(AppPermissionType.location, 'Location Permission'),
            const SizedBox(height: 16),
            _permissionTile(
              AppPermissionType.notifications,
              'Notification Permission',
            ),
            const SizedBox(height: 16),
            _permissionTile(AppPermissionType.microphone, 'Microphone Permission'),
          ],
        ),
      ),
    );
  }

  Widget _permissionTile(AppPermissionType type, String title) {
    final status = controller.permissionStatus[type]!;
    return SwitchListTile(
      title: Text(title),
      value: status == PermissionStatusEntity.granted,
      onChanged: (value) {
        if (value) {
          controller.request(type);
        }
      },
      subtitle: Text(status.name),
    );
  }
}
