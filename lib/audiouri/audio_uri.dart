import 'package:isar/isar.dart';

part 'audio_uri.g.dart';

@embedded
class AudioInfo {
  String? title;
  String? uri;
  int? durationInMilliseconds;

  AudioInfo({
    this.title,
    this.uri,
    this.durationInMilliseconds,
  });

  @ignore
  Duration get duration => Duration(milliseconds: durationInMilliseconds?.toInt() ?? 0);
}
