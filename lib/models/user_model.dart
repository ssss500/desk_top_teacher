// import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:firedart/generated/google/protobuf/timestamp.pb.dart';

class UserModel {
  String? name;
  List<String>? nameVariations;

  String? password;
  String? confirmPassword;
  // String? school;
  String? myPhone;
  String? dadPhone;
  String? address;

  // In case the student enters the code himself
  // TextEditingController? studentCode = TextEditingController();
  String? uuid;
  String? year;
  String? center;
  String? centerName;
  String? token;
  // String? generalSection;
  String? classYear;

  // Scientific or literary department
  String? specialtySection;
  String? note;
  String? studentCode;

  // ignore: prefer_typing_uninitialized_variables
  String? appVersion;
  String? city;
  String? createBy;
  String? lastSeen;
  String? lastSeenDad;

  int? scoreBankQuestion;
  int? wallet;
  int? financial;
  int? maxDevice;

  bool? star;
  bool? accountConfirmation;

  // For the student to take a screenshot
  bool? takeScreenShot;

  List<DeviceModel>? device;
  List<dynamic>? listIcons;
  List<WindowsDeviceModel>? windowsDevice;
  List<WebDeviceModel>? webDevice;
  List<DadDeviceModel>? dadDevice;
  Map<String, SeenPDFModel>? seenPDF;
  Map<String, SolveQuizModel>? solveQuiz;
  Map<String, SeenVideoModel>? seenVideos;
  Map<String, LectureAttendedModel>? lecturesAttended;
  Map<String, CodesUsedModel>? codesUsed;
  Map<String, CodesUsedModel>? itemPaid;

  List? listLecturesAttended;

  // Allow login
  List<dynamic> allowLogin;
  List<dynamic>? privetSeen;
  BlockModel? block;
  DeleteModel? delete;
  FinancialDues? financialDues;

  // List<TackScreenShot>? tackScreenShot;

  // Timestamp? timeCreateAccount;
  // Timestamp? birthday;
  var subscription;

  UserModel({
    this.name = '',
    this.nameVariations,
    this.uuid = "",
    this.password = '',
    this.listIcons = const [],

    this.address = '',
    this.confirmPassword = '',
    // this.school = '',
    this.myPhone = '',
    this.dadPhone = '',
    this.classYear = "2024",
    this.year = "",
    this.center = "",
    this.centerName = '',
    this.token = "",
    this.subscription,
    this.wallet = 0,
    this.scoreBankQuestion = 0,
    this.star = false,
    this.takeScreenShot = false,
    this.maxDevice = 1,
    // Scientific or literary
    // this.generalSection = "",
    // Scientific sciences and sports, scientific knowledge
    this.specialtySection = "",
    this.note = "",
    this.studentCode = "",
    this.lastSeen = "",
    this.lastSeenDad = "",
    this.device = const [],
    this.webDevice = const [],
    this.windowsDevice = const [],
    this.dadDevice = const [],
    this.solveQuiz = const {},
    this.seenPDF = const {},
    this.seenVideos = const {},
    this.lecturesAttended = const {},
    // Space in the registry
    this.allowLogin = const [],
    this.listLecturesAttended = const [],
    this.financialDues,
    // Used codes
    this.codesUsed = const {},
    this.itemPaid = const {},
    this.privetSeen = const [],
    this.delete,
    this.block,
    // this.timeCreateAccount,
    this.financial = 60,
    this.appVersion = "",
    this.city = "",
    this.createBy = "student",
    // this.birthday,
    this.accountConfirmation = false,
  }) {
    block = block ??= BlockModel();
    delete = delete ??= DeleteModel();
    financialDues = financialDues ??= FinancialDues();
  }

