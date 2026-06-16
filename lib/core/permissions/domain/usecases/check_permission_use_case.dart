import 'package:dartz/dartz.dart';
import 'package:folder_structure/core/errors/failure.dart';
import '../entities/permissions_status_enum.dart';
import '../repositories/permission_repository.dart';
import '../../permission_type.dart';

class CheckPermissionUseCase {
  final PermissionRepository repository;

  CheckPermissionUseCase(this.repository);

  Future<Either<Failure, PermissionStatusEntity>> call(AppPermissionType type) {
    return repository.checkPermission(type);
  }
}
