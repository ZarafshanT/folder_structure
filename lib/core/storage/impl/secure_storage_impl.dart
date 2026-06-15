import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:folder_structure/core/storage/secure_storage.dart';

class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage _storage;

  SecureStorageImpl(this._storage);

  @override
  Future<void> delete(String key) => _storage.delete(key: key);

  @override
  Future<String?> read(String key) => _storage.read(key: key);

  @override
  Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);
}
