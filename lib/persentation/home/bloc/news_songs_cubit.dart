import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/domain/usecase/song/get_news_songs_usecase.dart';
import 'package:spotify_app/persentation/home/bloc/news_songs_state.dart';
import 'package:spotify_app/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit()
      : super(
          NewsSongsLoading(),
        );

  Future<void> getNewsSongs() async {
    var returnedSongs = await serviceLocator<GetNewsSongsUseCase>().call();

    returnedSongs.fold(
      (l) {
        emit(
          NewsSongsFailure(),
        );
      },
      (data) {
        emit(
          NewsSongsLoaded(songs: data),
        );
      },
    );
  }
}
