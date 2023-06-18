import 'package:flutter/services.dart';

class AssetsService {
  AssetsService._();

  static AssetsService? _instance;

  static AssetsService get instance {
    _instance ??= AssetsService._();
    return _instance!;
  }

  Future<String> getAsset(String name) {
    return rootBundle.loadString(name);
  }
}