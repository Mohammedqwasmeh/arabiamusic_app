import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:arabiamusic_app/core/util/storage/storage_item.dart';

class AppSecureStorageInterface {
  AppSecureStorageInterface() {
    _secureStorage = const FlutterSecureStorage();
  }

  late FlutterSecureStorage _secureStorage;

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<void> writeSecureData(StorageItem newItem) async {
    return _secureStorage.write(
      key: newItem.key,
      value: newItem.value,
      aOptions: _getAndroidOptions(),
    );
  }

  Future<String?> readSecureData(String key) async {
    final readData =
        await _secureStorage.read(key: key, aOptions: _getAndroidOptions());
    return readData;
  }

  Future<Map<String, String>?> readAllSecureData(String key) async {
    final allValues = await _secureStorage.readAll();
    return allValues;
  }

  Future<bool> containsKey(String key) {
    return _secureStorage.containsKey(key: key);
  }

  Future<void> removeItem(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }
}
