import 'package:arabiamusic_app/core/util/storage/secure_storage.dart';
import 'package:arabiamusic_app/core/util/storage/storage_item.dart';

class LocalSecureStorage {
  LocalSecureStorage(this._appSecureStorageInterface);

  static const String _firstRunKey = 'first_run';
  static const String _tokenKey = 'token';
  static const String _userKey = 'user';

  late final AppSecureStorageInterface _appSecureStorageInterface;

  void setToken(String token) {
    _appSecureStorageInterface
        .writeSecureData(StorageItem(key: _tokenKey, value: token));
  }

  Future<bool> containsToken() {
    return _appSecureStorageInterface.containsKey(_tokenKey);
  }

  Future<String?> getToken() async {
    return _appSecureStorageInterface.readSecureData(_tokenKey);
  }

  void setUser(String user) {
    _appSecureStorageInterface
        .writeSecureData(StorageItem(key: _userKey, value: user));
  }

  Future<bool> containsUser() {
    return _appSecureStorageInterface.containsKey(_userKey);
  }

  Future<String?> getUser() async {
    return _appSecureStorageInterface.readSecureData(_userKey);
  }

  Future<void> clearAll() async {
    await _appSecureStorageInterface.clearAll();
  }

  Future<void> removeItem(String key) async {
    await _appSecureStorageInterface.removeItem(key);
  }

  Future<String?> getFirstRun() async {
    return _appSecureStorageInterface.readSecureData(_firstRunKey);
  }

  void setFirstRun(String value) {
    _appSecureStorageInterface
        .writeSecureData(StorageItem(key: _firstRunKey, value: value));
  }
}
