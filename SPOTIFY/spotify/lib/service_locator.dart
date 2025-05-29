
import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart' show AuthRepositoryImpl;
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart' show AuthRepository;

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServicesImpl()
  );


  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );
}