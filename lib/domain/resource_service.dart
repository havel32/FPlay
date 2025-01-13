import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class ResourceService {
  final OnAudioQuery _audioQuery = OnAudioQuery();

  Future<List<SongModel>> fetchSongs() async {
    try {
      return await _audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );
    } catch (e) {
      log('Error fetching songs: $e');
      return [];
    }
  }

  Future<bool> requestPermission(Permission permission) async {
    try {
      if (await Permission.manageExternalStorage.status ==
          PermissionStatus.granted) {
        log('Permission already granted');
        return true;
      }
      AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
      if (build.version.sdkInt >= 30) {
        var re = await Permission.manageExternalStorage.request();
        if (re.isGranted) {
          log('Permission is granted');
          return true;
        } else {
          log('Permission is not granted');
          return false;
        }
      } else {
        if (await permission.isGranted) {
          return true;
        } else {
          var result = await permission.request();
          if (result.isGranted) {
            log('Permission is granted');
            return true;
          } else {
            log('Permission is not granted');
            return false;
          }
        }
      }
    } catch (e) {
      log("Exception while getting permission: $e");
      // throw ("Exception while getting permission: $e");
      return false;
    }
  }
}
