import 'package:isar/isar.dart';

import '../audiouri/audio_uri.dart';
import '../source_models/display_audio_books.dart';
import '../time_stamps/time_stamps.dart';

part 'audiobook.g.dart';

@Collection()
class AudioBook extends AudioBookDisplayModel {
  Id get videoHash => fastHash(super.bookUrl);

  final List<AudioInfo> bookUris; // the actually playable link
  final int progress; // last listened duration in seconds
  final List<String>? genre; // modifiable genre string
  final String? author;

  AudioBook({
    required this.bookUris,
    required super.coverImage,
    required super.bookUrl,
    required super.title,
    this.progress = 0,
    this.genre,
    this.author,
    super.uploader,
    super.description,
    super.uploadDate,
    super.timeStamps,
    super.durationInSeconds,
  });

  factory AudioBook.fromAudioBookDisplay(
      {required AudioBookDisplayModel book,
      required List<AudioInfo> bookUris}) {
    var dur = book.durationInSeconds ??
        bookUris
            .map((e) => e.duration.inSeconds)
            .reduce((value, element) => value + element);
    return AudioBook(
      title: book.title,
      coverImage: book.coverImage,
      bookUrl: book.bookUrl,
      uploader: book.uploader,
      durationInSeconds: dur,
      description: book.description,
      uploadDate: book.uploadDate,
      bookUris: bookUris,
    );
  }
}

/// Reference https://isar.dev/recipes/string_ids.html
/// FNV-1a 64bit hash algorithm optimized for Dart Strings
int fastHash(String string) {
  var hash = 0xcbf29ce484222325;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }

  return hash;
}