  // تابع fromJson
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? '',
      nameVariations: json['nameVariations'] != null
          ? List<String>.from(json['nameVariations'])
          : [],
      uuid: json['uuid'] ?? '',
      password: json['password'] ?? '',
      address: json['address'] ?? '',
      confirmPassword: json['confirmPassword'] ?? '',
      // school: json['school'] ?? '',
      myPhone: json['myPhone'] ?? '',
      dadPhone: json['dadPhone'] ?? '',
      centerName: json['centerName'] ?? '',
      classYear: json['classYear'] ?? "2024",
      year: json['year'] ?? '',
      center: json['center'] ?? '',
      token: json['token'] ?? '',
      wallet: json['wallet'] ?? 0,
      scoreBankQuestion: json['scoreBankQuestion'] ?? 0,
      star: json['star'] ?? false,
      takeScreenShot: json['takeScreenShot'] ?? false,
      maxDevice: json['maxDevice'] ?? 1,
      // generalSection: json['generalSection'] ?? '',
      specialtySection: json['specialtySection'] ?? '',
      note: json['note'] ?? '',
      studentCode: json['studentCode'] ?? '',
      lastSeen: json['lastSeen'] ?? '',
      lastSeenDad: json['lastSeenDad'] ?? '',
      itemPaid: Map.from(json["itemPaid"] ?? {}).map((k, v) =>
          MapEntry<String, CodesUsedModel>(k, CodesUsedModel.fromJson(v))),
      device: json["device"] == null
          ? []
          : List<DeviceModel>.from(
              json["device"]!.map((x) => DeviceModel.fromJson(x))),
      listIcons: json["listIcons"] == null ? [] : json['listIcons'],
      webDevice: json["webDevice"] == null
          ? []
          : List<WebDeviceModel>.from(
              json["webDevice"]!.map((x) => WebDeviceModel.fromJson(x))),
      windowsDevice: json["windowsDevice"] == null
          ? []
          : List<WindowsDeviceModel>.from(json["windowsDevice"]!
              .map((x) => WindowsDeviceModel.fromJson(x))),
      dadDevice: json["dadDevice"] == null
          ? []
          : List<DadDeviceModel>.from(
              json["dadDevice"]!.map((x) => DadDeviceModel.fromJson(x))),
      allowLogin: json["allowLogin"] == null
          ? []
          : List<AllowLoginModel>.from(
              json["allowLogin"]!.map((x) => AllowLoginModel.fromJson(x))),
      solveQuiz: Map.from(json["solveQuiz"]!).map((k, v) =>
          MapEntry<String, SolveQuizModel>(k, SolveQuizModel.fromJson(v))),
      seenPDF: Map.from(json["seenPDF"]!).map((k, v) =>
          MapEntry<String, SeenPDFModel>(k, SeenPDFModel.fromJson(v))),
      seenVideos: Map.from(json["seenVideos"]!).map((k, v) =>
          MapEntry<String, SeenVideoModel>(k, SeenVideoModel.fromJson(v))),
      lecturesAttended: Map.from(json["lecturesAttended"]!).map((k, v) =>
          MapEntry<String, LectureAttendedModel>(
              k, LectureAttendedModel.fromJson(v))),
      codesUsed: Map.from(json["codesUsed"]!).map((k, v) =>
          MapEntry<String, CodesUsedModel>(k, CodesUsedModel.fromJson(v))),
      listLecturesAttended: json['listLecturesAttended'] ?? const [],
      financialDues: json['financialDues'] == null
          ? null
          : FinancialDues.fromJson(json['financialDues']),
      privetSeen: json['privetSeen'] ??
          [].map((e) => PrivetSeenModel.fromJson(e)).toList(),
      delete:
          json['delete'] == null ? null : DeleteModel.fromJson(json['delete']),
      block: json['block'] == null ? null : BlockModel.fromJson(json['block']),
      // timeCreateAccount: json['timeCreateAccount'] == null
      //     ? null
      //     : Timestamp.fromDateTime(DateTime.parse(json['timeCreateAccount'])),
      subscription: json['subscription']is String
          ? null
          :  json['subscription'],
      // birthday: json['birthday'] == ''
      //     ? null
      //     : Timestamp.fromDateTime(DateTime.parse(json['birthday'])),
      financial: json['financial'] ?? 60,
      appVersion: json['appVersion'] ?? "",
      city: json['city'] ?? "",
      createBy: json['createBy'] ?? "",
      accountConfirmation: json['accountConfirmation'] ?? false,
    );
  }

  // تابع toJson

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nameVariations': nameVariations,
      'uuid': uuid,
      'address': address,
      'password': password,
      'centerName': centerName,
      'itemPaid': Map.from(itemPaid!)
          .map((k, v) => MapEntry<String, dynamic>(k, v.toJson(),),),
      'confirmPassword': confirmPassword,
      // 'school': school,
      'myPhone': myPhone,
      'dadPhone': dadPhone,
      'classYear': classYear,
      'year': year,
      'center': center,
      'token': token,
      'wallet': wallet,
      'scoreBankQuestion': scoreBankQuestion,
      'star': star,
      'takeScreenShot': takeScreenShot,
      'maxDevice': maxDevice,
      // 'generalSection': generalSection,
      'specialtySection': specialtySection,
      'note': note,
      'studentCode': studentCode,
      'lastSeen': lastSeen,
      'lastSeenDad': lastSeenDad,
      'device': device == null ? [] : device!.map((x) => x.toJson()).toList(),
      "webDevice": webDevice == null
          ? []
          : webDevice!.map((x) => x.toJson()).toList(),
      "listIcons": listIcons == null ? [] : listIcons!,
      "windowsDevice": windowsDevice == null
          ? []
          : windowsDevice!.map((x) => x.toJson()).toList(),
      "dadDevice": dadDevice == null
          ? []
          :dadDevice!.map((x) => x.toJson()).toList(),
      'solveQuiz': Map.from(solveQuiz!)
          .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      'seenPDF': Map.from(seenPDF!)
          .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      'seenVideos': Map.from(seenVideos!)
          .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      'lecturesAttended': Map.from(lecturesAttended!)
          .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      'codesUsed': Map.from(codesUsed!)
          .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      'allowLogin': allowLogin.map((e) => e.toJson()).toList(),
      'listLecturesAttended': listLecturesAttended ?? [],
      'financialDues': financialDues?.toJson(),
      'privetSeen': privetSeen?.map((e) => e.toJson()).toList() ?? [],
      'delete': delete?.toJson(),
      'block': block?.toJson(),
      'financial': financial,
      'appVersion': appVersion,
      'city': city,
      'createBy': createBy,
      // 'birthday': birthday == null ? '' : birthday?.toDateTime().toIso8601String(),
      // 'subscription':
      //     subscription == null ? '' : subscription?.toDateTime().toIso8601String(),
      // 'timeCreateAccount': timeCreateAccount == null
      //     ? ''
      //     : timeCreateAccount?.toDateTime().toIso8601String(),
      'accountConfirmation': accountConfirmation ?? false,
    };
  }
}

