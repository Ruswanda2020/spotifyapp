import 'package:either_dart/either.dart';
import 'package:spotify_app/data/sources/song/song_firebase_service.dart';
import 'package:spotify_app/domain/repository/song/song_repository.dart';
import 'package:spotify_app/service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewsSong() async {
    return await serviceLocator<SongFirebaseService>().getNewsSong();
  }
}
