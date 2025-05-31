import 'package:dartz/dartz.dart' show Either;
import 'package:spotify/data/repository/song/song.dart';
import 'package:spotify/data/sources/songs/song_firebase_service.dart' show SongFirebaseService;
import 'package:spotify/service_locator.dart' show sl;

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }
}