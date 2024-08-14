import 'package:either_dart/either.dart';

abstract class SongRepository {
  Future<Either> getNewsSong();
}
