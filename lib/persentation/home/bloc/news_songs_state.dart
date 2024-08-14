import 'package:spotify_app/domain/entities/song/song.dart';

abstract class NewsSongsState {}

class NewsSongsLoading extends NewsSongsState {}

class NewsSongsLoaded extends NewsSongsState {
  List<SongEntity> songs;
  NewsSongsLoaded({required this.songs});
}

class NewsSongsFailure extends NewsSongsState {}
