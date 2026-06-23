// ignore_for_file: override_on_non_overriding_member

import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import 'storage_service.dart';

class StorageServiceImpl implements StorageService {
  // Singleton instance
  static final StorageServiceImpl _instance = StorageServiceImpl._internal();

  // Factory constructor to return the same instance
  factory StorageServiceImpl() {
    return _instance;
  }

  // Private constructor
  StorageServiceImpl._internal();

  static const String _accessTokenKey = 'ACCESS_TOKEN';
  static const String _refreshTokenKey = 'REFRESH_TOKEN';
  static const String _languageCode = 'LANGUAGE_CODE';
  late Box hiveBox;

  @override
  String? getAccessToken() {
    return hiveBox.get(_accessTokenKey);
  }

  @override
  Future<void> setAccessToken(String? token) async {
    await hiveBox.put(_accessTokenKey, token);
  }

  @override
  Future<void> deleteAccessToken() async {
    await hiveBox.delete(_accessTokenKey);
  }

  @override
  String? getRefreshToken() {
    return hiveBox.get(_refreshTokenKey);
  }

  @override
  Future<void> setRefreshToken(String? token) async {
    log('$token', name: _refreshTokenKey);
    await hiveBox.put(_refreshTokenKey, token);
  }

  @override
  Future<void> deleteRefreshToken() async {
    await hiveBox.delete(_refreshTokenKey);
  }

  @override
  String? getLanguageCode() {
    return hiveBox.get(_languageCode);
  }

  @override
  Future<void> setLanguageCode(String code) async {
    await hiveBox.put(_languageCode, code);
  }


  @override
  Future<void> clear() async {
    if (hiveBox.isOpen) {
      await hiveBox.clear();
    }
  }

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    await openBox();
  }

  @override
  Future<void> openBox() async {
    if (!Hive.isBoxOpen('isLoggedIn')) {
      hiveBox = await Hive.openBox('isLoggedIn');
    } else {
      hiveBox = Hive.box('isLoggedIn');
    }
  }

  @override
  bool checkLoggedIn() {
    return getAccessToken() != null;
  }

  @override
  bool get isLoggedIn => checkLoggedIn();

  @override
  Future<void> setSelectedAddress(String address) async {
    await hiveBox.put('selectedAddress', address);
  }

  @override
  String? getSelectedAddress() {
    return hiveBox.get('selectedAddress');
  }
}
