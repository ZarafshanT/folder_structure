import 'package:dartz/dartz.dart';
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

  @override
  Future<Either<Failure, UserEntity>> loginWithEmail(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.loginWithEmail(email, password);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
       // Assuming 'NetworkFailure' implies no connection, but Failure concrete types
       // might not represent that yet. Using generic ServerFailure for now or 
       // I should check failure definitions.
       return Left(ServerFailure("No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> registerWithEmail(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.registerWithEmail(email, password);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(ServerFailure("No Internet Connection"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.loginWithGoogle();
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
       return Left(ServerFailure("No Internet Connection"));
    }
  }
  
  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser = await remoteDataSource.loginWithFacebook();
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
       return Left(ServerFailure("No Internet Connection"));
    }
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
