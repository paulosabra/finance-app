import 'package:flutter/foundation.dart';
import 'package:mono/src/features/sign_in/sign_in_state.dart';
import 'package:mono/src/services/auth/auth_service.dart';
import 'package:mono/src/services/secure_storage.dart';

class SignInController extends ChangeNotifier {
  SignInController({
    required this.service,
    required this.storage,
  });
  final AuthService service;
  final SecureStorage storage;

  SignInState _state = SignInInitialState();

  SignInState get state => _state;

  void _emit(SignInState newState) {
    _state = newState;
    notifyListeners();
  }

  Future signIn({
    required String? email,
    required String? password,
  }) async {
    _emit(SignInLoadingState());
    try {
      final user = await service.signIn(
        email: email,
        password: password,
      );

      if (user.id != null) {
        await storage.write(
          key: 'CURRENT_USER',
          value: user.name,
        );
        _emit(SignInSuccessState());
      } else {
        throw Exception();
      }
    } catch (error) {
      _emit(SignInErrorState(error.toString()));
    }
  }
}
