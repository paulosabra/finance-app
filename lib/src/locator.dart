import 'package:get_it/get_it.dart';
import 'package:mono/src/features/sign_in/sign_in_controller.dart';
import 'package:mono/src/features/sign_up/sign_up_controller.dart';
import 'package:mono/src/features/splash/splash_controller.dart';
import 'package:mono/src/services/auth/auth_service.dart';
import 'package:mono/src/services/auth/auth_service_firebase.dart';
import 'package:mono/src/services/secure_storage.dart';

final getIt = GetIt.instance;

void setupDependecies() {
  _servicesSetup();
  _controllersSetup();
}

void _servicesSetup() {
  getIt.registerLazySingleton<AuthService>(
    AuthServiceFirebase.new,
  );
}

void _controllersSetup() {
  getIt
    ..registerFactory(
      () => SplashController(
        storage: const SecureStorage(),
      ),
    )
    ..registerFactory(
      () => SignUpController(
        service: getIt.get<AuthService>(),
        storage: const SecureStorage(),
      ),
    )
    ..registerFactory(
      () => SignInController(
        service: getIt.get<AuthService>(),
        storage: const SecureStorage(),
      ),
    );
}
