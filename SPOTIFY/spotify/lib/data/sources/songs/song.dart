import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' show Either;
import 'package:spotify/data/models/auth/song/song.dart' show SongModel;
import 'package:spotify/domain/entities/auth/song/song.dart' show SongEntity;

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<dynamic> getNewsSongs() async {
  List<SongEntity> songs = [];

  var data = await FirebaseFirestore.instance.collection('Songs')
  .orderBy('releaseDate',descending: true)
  .limit(3)
  .get();

  for (var element in data.docs) {
    var songModel = SongModel.fromJson(element.data());
  }}

}