import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mono/src/features/sign_up/sign_up_controller.dart';
import 'package:mono/src/features/sign_up/sign_up_state.dart';
import 'package:mono/src/model/user_model.dart';
import 'package:mono/src/services/auth/auth_service.dart';
import 'package:mono/src/services/secure_storage.dart';

import '../../mocks.dart';

void main() {
  late SignUpController controller;

  late AuthService service;
  late SecureStorage storage;

  setUp(() {
    service = MockAuthServiceFirebase();
    storage = MockSecureStorage();

    controller = SignUpController(
      service: service,
      storage: storage,
    );
  });

  final userMock = UserModel(
    id: '123',
    name: 'User Test',
    email: 'user.test@email.com',
  );

  group('Sign Up Controller', () {
    test('should emits Initial State', () async {
      expect(controller.state, isInstanceOf<SignUpInitialState>());
    });

    test('should emits Success State', () async {
      expect(controller.state, isInstanceOf<SignUpInitialState>());

      when(() {
        return storage.write(
          key: 'CURRENT_USER',
          value: userMock.toJson(),
        );
      }).thenAnswer((_) async {});

      when(() {
        return service.signUp(
          name: 'User Test',
          email: 'user.test@email.com',
          password: 'Test@123',
        );
      }).thenAnswer((_) async {
        return userMock;
      });

      await controller.signUp(
        name: 'User Test',
        email: 'user.test@email.com',
        password: 'Test@123',
      );

      expect(controller.state, isInstanceOf<SignUpSuccessState>());
    });

    test('should emits Error State', () async {
      expect(controller.state, isInstanceOf<SignUpInitialState>());

      when(() {
        return storage.write(
          key: 'CURRENT_USER',
          value: userMock.toJson(),
        );
      }).thenAnswer((_) async {});

      when(() {
        return service.signUp(
          name: 'User Test',
          email: 'user.test@email.com',
          password: 'Test@123',
        );
      }).thenThrow(Exception());

      await controller.signUp(
        name: 'User Test',
        email: 'user.test@email.com',
        password: 'Test@123',
      );

      expect(controller.state, isInstanceOf<SignUpErrorState>());
    });
  });
}