class PrivetSeenModel {
  String? id;
  // Timestamp? startTime;
  // Timestamp? finishTime;
  // Timestamp? time;
  String? adminName;

  PrivetSeenModel({
    this.id = "",
    // this.time,
    // this.startTime,
    // this.finishTime,
    this.adminName = "",
  });

  factory PrivetSeenModel.fromJson(Map<String, dynamic> json) {
    return PrivetSeenModel(
      id: json['id'] ?? '',
      // time: Timestamp.fromDateTime(DateTime.parse(json['time'])),
      // startTime: Timestamp.fromDateTime(DateTime.parse(json['startTime'])),
      // finishTime: Timestamp.fromDateTime(DateTime.parse(json['finishTime'])),
      adminName: json['adminName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      // 'time': time?.toDateTime().toIso8601String(),
      // 'startTime': startTime?.toDateTime().toIso8601String(),
      // 'finishTime': finishTime?.toDateTime().toIso8601String(),
      'adminName': adminName,
    };
  }
}

class FinancialDues {
  int? cost;
  // Timestamp? time;
  String? adminName;
  String? note;

  FinancialDues({
    this.cost = 0,
    // this.time,
    this.note = '',
    this.adminName = "",
  });

  factory FinancialDues.fromJson(Map<String, dynamic> json) {
    return FinancialDues(
      cost: json['cost'] ?? 0,
      // time: json['time'] == null
      //     ? null
      //     : Timestamp.fromDateTime(DateTime.parse(json['time'])),
      adminName: json['adminName'] ?? '',
      note: json['note'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'time': time?.toDateTime().toIso8601String(),
      'adminName': adminName,
      'cost': cost,
      'note': note,
    };
  }
}

class SolveQuizModel {
  String? idQuiz;
  int? timerForFinishQuiz;
  // Timestamp? startTime;
  // Timestamp? finishTime;
  int? totalDegree;
  int? studentDegree;
  bool? tryAgan;
  String? titleQuiz;
  List<AnswerModel>? answers;

