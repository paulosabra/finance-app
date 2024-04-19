import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mono/src/model/user_model.dart';
import 'package:mono/src/services/auth/auth_service_firebase.dart';

import '../../mocks.dart';

void main() {
  late AuthServiceFirebase service;

  setUpAll(() {
    service = MockAuthServiceFirebase();
  });

  const userMock = UserModel(
    id: '123',
    name: 'User Test',
    email: 'user.test@email.com',
  );

  group('SignUp Test ', () {
    test('sign up should return success', () async {
      when(() {
        return service.signUp(
          name: 'User Test',
          email: 'user.test@email.com',
          password: 'Test@123',
        );
      }).thenAnswer((_) async {
        return userMock;
      });

      final result = await service.signUp(
        name: 'User Test',
        email: 'user.test@email.com',
        password: 'Test@123',
      );

      expect(result, userMock);
    });

    test('sign up should return error', () {
      when(() {
        return service.signUp(
          name: 'User Test',
          email: 'user.test@email.com',
          password: 'Test@123',
        );
      }).thenThrow(Exception());

      expect(
        () => service.signUp(
          name: 'User Test',
          email: 'user.test@email.com',
          password: 'Test@123',
        ),
        throwsException,
      );
    });
  });

  group('SignIn Test ', () {
    test('sign in should return success', () async {
      when(() {
        return service.signIn(
          email: 'user.test@email.com',
          password: 'Test@123',
        );
      }).thenAnswer((_) async {
        return userMock;
      });

      final result = await service.signIn(
        email: 'user.test@email.com',
        password: 'Test@123',
      );

      expect(result, userMock);
    });

    test('sign in should return failed', () {
      when(() {
        return service.signIn(
          email: 'user.test@email.com',
          password: 'Test@123',
        );
      }).thenThrow(Exception());

      expect(
        () => service.signIn(
          email: 'user.test@email.com',
          password: 'Test@123',
        ),
        throwsException,
      );
    });
  });

  group('SignOut Test ', () {
    test('sign out should return success', () {
      when(() => service.signOut()).thenAnswer((_) => Future.value());

      final result = service.signOut();

      expect(result, completes);
    });
    test('sign out should return failed', () {
      when(() => service.signOut()).thenThrow(Exception());

      expect(
        () => service.signOut(),
        throwsException,
      );
    });
  });
}
