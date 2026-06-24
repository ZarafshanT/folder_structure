import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/user_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({required this.firebaseAuth});

  UserModel _toUserModel(User user) {
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      name: user.displayName,
      photoUrl: user.photoURL,
    );
  }

  @override
  Future<UserModel> loginWithEmail(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return _toUserModel(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? "Authentication Failed");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> registerWithEmail(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return _toUserModel(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.message ?? "Registration Failed");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> loginWithFacebook() async {
    // Implement Facebook login if needed using flutter_facebook_auth
    throw AuthException("Facebook Login not implemented yet");
  }

  @override
  Future<UserModel> loginWithGoogle() async {
    // Implement Google login if needed using google_sign_in
    throw AuthException("Google Login not implemented yet");
  }
}
