import 'package:mono/src/model/user_model.dart';
import 'package:mono/src/services/auth/auth_service.dart';

class AuthServiceMock implements AuthService {
  @override
  Future<UserModel> signUp({
    required String? name,
    required String? email,
    required String? password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      if (password != null && password.contains('123')) {
        throw Exception();
      }
      return UserModel(
        id: email.hashCode,
        name: name,
        email: email,
        password: password,
      );
    } catch (error) {
      if (password != null && password.contains('123')) {
        throw 'Insecure Password. Enter a stronger password.';
      }

      throw 'We were unable to create your account. Please try again later.';
    }
  }
}