  SolveQuizModel({
    this.idQuiz = "",
    this.timerForFinishQuiz = 0,
    // this.startTime,
    this.titleQuiz,
    // this.finishTime,
    this.tryAgan = false,
    this.totalDegree = 0,
    this.studentDegree = 0,
    this.answers,
  });

  factory SolveQuizModel.fromJson(Map<String, dynamic> json) {
    var answersList = json['answers'] as List<dynamic>;
    List<AnswerModel> parsedAnswers =
        answersList.map((answer) => AnswerModel.fromJson(answer)).toList();

    return SolveQuizModel(
      idQuiz: json['idQuiz'] ?? '',
      titleQuiz: json['titleQuiz'] ?? '',
      timerForFinishQuiz: json['timerForFinishQuiz'] ?? 0,
      // startTime: json['startTime'] == null
      //     ? null
      //     : Timestamp.fromDateTime(DateTime.parse(json['startTime'])),
      // finishTime: json['finishTime'] == null
      //     ? null
      //     : Timestamp.fromDateTime(DateTime.parse(json['finishTime'])),
      totalDegree: json['totalDegree'] ?? 0,
      studentDegree: json['studentDegree'] ?? 0,
      tryAgan: json['tryAgan'] ?? false,
      answers: parsedAnswers,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idQuiz': idQuiz ?? "",
      'titleQuiz': titleQuiz ?? "",
      'timerForFinishQuiz': timerForFinishQuiz ?? 0,
      // 'startTime': startTime?.toDateTime().toIso8601String(),
      'tryAgan': tryAgan ?? false,
      // 'finishTime': finishTime?.toDateTime().toIso8601String(),
      'totalDegree': totalDegree ?? 0,
      'studentDegree': studentDegree ?? 0,
      'answers': answers?.map((answer) => answer.toJson()).toList(),
    };
  }
}

class DeviceModel {
  String? idDevice;
  String? sdkVersion;
  String? platForm;
  double? totalDiskSpace;
  double? freeDiskSpace;
  // Timestamp? timeLogin;
  // Timestamp? timeLogout;
  String? token;
  String? localeName;

  // ignore: prefer_typing_uninitialized_variables
  Map? data;
  bool? active;
  bool? delete;
  bool? isPhysicalDevice;

  DeviceModel({
    this.idDevice = "",
    this.sdkVersion = "",
    this.platForm = "",
    this.totalDiskSpace = 0.0,
    this.freeDiskSpace = 0.0,
    this.localeName = '',
    this.data,
    // this.timeLogin,
    // this.timeLogout,
    this.token = '',
    this.active = true,
    this.delete = false,
    this.isPhysicalDevice = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'idDevice': idDevice,
      'sdkVersion': sdkVersion,
      'platForm': platForm,
      'data': data,
      // 'timeLogin': timeLogin?.toDateTime().toIso8601String(),
      // 'timeLogout': timeLogout?.toDateTime().toIso8601String(),
      'localeName': localeName,
      'token': token,
      'active': active,
      'delete': delete,
      'isPhysicalDevice': isPhysicalDevice,
    };
  }

  factory DeviceModel.fromJson(json) {
    return DeviceModel(
      idDevice: json['idDevice'] ?? '',
      data: json['data'] ?? {},
      localeName: json['localeName'] ?? '',
      sdkVersion: json['sdkVersion'] ?? '',
      platForm: json['platForm'] ?? '',
      totalDiskSpace: (json['totalDiskSpace'] ?? 0.0).toDouble(),
      freeDiskSpace: (json['freeDiskSpace'] ?? 0.0).toDouble(),
      // timeLogin: json['timeLogin'] == null
      //     ? null
      //     : Timestamp.fromDateTime(DateTime.parse(json['timeLogin'])),
      // timeLogout: json['timeLogout'] == null
      //     ? null
      //     : Timestamp.fromDateTime(DateTime.parse(json['timeLogout'])),
      token: json['token'] ?? '',
      active: json['active'] ?? false,
      delete: json['delete'] ?? false,
      isPhysicalDevice: json['isPhysicalDevice'] ?? false,
    );
  }
}

class WindowsDeviceModel {
  String? idDevice;

