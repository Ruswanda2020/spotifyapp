import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:spotify_app/data/models/song/song.dart';
import 'package:spotify_app/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSong();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewsSong() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection("Songs")
          .orderBy(
            "releaseDate",
            descending: true,
          )
          .limit(3)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(
          songModel.toSongEntity(),
        );
      }
      return Right(songs);
    } catch (e) {
      return const Left("An Error Occurred, Please try again");
    }
  }
}
