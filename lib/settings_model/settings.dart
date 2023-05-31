// model to store the settings for the app
import 'package:isar/isar.dart';

part 'settings.g.dart';

@Collection()
class Settings {
  Id id = 0;
  final bool isDarkMode;
  final List<String> genreList;

  // const initList =
  // [
  //   'Action',
  //   'Adventure',
  //   'Comedy',
  //   'Drama',
  //   'Fantasy',
  //   'Horror',
  //   'Mystery',
  //   'Romance',
  //   'Sci-Fi',
  //   'Thriller'
  // ];

  Settings({
    this.isDarkMode = true,
    this.genreList = const [
      'Action',
      'Adventure',
      'Comedy',
      'Drama',
      'Fantasy',
      'Horror',
      'Mystery',
      'Romance',
      'Sci-Fi',
      'Thriller'
    ],
  });
}