  // String? sdkVersion;
  String? platForm;

  // double? totalDiskSpace;
  // double? freeDiskSpace;
  Timestamp? timeLogin;
  Timestamp? timeLogout;
  String? token;
  String? localeName;

  // ignore: prefer_typing_uninitialized_variables
  Map? data;
  bool? active;
  bool? delete;
  bool? isPhysicalDevice;

  WindowsDeviceModel({
    this.idDevice = "",
    this.platForm = "",
    this.localeName = '',
    this.data,
    this.timeLogin,
    this.timeLogout,
    this.token = '',
    this.active = true,
    this.delete = false,
    this.isPhysicalDevice = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'idDevice': idDevice,
      'platForm': platForm,
      'data': data,
      'timeLogin': timeLogin?.toDateTime().toIso8601String(),
      'timeLogout': timeLogout?.toDateTime().toIso8601String(),
      'localeName': localeName,
      'token': token,
      'active': active,
      'delete': delete,
      'isPhysicalDevice': isPhysicalDevice,
    };
  }

  factory WindowsDeviceModel.fromJson(Map<String, dynamic> json) {
    return WindowsDeviceModel(
      idDevice: json['idDevice'] ?? '',
      data: json['data'] ?? {},
      localeName: json['localeName'] ?? '',
      platForm: json['platForm'] ?? '',
      timeLogin: json['timeLogin'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['timeLogin'])),
      timeLogout: json['timeLogout'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['timeLogout'])),
      token: json['token'] ?? '',
      active: json['active'] ?? false,
      delete: json['delete'] ?? false,
      isPhysicalDevice: json['isPhysicalDevice'] ?? false,
    );
  }
}

class WebDeviceModel {
  String? idDevice;

  // String? sdkVersion;
  String? platForm;

  // double? totalDiskSpace;
  // double? freeDiskSpace;
  Timestamp? timeLogin;
  Timestamp? timeLogout;
  String? token;
  String? localeName;

  // ignore: prefer_typing_uninitialized_variables
  Map? data;
  bool? active;
  bool? delete;
  bool? isPhysicalDevice;

  WebDeviceModel({
    this.idDevice = "",
    this.platForm = "",
    this.localeName = '',
    this.data,
    this.timeLogin,
    this.timeLogout,
    this.token = '',
    this.active = true,
    this.delete = false,
    this.isPhysicalDevice = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'idDevice': idDevice,
      'platForm': platForm,
      'data': data,
      'timeLogin': timeLogin?.toDateTime().toIso8601String(),
      'timeLogout': timeLogout?.toDateTime().toIso8601String(),
      'localeName': localeName,
      'token': token,
      'active': active,
      'delete': delete,
      'isPhysicalDevice': isPhysicalDevice,
    };
  }

  factory WebDeviceModel.fromJson(Map<String, dynamic> json) {
    return WebDeviceModel(
      idDevice: json['idDevice'] ?? '',
      data: json['data'] ?? {},
      localeName: json['localeName'] ?? '',
      platForm: json['platForm'] ?? '',
      timeLogin: json['timeLogin'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['timeLogin'])),
      timeLogout: json['timeLogout'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['timeLogout'])),
      token: json['token'] ?? '',
      active: json['active'] ?? false,
      delete: json['delete'] ?? false,
      isPhysicalDevice: json['isPhysicalDevice'] ?? false,
    );
  }
}

class BlockModel {
  String? nameAssistBlocked;
  String? nameAssistUnBlocked;
  String? note;
  Timestamp? timeBlocked;
  Timestamp? timeUnBlocked;
  bool? block;

  BlockModel({
    this.nameAssistBlocked = '',
    this.nameAssistUnBlocked = '',
    this.note = '',
    this.timeBlocked,
    this.timeUnBlocked,
    this.block = false,
  });

