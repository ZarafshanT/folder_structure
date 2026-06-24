import 'package:dartz/dartz.dart';
import '../../../../core/errors/error_message.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info/network_info.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  Future<Either<Failure, T>> _execute<T>(Future<T> Function() action) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(ErrorMessages.noInternet));
    }

    try {
      return Right(await action());
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmail(
    String email,
    String password,
  ) async {
    return _execute(() => remoteDataSource.loginWithEmail(email, password));
  }

  @override
  Future<Either<Failure, UserEntity>> registerWithEmail(
    String email,
    String password,
  ) async {
    return _execute(() => remoteDataSource.registerWithEmail(email, password));
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    return _execute(() => remoteDataSource.loginWithGoogle());
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    return _execute(() => remoteDataSource.loginWithFacebook());
  }

  @override
  Future<Either<Failure, void>> logout() async {
    // TODO: Implement logout logic (clear tokens, etc.)
    return const Right(null);
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    // TODO: Implement persistency check (read token from storage)
    return const Right(null);
  }
}
