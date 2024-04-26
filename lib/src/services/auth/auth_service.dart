import 'package:mono/src/model/user_model.dart';

abstract class AuthService {
  Future<UserModel> signUp({
    required String? name,
    required String? email,
    required String? password,
  });

  Future<UserModel> signIn({
    required String? email,
    required String? password,
  });

  Future<void> signOut();

  Future<String> get userToken;
}
