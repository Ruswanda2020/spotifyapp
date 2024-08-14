import 'package:get_it/get_it.dart';
import 'package:spotify_app/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_app/data/repository/song/song_repository_impl.dart';
import 'package:spotify_app/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app/data/sources/song/song_firebase_service.dart';
import 'package:spotify_app/domain/repository/auth/auth_repository.dart';
import 'package:spotify_app/domain/repository/song/song_repository.dart';
import 'package:spotify_app/domain/usecase/auth/sign_in_usecase.dart';
import 'package:spotify_app/domain/usecase/auth/sign_up_usecase.dart';
import 'package:spotify_app/domain/usecase/song/get_news_songs_usecase.dart';

final serviceLocator = GetIt.instance;
Future<void> initalizeDependencies() async {
  serviceLocator.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );
  serviceLocator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  serviceLocator.registerSingleton<SignUpUsecase>(
    SignUpUsecase(),
  );

  serviceLocator.registerSingleton<SignInUsecase>(
    SignInUsecase(),
  );
  serviceLocator.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl(),
  );
  serviceLocator.registerSingleton<SongRepository>(
    SongRepositoryImpl(),
  );
  serviceLocator.registerSingleton<GetNewsSongsUseCase>(
    GetNewsSongsUseCase(),
  );
}
