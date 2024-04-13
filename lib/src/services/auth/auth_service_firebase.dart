import 'package:firebase_auth/firebase_auth.dart';
import 'package:mono/src/model/user_model.dart';
import 'package:mono/src/services/auth/auth_service.dart';

class AuthServiceFirebase implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserModel> signUp({
    required String? name,
    required String? email,
    required String? password,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email ?? '',
        password: password ?? '',
      );

      if (result.user != null) {
        final User user = result.user!;
        await user.updateDisplayName(name);
        return UserModel(
          id: user.uid,
          name: user.displayName,
          email: user.email,
        );
      } else {
        throw Exception(result);
      }
    } on FirebaseAuthException catch (error) {
      throw error.message ?? '';
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signIn({
    required String? email,
    required String? password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email ?? '',
        password: password ?? '',
      );

      if (result.user != null) {
        final User user = result.user!;
        return UserModel(
          id: user.uid,
          name: user.displayName,
          email: user.email,
        );
      } else {
        throw Exception(result);
      }
    } on FirebaseAuthException catch (error) {
      throw error.message ?? '';
    } catch (error) {
      rethrow;
    }
  }
}
