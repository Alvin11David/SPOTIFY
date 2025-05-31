import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' show Either, Left, Right;
import 'package:spotify/data/models/auth/song/song.dart' show SongModel, SongModelX;
import 'package:spotify/domain/entities/auth/song/song.dart' show SongEntity;

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance.collection('Songs')
        .orderBy('releaseDate',descending: true)
        .limit(3)
        .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(
          songModel.toEntity()
          );
      }
      return Right(songs);
      } catch (e){
        return Left('An Error Occured, Please try again.!');
      }
      }

}