  factory BlockModel.fromJson(Map<String, dynamic> json) {
    return BlockModel(
      nameAssistBlocked: json['nameAssistBlocked'] ?? '',
      nameAssistUnBlocked: json['nameAssistUnBlocked'] ?? '',
      note: json['note'] ?? '',
      timeBlocked: json['timeBlocked'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['timeBlocked'])),
      timeUnBlocked: json['timeUnBlocked'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['timeUnBlocked'])),
      block: json['block'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nameAssistBlocked': nameAssistBlocked,
      'nameAssistUnBlocked': nameAssistUnBlocked,
      'note': note,
      'timeBlocked': timeBlocked?.toDateTime().toIso8601String(),
      'timeUnBlocked': timeUnBlocked?.toDateTime().toIso8601String(),
      'block': block,
    };
  }
}

class DeleteModel {
  String? nameDeleted;
  String? nameUnDeleted;
  String? note;
  Timestamp? timeDeleted;
  Timestamp? timeUnDeleted;
  bool? deleted;

  DeleteModel({
    this.nameDeleted = '',
    this.nameUnDeleted = '',
    this.note = '',
    this.timeDeleted,
    this.timeUnDeleted,
    this.deleted = false,
  });

  factory DeleteModel.fromJson(Map<String, dynamic> json) {
    return DeleteModel(
      nameDeleted: json['nameDeleted'] ?? '',
      nameUnDeleted: json['nameUnDeleted'] ?? '',
      note: json['note'] ?? '',
      timeDeleted: json['timeDeleted'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['timeDeleted'])),
      timeUnDeleted: json['timeUnDeleted'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['timeUnDeleted'])),
      deleted: json['deleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'timeDeleted': timeDeleted?.toDateTime().toIso8601String(),
      'timeUnDeleted': timeUnDeleted?.toDateTime().toIso8601String(),
      'note': note,
      'deleted': deleted,
      'nameDeleted': nameDeleted,
      'nameUnDeleted': nameUnDeleted,
    };
  }
}

class DadDeviceModel {
  String? idDevice;
  String? sdkVersion;
  String? platFormVersion;
  String? platForm;
  Timestamp? timeLogin;
  Timestamp? timeLogout;
  String? token;
  bool? active;
  bool? delete;
  bool? isPhysicalDevice;

  DadDeviceModel({
    this.idDevice,
    this.sdkVersion,
    this.platFormVersion,
    this.platForm,
    this.timeLogin,
    this.timeLogout,
    this.token,
    this.active,
    this.delete,
    this.isPhysicalDevice,
  });

  factory DadDeviceModel.fromJson(Map<String, dynamic> json) {
    return DadDeviceModel(
      idDevice: json['idDevice'] ?? '',
      sdkVersion: json['sdkVersion'] ?? '',
      platFormVersion: json['platFormVersion'] ?? '',
      platForm: json['platForm'] ?? '',
      timeLogin: json['timeLogin'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['timeLogin'])),
      timeLogout: json['timeLogout'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['timeLogout'])),
      token: json['token'] ?? '',
      active: json['active'] ?? false,
      delete: json['delete'] ?? false,
      isPhysicalDevice: json['isPhysicalDevice'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idDevice': idDevice,
      'sdkVersion': sdkVersion,
      'platFormVersion': platFormVersion,
      'platForm': platForm,
      'timeLogin': timeLogin?.toDateTime().toIso8601String(),
      'timeLogout': timeLogout?.toDateTime().toIso8601String(),
      'token': token,
      'active': active,
      'delete': delete,
      'isPhysicalDevice': isPhysicalDevice,
    };
  }
}

class AllowLoginModel {
  String? nameAssist;
  Timestamp? time;

  AllowLoginModel({
    required this.time,
    required this.nameAssist,
  });

