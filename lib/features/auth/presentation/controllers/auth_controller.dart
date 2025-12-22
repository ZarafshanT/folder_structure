import 'package:get/get.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/login_with_email_usecase.dart';
import '../../domain/usecases/login_with_facebook_usecase.dart';
import '../../domain/usecases/login_with_google_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

class AuthController extends GetxController {
  final LoginWithEmailUseCase loginWithEmailUseCase;
  final RegisterUseCase registerUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  final LoginWithFacebookUseCase loginWithFacebookUseCase;

  AuthController({
    required this.loginWithEmailUseCase,
    required this.registerUseCase,
    required this.loginWithGoogleUseCase,
    required this.loginWithFacebookUseCase,
  });

  final Rx<UserEntity?> currentUser = Rx<UserEntity?>(null);
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';
    
    final result = await loginWithEmailUseCase(email, password);
    
    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        Get.snackbar('Error', failure.message);
      },
      (user) {
        currentUser.value = user;
        Get.offAllNamed('/home'); // Navigate to home
      },
    );
    
    isLoading.value = false;
  }

  Future<void> register(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';

    final result = await registerUseCase(email, password);

    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        Get.snackbar('Error', failure.message);
      },
      (user) {
        currentUser.value = user;
        Get.offAllNamed('/home');
      },
    );

    isLoading.value = false;
  }

  Future<void> loginWithGoogle() async {
    isLoading.value = true;
    final result = await loginWithGoogleUseCase();
    result.fold(
      (failure) => Get.snackbar('Error', failure.message),
      (user) {
        currentUser.value = user;
        Get.offAllNamed('/home');
      },
    );
    isLoading.value = false;
  }

  Future<void> loginWithFacebook() async {
    isLoading.value = true;
    final result = await loginWithFacebookUseCase();
    result.fold(
      (failure) => Get.snackbar('Error', failure.message),
      (user) {
        currentUser.value = user;
        Get.offAllNamed('/home');
      },
    );
    isLoading.value = false;
  }
}
