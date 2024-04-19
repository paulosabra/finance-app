import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mono/src/features/splash/splash_controller.dart';
import 'package:mono/src/features/splash/splash_state.dart';
import 'package:mono/src/model/user_model.dart';
import 'package:mono/src/services/secure_storage.dart';

import '../../mocks.dart';

void main() {
  late SplashController controller;

  late SecureStorage storage;

  setUp(() {
    storage = MockSecureStorage();

    controller = SplashController(
      storage: storage,
    );
  });

  final userMock = UserModel(
    id: '123',
    name: 'User Test',
    email: 'user.test@email.com',
  );

  group('Splash Controller', () {
    test('should emits Initial State', () {
      expect(controller.state, isInstanceOf<SplashInitialState>());
    });

    test('should emits NavigateToSignIn State', () async {
      expect(controller.state, isInstanceOf<SplashInitialState>());

      when(() {
        return storage.read(key: 'CURRENT_USER');
      }).thenAnswer((_) async {
        return userMock.toJson();
      });

      await controller.isUserLogged();

      expect(controller.state, isInstanceOf<NavigateToSignInState>());
    });

    test('should emits NavigateToOnboarding State', () async {
      expect(controller.state, isInstanceOf<SplashInitialState>());

      when(() {
        return storage.read(key: 'CURRENT_USER');
      }).thenAnswer((_) async {
        return null;
      });

      await controller.isUserLogged();

      expect(controller.state, isInstanceOf<NavigateToOnboardingState>());
    });
  });
}
