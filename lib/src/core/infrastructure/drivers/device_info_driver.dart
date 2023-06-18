import 'device_info.dart';

abstract interface class DeviceInfoDriver { 
  Future<DeviceInfo> getDeviceInfo();
}