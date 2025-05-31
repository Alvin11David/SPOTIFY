import 'package:dartz/dartz.dart' show Either;
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/repository/song/song_repository_impl.dart' show SongRepositoryImpl;
import 'package:spotify/service_locator.dart' show sl;

class GetNewsSongsUseCase implements UseCase<Either,dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepositoryImpl>().getNewsSongs();
  }
}
