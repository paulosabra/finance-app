import 'package:flutter/foundation.dart';
import 'package:mono/src/features/sign_in/sign_in_state.dart';
import 'package:mono/src/services/auth/auth_service.dart';

class SignInController extends ChangeNotifier {
  final AuthService service;

  SignInController({required this.service});

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
      await service.signIn(
        email: email,
        password: password,
      );

      _emit(SignInSuccessState());
    } catch (error) {
      _emit(SignInErrorState(error.toString()));
    }
  }
}
