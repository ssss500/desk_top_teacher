class QrModel {
  String? deviceID;
  String? id;
  String? videoID;
  String? videoName;
  String? videoUrl;
  String? createdAt;
  String? updatedAt;
  String? userName;
  String? userUuid;
  String? userPhone;
  String? userCode;
  bool? isUsed;

  QrModel({
    this.deviceID = "",
    this.id = "",
    this.videoID = "",
    this.videoName = "",
    this.videoUrl = "",
    this.createdAt = "",
    this.updatedAt = "",
    this.userName = "",
    this.userUuid = "",
    this.userPhone = "",
    this.userCode = "",
    this.isUsed = false,
  });

  QrModel.fromJson(Map<String, dynamic> json) {
    deviceID = json['deviceID'] ?? "";
    id = json['id'] ?? "";
    videoID = json['videoID'] ?? "";
    videoName = json['videoName'] ?? "";
    videoUrl = json['videoUrl'] ?? "";
    createdAt = json['createdAt'] ?? "";
    updatedAt = json['updatedAt'] ?? "";
    userName = json['userName'] ?? "";
    userUuid = json['userUuid'] ?? "";
    userPhone = json['userPhone'] ?? "";
    userCode = json['userCode'] ?? "";
    isUsed = json['isUsed'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['deviceID'] = deviceID ?? "";
    data['id'] = id ?? "";
    data['videoID'] = videoID ?? "";
    data['videoName'] = videoName ?? "";
    data['videoUrl'] = videoUrl ?? "";
    data['createdAt'] = createdAt ?? "";
    data['updatedAt'] = updatedAt ?? "";
    data['userName'] = userName ?? "";
    data['userUuid'] = userUuid ?? "";
    data['userPhone'] = userPhone ?? "";
    data['userCode'] = userCode ?? "";
    data['isUsed'] = isUsed ?? false;
    return data;
  }
}
