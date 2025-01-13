import 'package:flutter_application_1/domain/resource_service.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class ModelHomeScreen {
  final dataService = ResourceService();
  // List<SongModel> songsFullData = [];

  Future<List<SongModel>> getSongsList() async {
    // songsFullData = await dataService.fetchSongs();
    return await dataService.fetchSongs();
  }

  Future<bool> isGrantedAccessToStorage() async {
    return await dataService.requestPermission(Permission.audio);
  }
}
