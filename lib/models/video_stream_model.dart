// To parse this JSON data, do
//
//     final videoStreamModel = videoStreamModelFromJson(jsonString);

// import 'dart:convert';

// VideoStreamModel videoStreamModelFromJson(String str) => VideoStreamModel.fromJson(json.decode(str));

// String videoStreamModelToJson(VideoStreamModel data) => json.encode(data.toJson());

import 'package:flutter/material.dart';

class VideoStreamModel {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? title;
  String? uuid;
  String? coid;
  dynamic status;
  String? privacy;
  Playback? playback;
  Playback? playbackV2;
  Input? input;
  int? duration;
  int? size;
  bool? readyToStream;
  String? thumbnail;
  dynamic thumbnailTimestampPct;
  Storage? storage;
  Meta? meta;

  VideoStreamModel({
    this.id = "",
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.title='',
    this.uuid='',
    this.coid = "",
    this.status = "",
    this.privacy = "",
    this.playback,
    this.playbackV2,
    this.input,
    this.duration = 0,
    this.size = 0,
    this.readyToStream = false,
    this.thumbnail = "",
    this.thumbnailTimestampPct,
    this.storage,
    this.meta,
  });

  factory VideoStreamModel.fromJson(Map jsonString) {
    Map<String, dynamic> json= jsonString.map((key, value) => MapEntry(key.toString(), value));
    // debugPrint("jsonString: $jsonString");
     return VideoStreamModel(
      id: json["id"],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.parse(json["updated_at"]),
      deletedAt: json["deleted_at"],
      title: json["title"],
      uuid: json["uuid"],
      coid: json["coid"],
      status: json["status"],
      privacy: json["privacy"],
      playback:
          json["playback"] == null ? null : Playback.fromJson(json["playback"]),
      playbackV2: json["playback_v2"] == null
          ? null
          : Playback.fromJson(json["playback_v2"]),
      input: json["input"] == null ? null : Input.fromJson(json["input"]),
      duration: json["duration"],
      size: json["size"],
      readyToStream: json["ready_to_stream"],
      thumbnail: json["thumbnail"],
      thumbnailTimestampPct: json["thumbnail_timestamp_pct"],
      storage:
          json["storage"] == null ? null : Storage.fromJson(json["storage"]),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "title": title,
        "uuid": uuid,
        "coid": coid,
        "status": status,
        "privacy": privacy,
        "playback": playback?.toJson(),
        "playback_v2": playbackV2?.toJson(),
        "input": input?.toJson(),
        "duration": duration,
        "size": size,
        "ready_to_stream": readyToStream,
        "thumbnail": thumbnail,
        "thumbnail_timestamp_pct": thumbnailTimestampPct,
        "storage": storage?.toJson(),
        "meta": meta?.toJson(),
      };
}

class Input {
  int? width;
  int? height;

  Input({
    this.width,
    this.height,
  });

  factory Input.fromJson(json) => Input(
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
      };
}

class Meta {
  String? downloadedFrom;

  Meta({
    this.downloadedFrom,
  });

  factory Meta.fromJson(json) => Meta(
        downloadedFrom: json["downloaded_from"],
      );

  Map<String, dynamic> toJson() => {
        "downloaded_from": downloadedFrom,
      };
}

class Playback {
  String? hls;
  String? dash;
  String? audio;
  dynamic r1080P;
  String? r720P;
  String? r360P;
  String? r480P;
  String? r240P;

  Playback({
    this.hls,
    this.dash,
    this.audio,
    this.r1080P,
    this.r720P,
    this.r360P,
    this.r480P,
    this.r240P,
  });

  factory Playback.fromJson(json) => Playback(
        hls: json["hls"],
        dash: json["dash"],
        audio: json["audio"],
        r1080P: json["r_1080p"],
        r720P: json["r_720p"],
        r360P: json["r_360p"],
        r480P: json["r_480p"],
        r240P: json["r_240p"],
      );

  Map<String, dynamic> toJson() => {
        "hls": hls,
        "dash": dash,
        "audio": audio,
        "r_1080p": r1080P,
        "r_720p": r720P,
        "r_360p": r360P,
        "r_480p": r480P,
        "r_240p": r240P,
      };
}

class Storage {
  String? bucket;
  String? rawBucket;
  String? provider;
  Source? source;
  dynamic meta;

  Storage({
    this.bucket,
    this.rawBucket,
    this.provider,
    this.source,
    this.meta,
  });

  factory Storage.fromJson(json) => Storage(
        bucket: json["bucket"],
        rawBucket: json["raw_bucket"],
        provider: json["provider"],
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        meta: json["meta"],
      );

  Map<String, dynamic> toJson() => {
        "bucket": bucket,
        "raw_bucket": rawBucket,
        "provider": provider,
        "source": source?.toJson(),
        "meta": meta,
      };
}

class Source {
  String? key;
  int? size;

  Source({
    this.key,
    this.size,
  });

  factory Source.fromJson(json) => Source(
        key: json["key"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "size": size,
      };
}

class StatusResponse {
  static const statusUploaded = 'uploaded';
  static const statusInProgress = 'in-progress';
  static const statusProcessFailed = 'process-failed';
  static const statusProcessCompleted = 'process-completed';

    String? _message;
    Color? _color;

  StatusResponse() : _message = "";

  StatusResponse.uploaded() {
    _message = "تم رفع الفيديو";
    _color = Colors.blue;
  }

  StatusResponse.inProgress() {
    _message = "جاري المعالجة";
    _color = Colors.yellow;
  }

  StatusResponse.processFailed() {
    _message = "فشل المعالجة";
    _color = Colors.redAccent;
  }

  StatusResponse.processCompleted() {
    _message = "تم المعالجة, ومتاح الان للمشاهدة";
    _color = Colors.green;
  }

  String? get message {
    return _message;
  }

  Color? get color {
    return _color;
  }
}
