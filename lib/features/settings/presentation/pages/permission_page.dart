import 'package:flutter/material.dart';
import 'package:folder_structure/core/permissions/domain/entities/permissions_status_enum.dart';
import 'package:folder_structure/core/permissions/domain/usecase/request_permission_usecase.dart';
import 'package:folder_structure/core/permissions/permission_type.dart';
import 'package:get/get.dart';

// class PermissionsPage extends StatelessWidget {
//   const PermissionsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final requestPermission = Get.find<RequestPermissionUseCase>();

//     void request(AppPermissionType type) async {
//       final result = await requestPermission(type);

//       String message = '';
//       switch (result) {
//         case PermissionStatusEntity.granted:
//           message = "${type.name} permission granted ✅";
//           break;
//         case PermissionStatusEntity.denied:
//           message = "${type.name} permission denied ❌";
//           break;
//         case PermissionStatusEntity.permanentlyDenied:
//           message =
//               "${type.name} permission permanently denied 🚫\nGo to settings to enable it.";
//           break;
//       }

//       Get.snackbar(
//         "Permission Status",
//         message,
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.black87,
//         colorText: Colors.white,
//         margin: const EdgeInsets.all(16),
//         duration: const Duration(seconds: 3),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(title: const Text("Permissions")),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           ElevatedButton(
//             onPressed: () => request(AppPermissionType.camera),
//             child: const Text("Request Camera Permission"),
//           ),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () => request(AppPermissionType.location),
//             child: const Text("Request Location Permission"),
//           ),
//           const SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () => request(AppPermissionType.notifications),
//             child: const Text("Request Notification Permission"),
//           ),
//         ],
//       ),
//     );
//   }
// }

class PermissionsPage extends StatefulWidget {
  const PermissionsPage({super.key});

  @override
  State<PermissionsPage> createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
  final requestPermission = Get.find<RequestPermissionUseCase>();

  // Switch states
  bool cameraGranted = false;
  bool locationGranted = false;
  bool notificationsGranted = false;

  void request(AppPermissionType type) async {
    final result = await requestPermission(type);

    String message = '';
    switch (result) {
      case PermissionStatusEntity.granted:
        message = "${type.name} permission granted ✅";
        break;
      case PermissionStatusEntity.denied:
        message = "${type.name} permission denied ❌";
        break;
      case PermissionStatusEntity.permanentlyDenied:
        message =
            "${type.name} permission permanently denied 🚫\nGo to settings to enable it.";
        break;
    }

    Get.snackbar(
      "Permission Status",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black87,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 3),
    );

    // Update switch state after permission request
    setState(() {
      switch (type) {
        case AppPermissionType.camera:
          cameraGranted = result == PermissionStatusEntity.granted;
          break;
        case AppPermissionType.location:
          locationGranted = result == PermissionStatusEntity.granted;
          break;
        case AppPermissionType.notifications:
          notificationsGranted = result == PermissionStatusEntity.granted;
          break;
        case AppPermissionType.storage:
          // TODO: Handle this case.
          throw UnimplementedError();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Permissions")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text("Camera Permission"),
            value: cameraGranted,
            onChanged: (value) {
              setState(() => cameraGranted = value);
              if (value) request(AppPermissionType.camera); // Only request ON
            },
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text("Location Permission"),
            value: locationGranted,
            onChanged: (value) {
              setState(() => locationGranted = value);
              if (value) request(AppPermissionType.location);
            },
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text("Notification Permission"),
            value: notificationsGranted,
            onChanged: (value) {
              setState(() => notificationsGranted = value);
              if (value) request(AppPermissionType.notifications);
            },
          ),
        ],
      ),
    );
  }
}
