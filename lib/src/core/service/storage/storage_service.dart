abstract class StorageService {
  String? getAccessToken();
  Future<void> setAccessToken(String? accessToken);
  Future<void> deleteAccessToken();
  String? getRefreshToken();
  Future<void> setRefreshToken(String? refreshToken);

  Future<void> deleteRefreshToken();
  String? getLanguageCode();
  Future<void> setLanguageCode(String code);
  Future<void> clear();
  Future<void> init();
  Future<void> openBox();
  bool checkLoggedIn();
  bool get isLoggedIn;

  Future<void> setSelectedAddress(String address);
  String? getSelectedAddress();
}
