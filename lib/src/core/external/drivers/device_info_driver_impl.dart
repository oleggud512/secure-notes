import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

import '../../infrastructure/drivers/device_info.dart';
import '../../infrastructure/drivers/device_info_driver.dart';

class DeviceInfoDriverImpl implements DeviceInfoDriver {
  final _plugin = DeviceInfoPlugin();

  @override
  Future<DeviceInfo> getDeviceInfo() async {
    if (Platform.isAndroid) {
      final info = await _plugin.androidInfo;
      return DeviceInfo(name: info.product, id: info.fingerprint);
    }
    if (Platform.isIOS) {
      final info = await _plugin.iosInfo;
      return DeviceInfo(name: info.model, id: info.identifierForVendor!);
    }
    if (Platform.isMacOS) {
      final info = await _plugin.macOsInfo;
      return DeviceInfo(name: info.model, id: info.systemGUID!);
    }
    if (Platform.isWindows) {
      final info = await _plugin.windowsInfo;
      return DeviceInfo(name: info.productName, id: info.deviceId);
    }
    if (Platform.isLinux) {
      final info = await _plugin.linuxInfo;
      return DeviceInfo(name: info.name, id: info.id);
    }
    throw Exception('incorrect env');
  }
  
}