import 'package:isar/isar.dart';

part 'playlist.g.dart';

@Collection()
class Playlist {
  Id id = Isar.autoIncrement;
  
  final String title;

  Playlist({
    required this.id,
    required this.title,
  });
}
