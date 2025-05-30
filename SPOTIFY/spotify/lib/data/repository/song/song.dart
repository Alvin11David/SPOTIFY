import 'package:dartz/dartz.dart' show Either;

abstract class SongsRepository {

  Future<Either> getNewsSongs();
}