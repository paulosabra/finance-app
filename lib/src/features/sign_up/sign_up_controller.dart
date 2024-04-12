import 'package:flutter/foundation.dart';
import 'package:mono/src/features/sign_up/sign_up_state.dart';
import 'package:mono/src/services/auth/auth_service.dart';

class SignUpController extends ChangeNotifier {
  final AuthService service;

  SignUpController({required this.service});

  SignUpState _state = SignUpInitialState();

  SignUpState get state => _state;

  void _emit(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future signUp({
    required String? name,
    required String? email,
    required String? password,
  }) async {
    _emit(SignUpLoadingState());
    try {
      await service.signUp(
        name: name,
        email: email,
        password: password,
      );

      _emit(SignUpSuccessState());
    } catch (e) {
      _emit(SignUpErrorState());
    }
  }
}
