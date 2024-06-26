import 'package:get_it/get_it.dart';
import 'package:mono/src/features/home/home_controller.dart';
import 'package:mono/src/features/sign_in/sign_in_controller.dart';
import 'package:mono/src/features/sign_up/sign_up_controller.dart';
import 'package:mono/src/features/splash/splash_controller.dart';
import 'package:mono/src/repositories/transaction/transaction_repository.dart';
import 'package:mono/src/repositories/transaction/transaction_repository_impl.dart';
import 'package:mono/src/services/auth/auth_service.dart';
import 'package:mono/src/services/auth/auth_service_firebase.dart';
import 'package:mono/src/services/graphql/graphql_service.dart';
import 'package:mono/src/services/graphql/graphql_service_hasura.dart';
import 'package:mono/src/services/secure_storage.dart';

final getIt = GetIt.instance;

void setupDependecies() {
  _servicesSetup();
  _repositoriesSetup();
  _controllersSetup();
}

void _servicesSetup() {
  getIt
    ..registerFactory<AuthService>(
      AuthServiceFirebase.new,
    )
    ..registerLazySingleton<GraphQLService>(
      () => GraphQLServiceHasura(
        service: getIt.get<AuthService>(),
      ),
    );
}

void _repositoriesSetup() {
  getIt.registerFactory<TransactionRepository>(
    TransactionRepositoryImpl.new,
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
        authService: getIt.get<AuthService>(),
        graphQLService: getIt.get<GraphQLService>(),
        storage: const SecureStorage(),
      ),
    )
    ..registerFactory(
      () => HomeController(
        repository: getIt.get<TransactionRepository>(),
      ),
    );
}
