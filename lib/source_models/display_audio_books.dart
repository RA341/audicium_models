import '../time_stamps/time_stamps.dart';

class AudioBookDisplayModel {
  final String title;
  final String coverImage;
  final String bookUrl;
  String? uploader;
  int? durationInSeconds;
  String? description;
  DateTime? uploadDate;
  List<TimeStamps>? timeStamps;

  AudioBookDisplayModel({
    required this.title,
    required this.coverImage,
    required this.bookUrl,
    this.uploader,
    this.durationInSeconds,
    this.description,
    this.uploadDate,
    this.timeStamps,
  });

  factory AudioBookDisplayModel.fromJson(Map<String, dynamic> json) {
    return AudioBookDisplayModel(
      title: json['title'],
      coverImage: json['coverImage'],
      bookUrl: json['bookUrl'],
      uploader: json['uploader'],
      durationInSeconds: json['durationInSeconds'],
      description: json['description'],
      uploadDate: json['uploadDate'] == null ? null : DateTime.parse(
          json['uploadDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'coverImage': coverImage,
      'bookUrl': bookUrl,
      'uploader': uploader,
      'durationInSeconds': durationInSeconds,
      'description': description,
      'uploadDate': uploadDate?.toIso8601String(),
    };
  }
}

