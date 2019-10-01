import 'dart:io';

import 'package:device_info/device_info.dart';

Future<String> getDeviceInfo() async {
  DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    AndroidDeviceInfo _androidInfo = await _deviceInfo.androidInfo;
    return _androidInfo.model; // e.g. "Moto G (4)"
  } else if (Platform.isIOS) {
    IosDeviceInfo _iosInfo = await _deviceInfo.iosInfo;
    return _iosInfo.utsname.machine; // e.g. "iPod7,1"
  }
  return "Unkonown Device";
}
