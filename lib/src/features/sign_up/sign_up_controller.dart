import 'package:flutter/foundation.dart';
import 'package:mono/src/features/sign_up/sign_up_state.dart';
import 'package:mono/src/services/auth/auth_service.dart';
import 'package:mono/src/services/secure_storage.dart';

class SignUpController extends ChangeNotifier {
  SignUpController({
    required this.service,
    required this.storage,
  });
  final AuthService service;
  final SecureStorage storage;

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
      final user = await service.signUp(
        name: name,
        email: email,
        password: password,
      );

      if (user.id != null) {
        await storage.write(
          key: 'CURRENT_USER',
          value: user.toJson(),
        );
        _emit(SignUpSuccessState());
      } else {
        throw Exception();
      }
    } catch (error) {
      _emit(SignUpErrorState(error.toString()));
    }
  }
}
