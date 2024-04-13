import 'package:flutter/foundation.dart';
import 'package:mono/src/features/splash/splash_state.dart';
import 'package:mono/src/services/secure_storage.dart';

class SplashController extends ChangeNotifier {
  final SecureStorage storage;

  SplashController({
    required this.storage,
  });

  SplashState _state = SplashInitialState();

  SplashState get state => _state;

  void _emit(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  void isUserLogged() async {
    final result = await storage.read(key: "CURRENT_USER");
    if (result != null) {
      _emit(SplashSuccessState());
    } else {
      _emit(SplashErrorState());
    }
  }
}
