import 'package:flutter/foundation.dart';
import 'package:mono/src/features/sign_up/sign_up_state.dart';

class SignUpController extends ChangeNotifier {
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
      Future.delayed(const Duration(seconds: 2));

      _emit(SignUpSuccessState());
    } catch (e) {
      _emit(SignUpErrorState());
    }
  }
}
