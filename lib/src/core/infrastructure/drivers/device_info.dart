import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_info.freezed.dart';

@freezed
class DeviceInfo with _$DeviceInfo {
  factory DeviceInfo({
    required String name,
    required String id
  }) = _DeviceInfo;
}