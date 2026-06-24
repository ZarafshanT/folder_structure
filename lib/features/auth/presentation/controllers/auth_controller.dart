import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../../app/routes/app_routes.dart';
import '../../data/models/user_model.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/login_with_email_usecase.dart';
import '../../domain/usecases/login_with_google_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

class AuthController extends GetxController {
  final LoginWithEmailUseCase loginWithEmailUseCase;
  final RegisterUseCase registerUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;

  AuthController({
    required this.loginWithEmailUseCase,
    required this.registerUseCase,
    required this.loginWithGoogleUseCase,
  });

  final Rx<UserEntity?> currentUser = Rx<UserEntity?>(null);
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    print('AUTH_CONTROLLER: onInit called');
    FirebaseAuth.instance.authStateChanges().listen((user) {
      print(
        'AUTH_CONTROLLER: authStateChanges event user=${user?.uid} email=${user?.email}',
      );
      if (user != null) {
        currentUser.value = UserModel(
          id: user.uid,
          email: user.email ?? '',
          name: user.displayName,
          photoUrl: user.photoURL,
        );
        print(
          'AUTH_CONTROLLER: currentUser set to ${currentUser.value?.email}',
        );
      } else {
        currentUser.value = null;
        print('AUTH_CONTROLLER: currentUser cleared');
      }
    });
  }

  Future<void> login(String email, String password) async {
    if (email.trim().isEmpty || password.isEmpty) {
      Get.snackbar(
        'Missing information',
        'Please enter both email and password.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    final result = await loginWithEmailUseCase(email.trim(), password);

    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        Get.snackbar(
          'Login failed',
          failure.message,
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      (user) {
        currentUser.value = user;
        Get.offAllNamed('/home'); // Navigate to home
      },
    );

    isLoading.value = false;
  }

  Future<void> register(String email, String password) async {
    if (email.trim().isEmpty || password.isEmpty) {
      Get.snackbar(
        'Missing information',
        'Please enter your email and password.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    final result = await registerUseCase(email.trim(), password);

    result.fold(
      (failure) {
        errorMessage.value = failure.message;
        Get.snackbar(
          'Sign up failed',
          failure.message,
          snackPosition: SnackPosition.BOTTOM,
        );
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
    result.fold((failure) => Get.snackbar('Error', failure.message), (user) {
      currentUser.value = user;
      Get.offAllNamed(AppRoutes.home);
    });
    isLoading.value = false;
  }
}
