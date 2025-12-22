import 'package:get/get.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/datasources/auth_remote_data_source_impl.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_with_email_usecase.dart';
import '../../domain/usecases/login_with_facebook_usecase.dart';
import '../../domain/usecases/login_with_google_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../controllers/auth_controller.dart';
import '../../../../../core/network/network_info/network_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Data Source
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(firebaseAuth: FirebaseAuth.instance),
    );

    // Repository
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteDataSource: Get.find<AuthRemoteDataSource>(),
        networkInfo: Get.find<NetworkInfo>(),
      ),
    );

    // Use Cases
    Get.lazyPut(() => LoginWithEmailUseCase(Get.find<AuthRepository>()));
    Get.lazyPut(() => RegisterUseCase(Get.find<AuthRepository>()));
    Get.lazyPut(() => LoginWithGoogleUseCase(Get.find<AuthRepository>()));
    Get.lazyPut(() => LoginWithFacebookUseCase(Get.find<AuthRepository>()));

    // Controller
    Get.lazyPut(
      () => AuthController(
        loginWithEmailUseCase: Get.find(),
        registerUseCase: Get.find(),
        loginWithGoogleUseCase: Get.find(),
        loginWithFacebookUseCase: Get.find(),
      ),
    );
  }
}
