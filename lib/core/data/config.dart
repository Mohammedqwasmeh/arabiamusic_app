import 'dart:async';

import 'package:arabiamusic_app/core/util/storage/local_secure_storage.dart';
import 'package:arabiamusic_app/core/util/storage/secure_storage.dart';

class Config {
  factory Config({LocalSecureStorage? localSecureStorage}) {
    _singleton._localSecureStorage ??=
        localSecureStorage ?? LocalSecureStorage(AppSecureStorageInterface());
    return _singleton;
  }

  Config._internal();

  String? _token;
  LocalSecureStorage? _localSecureStorage;

  static final Config _singleton = Config._internal();

  void setToken(String token) {
    _token = token;
    _localSecureStorage?.setToken(token);
  }

  Future<String?> getToken() async {
    return _token ??= await _getTokenFromLocalStorage();
  }

  Future<String?> getFirstRunFromLocalStorage() async {
    return await _localSecureStorage?.getFirstRun();
  }

  Future<String?> _getTokenFromLocalStorage() async {
    return _token = await _localSecureStorage?.getToken();
  }

  void setFirstRunToLocalStorage(String value) {
    _localSecureStorage?.setFirstRun(value);
  }

  void logout() {
    _token = null;
    _localSecureStorage?.setUser('');
    _localSecureStorage?.setToken('');
  }

  void clearData() {
    _token = null;
    _localSecureStorage?.setUser('');
    _localSecureStorage?.setToken('');
    _localSecureStorage?.setFirstRun('');
  }
}
