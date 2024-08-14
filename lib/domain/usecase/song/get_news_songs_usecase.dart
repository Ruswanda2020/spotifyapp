import 'package:either_dart/either.dart';
import 'package:spotify_app/domain/repository/song/song_repository.dart';
import 'package:spotify_app/service_locator.dart';

import '../../../core/usecase/usecase.dart';

class GetNewsSongsUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await serviceLocator<SongRepository>().getNewsSong();
  }
}
