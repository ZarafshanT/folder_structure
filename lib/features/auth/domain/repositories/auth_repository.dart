import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> loginWithEmail(String email, String password);
  Future<Either<Failure, UserEntity>> registerWithEmail(String email, String password);
  Future<Either<Failure, UserEntity>> loginWithGoogle();
  Future<Either<Failure, UserEntity>> loginWithFacebook();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, UserEntity?>> getCurrentUser();
}
