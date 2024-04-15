import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mono/src/features/sign_in/sign_in_controller.dart';
import 'package:mono/src/features/sign_in/sign_in_state.dart';
import 'package:mono/src/model/user_model.dart';
import 'package:mono/src/services/auth/auth_service.dart';
import 'package:mono/src/services/secure_storage.dart';

import '../../mocks.dart';

void main() {
  late SignInController controller;

  late AuthService service;
  late SecureStorage storage;

  setUp(() {
    service = MockAuthServiceFirebase();
    storage = MockSecureStorage();

    controller = SignInController(
      service: service,
      storage: storage,
    );
  });

  final UserModel userMock = UserModel(
    id: '123',
    name: 'User Test',
    email: 'user.test@email.com',
  );

  group('Sign In Controller', () {
    test('should emits Initial State', () async {
      expect(controller.state, isInstanceOf<SignInInitialState>());
    });

    test('should emits Success State', () async {
      expect(controller.state, isInstanceOf<SignInInitialState>());

      when(() {
        return storage.write(
          key: 'CURRENT_USER',
          value: userMock.toJson(),
        );
      }).thenAnswer((_) async {});

      when(() {
        return service.signIn(
          email: 'user.test@email.com',
          password: 'Test@123',
        );
      }).thenAnswer((_) async {
        return userMock;
      });

      await controller.signIn(
        email: 'user.test@email.com',
        password: 'Test@123',
      );

      expect(controller.state, isInstanceOf<SignInSuccessState>());
    });

    test('should emits Error State', () async {
      expect(controller.state, isInstanceOf<SignInInitialState>());

      when(() {
        return storage.write(
          key: 'CURRENT_USER',
          value: userMock.toJson(),
        );
      }).thenAnswer((_) async {});

      when(() {
        return service.signIn(
          email: 'user.test@email.com',
          password: 'Test@123',
        );
      }).thenThrow(Exception());

      await controller.signIn(
        email: 'user.test@email.com',
        password: 'Test@123',
      );

      expect(controller.state, isInstanceOf<SignInErrorState>());
    });
  });
}