  factory AllowLoginModel.fromJson(Map<String, dynamic> json) {
    return AllowLoginModel(
      nameAssist: json['nameAssist'] ?? '',
      time: json['time'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['time'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time?.toDateTime().toIso8601String(),
      'nameAssist': nameAssist,
    };
  }
}

class CodesUsedModel {
  String? code;
  String? idItem;
  String? typeItem;
  String? typeCode;
  String? title;
  Timestamp? time;
  Timestamp? startTime;
  Timestamp? finishTime;

  CodesUsedModel({
    required this.code,
    required this.idItem,
    required this.typeItem,
    required this.typeCode,
    required this.title,
    required this.time,
    this.startTime,
    this.finishTime,
  });

  factory CodesUsedModel.fromJson(Map<String, dynamic> json) {
    return CodesUsedModel(
      code: json['code'] ?? '',
      idItem: json['idItem'] ?? '',
      typeItem: json['typeItem'] ?? '',
      typeCode: json['typeCode'] ?? '',
      title: json['title'] ?? '',
      time: json['time'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['time'])),
      startTime: json['startTime'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['startTime'])),
      finishTime: json['finishTime'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['finishTime'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'idItem': idItem,
      'typeCode': typeCode,
      'typeItem': typeItem,
      'title': title,
      'time': time?.toDateTime().toIso8601String(),
      'startTime': startTime?.toDateTime().toIso8601String(),
      'finishTime': finishTime?.toDateTime().toIso8601String(),
    };
  }
}

class AnswerModel {
  String? idQuestion;
  String? answer;

  AnswerModel({
    required this.idQuestion,
    this.answer,
  });

  Map<String, dynamic> toJson() {
    return {
      'idQuestion': idQuestion ?? '',
      'answer': answer ?? '',
    };
  }

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      idQuestion: json['idQuestion'] ?? '',
      answer: json['answer'] ?? '',
    );
  }
}

class SeenVideoModel {
  String? idVideo;
  String? titleVideo;

  int? entryCounter;
  String? subtitle;
  List<dynamic>? timeFinish;
  Timestamp? time;

  SeenVideoModel({
    this.idVideo = "",
    this.timeFinish = const [],
    this.time,
    this.entryCounter = 0,
    this.titleVideo = "",
    this.subtitle = "",
  });

  factory SeenVideoModel.fromJson(Map<String, dynamic> json) {
    return SeenVideoModel(
      idVideo: json['idVideo'] ?? '',
      time: json['time'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['time'])),
      timeFinish: json['timeFinish'] ?? [],
      titleVideo: json['titleVideo'] ?? '',
      subtitle: json['subtitle'] ?? '',
      entryCounter: json['entryCounter'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idVideo': idVideo,
      'timeFinish': timeFinish,
      'titleVideo': titleVideo,
      'entryCounter': entryCounter,
      'subtitle': subtitle,
      'time': time?.toDateTime().toIso8601String(),
    };
  }
}

class SeenPDFModel {
  String? idPdf;
  String? titlePdf;
  Timestamp? time;

  SeenPDFModel({
    this.idPdf = "",
    this.titlePdf = "",
    this.time,
  });

  factory SeenPDFModel.fromJson(Map<String, dynamic> json) {
    return SeenPDFModel(
      idPdf: json['idPdf'] ?? '',
      titlePdf: json['titlePdf'] ?? '',
      time: json['time'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['time'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idPdf': idPdf ?? '',
      'titlePdf': titlePdf ?? '',
      'time': time?.toDateTime().toIso8601String(),
    };
  }
}

class LectureAttendedModel {
  String? centerStudent;
  String? centerAttend;
  String? idLecture;
  Timestamp? time;
  String? title;
  String? totalDegree;
  String? studentDegree;
  String? assistName;

  LectureAttendedModel({
    this.centerStudent = "",
    this.centerAttend = "",
    this.time,
    this.title = "",
    this.assistName = "",
    this.studentDegree = "0",
    this.totalDegree = "0",
    this.idLecture = "",
  });

  factory LectureAttendedModel.fromJson(Map<String, dynamic> json) {
    return LectureAttendedModel(
      centerStudent: json['centerStudent'] ?? '',
      centerAttend: json['centerAttend'] ?? '',
      time: json['time'] == null
          ? null
          : Timestamp.fromDateTime(DateTime.parse(json['time'])),
      title: json['title'] ?? '',
      assistName: json['assistName'] ?? '',
      totalDegree: json['totalDegree'] ?? '',
      studentDegree: json['studentDegree'] ?? '',
      idLecture: json['idLecture'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'centerStudent': centerStudent,
      'centerAttend': centerAttend,
      'time': time?.toDateTime().toIso8601String(),
      'title': title,
      'assistName': assistName,
      'studentDegree': studentDegree,
      'totalDegree': totalDegree,
      'idLecture': idLecture,
    };
  }
}
