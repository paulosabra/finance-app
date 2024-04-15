import 'package:mocktail/mocktail.dart';
import 'package:mono/src/services/auth/auth_service_firebase.dart';
import 'package:mono/src/services/secure_storage.dart';

class MockAuthServiceFirebase extends Mock implements AuthServiceFirebase {}

class MockSecureStorage extends Mock implements SecureStorage {}
