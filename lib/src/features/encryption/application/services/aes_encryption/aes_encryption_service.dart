abstract interface class AESEncryptionService {
  Future<String> generateKey(String password);
  String encrypt(String data, String key);
  /// combination of iv and data
  String decrypt(String combination, String key);
}