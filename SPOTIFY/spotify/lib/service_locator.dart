import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart' show AuthRepositoryImpl;
import 'package:spotify/data/repository/song/song.dart';
import 'package:spotify/data/repository/song/song_repository_impl.dart' show SongRepositoryImpl;
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/data/sources/songs/song_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart' show AuthRepository;
import 'package:spotify/domain/repository/usecases/auth/signin.dart' show SigninUseCase;
import 'package:spotify/domain/repository/usecases/auth/signup.dart';
import 'package:spotify/domain/repository/usecases/song/get_news_songs.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServicesImpl()
  );

  sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl()
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  sl.registerSingleton<SongsRepository>(
    SongRepositoryImpl()
  );

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase()
  );

  sl.registerSingleton<GetNewsSongsUseCase>(
    GetNewsSongsUseCase()
  );
}