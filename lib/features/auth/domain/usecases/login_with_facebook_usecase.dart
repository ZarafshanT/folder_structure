import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginWithFacebookUseCase {
  final AuthRepository repository;

  LoginWithFacebookUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call() {
    return repository.loginWithFacebook();
  }
}
