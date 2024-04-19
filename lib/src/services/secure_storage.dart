import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  const SecureStorage();

  FlutterSecureStorage get _secureStorage => const FlutterSecureStorage();

  Future<void> write({
    required String key,
    required String? value,
  }) async {
    await _secureStorage.write(
      key: key,
      value: value,
    );
  }

  Future<String?> read({required String key}) async {
    final value = await _secureStorage.read(key: key);
    return value;
  }

  Future<Map<String, String>> readAll() async {
    final allValues = await _secureStorage.readAll();
    return allValues;
  }

  Future<void> delete({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }
}
