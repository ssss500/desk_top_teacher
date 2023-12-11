

import 'package:desk_top_teacher/models/video_stream_model.dart';

class VideoModel {
  String? id;
  String? title;
  String? subtitle;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? deleteAt;
  String? deleteBy;
  String? startAt;
  String? endAt;
  String? image;
  String? year;
  VideoStreamModel? videoStream;
  String youtubeUrl;
  String nameVideoPicker;
  double sizeVideoPicker;
  String pathVideoPicker;

  bool? delete;
  bool? takeScreenShot;
  bool? solutionVideo;

  bool? download;

  bool? showInWeb;
  bool? showInMobile;
  bool? showInWindows;

  int? typePayment;
  int? totalTimer;

  List<String>? center;

  List<String>? linkedLecture = [];

  LinkedModel? idLinkedQuiz;
  LinkedModel? idLinkedVideo;

  VideoModel(
      // gave all the parameters a default value of null

      {this.id = '',
      this.title = '',
      this.subtitle = '',
      this.download = false,
      this.createdAt = '',
      this.createdBy = '',
      this.updatedAt = '',
      this.updatedBy = '',
      this.takeScreenShot = false,
      this.nameVideoPicker = '',
      this.pathVideoPicker = '',
      this.deleteAt = '',
      this.deleteBy = '',
      this.startAt = '',
      this.endAt = '',
      this.sizeVideoPicker = 0.0,
      this.image = '',
      this.year = '',
      this.delete = false,
      this.solutionVideo = false,
      this.showInWeb = false,
      this.showInMobile = false,
      this.showInWindows = false,
      this.typePayment = 0,
      this.totalTimer = 0,
      this.center = const [],
      this.linkedLecture = const [],
      this.idLinkedQuiz,
      this.videoStream,
      this.youtubeUrl = '',
      this.idLinkedVideo}) {
    idLinkedQuiz ??= LinkedModel();
    idLinkedVideo ??= LinkedModel();
    videoStream ??= VideoStreamModel();
  }

  factory VideoModel.fromJson(json) {
    // debugPrint('json: ${json['video_stream']}');
    return VideoModel(
      videoStream: json['video_stream'] != null
          ? VideoStreamModel.fromJson(json['video_stream'])
          : null,
      youtubeUrl: json['youtube_url'] ?? "",
      download: json['download'],
      nameVideoPicker: json['name_video_picker'] ?? "",
      id: json['id'],
      takeScreenShot: json['take_screen_shot'],
      sizeVideoPicker: json['size_video_picker'] ?? 0.0,
      title: json['title'],
      subtitle: json['subtitle'] ?? "",
      createdAt: json['created_at'],
      createdBy: json['created_by'],
      updatedAt: json['updated_at'],
      updatedBy: json['updated_by'],
      deleteAt: json['delete_at'],
      pathVideoPicker: json['path_video_picker'] ?? '',
      deleteBy: json['delete_by'],
      startAt: json['start_at'],
      endAt: json['end_at'],
      image: json['image'],
      solutionVideo: json['solution_video']??false,
      year: json['year'],
      delete: json['delete'],
      showInWeb: json['show_in_web'],
      showInMobile: json['show_in_mobile'],
      showInWindows: json['show_in_windows'],
      typePayment: json['type_payment'],
      totalTimer: json['total_timer'],
      center: json['center'] != null ? List<String>.from(json['center']) : [],
      linkedLecture: json['linked_lecture'] != null
          ? List<String>.from(json['linked_lecture'])
          : [],
      idLinkedQuiz: json['id_linked_quiz'] == null
          ? LinkedModel(id: '', title: '')
          : LinkedModel.fromJson(json['id_linked_quiz']),
      idLinkedVideo: json['id_linked_video'] == null
          ? LinkedModel(id: '', title: '')
          : LinkedModel.fromJson(json['id_linked_video']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'video_stream': videoStream!.toJson(),
      'youtube_url': youtubeUrl,
      'id': id,
      'path_video_picker': pathVideoPicker,
      'size_video_picker': sizeVideoPicker,
      'name_video_picker': nameVideoPicker,
      'title': title,
      'subtitle': subtitle ?? "",
      'take_screen_shot': takeScreenShot,
      'created_at': createdAt,
      'created_by': createdBy,
      'updated_at': updatedAt,
      'download': download,
      'updated_by': updatedBy,
      'solution_video': solutionVideo,
      'delete_at': deleteAt,
      'delete_by': deleteBy,
      'start_at': startAt,
      'end_at': endAt,
      'image': image,
      'year': year,
      'delete': delete,
      'show_in_web': showInWeb,
      'show_in_mobile': showInMobile,
      'show_in_windows': showInWindows,
      'type_payment': typePayment,
      'total_timer': totalTimer,
      'center': center,
      'linked_lecture': linkedLecture!.isEmpty ? [] : linkedLecture,
      'id_linked_quiz': idLinkedQuiz!.toJson(),
      'id_linked_video': idLinkedVideo!.toJson(),
    };
  }
}

class LinkedModel {
  String? id, title;

  LinkedModel({
    this.id,
    this.title,
  });

  factory LinkedModel.fromJson(json) {
    return LinkedModel(
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
