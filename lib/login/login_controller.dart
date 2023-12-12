// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firedart/firestore/firestore.dart';

// import 'package:firedart/generated/google/protobuf/timestamp.pb.dart';
//import 'package:importfirebase_database/firebase_database.dart' as fb;
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/qr_model.dart';
import '../video/video_view.dart';

class LoginController extends GetxController {
  final myVersion = "1.0.0";
  QrModel qrModel = QrModel();
  String teacherId = '';



  @override
  void onInit() {

    // TODO: implement onInit
    super.onInit();

    // checkVersion();
  }
  @override
  void onReady() {
    // Firestore.initialize(teacherId);

    checkVersion();
    super.onReady();
  }

  checkVersion() async {
    await Firestore.instance
        .collection("windowsVersion")
        .document("version")
        .get()
        .then((value) {
      try {
        if (value != null) {
          if (value.map['version'] != null) {
            if (value.map['version'] != myVersion) {
              qrModel.id = '0';
              Get.defaultDialog(
                  title: "تحديث",
                  middleText: "هذا الاصدار لا يعمل حاليا، يرجى تحميل التحديث",
                  textConfirm: "تحميل",
                  backgroundColor: Colors.white,
                  barrierDismissible: false,
                  onConfirm: () async {
                    await launch(value.map['url']);
                  });
              // launch(value.map['url']);
            } else {
              createNewQr();
            }
          }
        }
      } on Exception catch (e) {
        createNewQr();

        // TODO
      }
    });
    update();
  }

  getFirebaseId() {
    // var ref = fb.FirebaseDatabase.instance.ref();
    //  return Timestamp.getDefault().toDateTime().microsecondsSinceEpoch.toString();
  }

  getInfoDevice() async {
    if (GetPlatform.isWindows) {
      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

      WindowsDeviceInfo windowsDeviceInfo = await deviceInfo.windowsInfo;
      return windowsDeviceInfo.deviceId;
    } else if (GetPlatform.isMacOS) {
      final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

      MacOsDeviceInfo macOsDeviceInfo = await deviceInfo.macOsInfo;
      return macOsDeviceInfo.computerName;
    }
  }

  createNewQr() async {
    qrModel = QrModel();
    qrModel.deviceID = await getInfoDevice();
    qrModel.id = DateTime.now().millisecondsSinceEpoch.toString();
    qrModel.createdAt = DateTime.now().millisecondsSinceEpoch.toString();

    await Firestore.instance
        .collection("qrWindows")
        .document(qrModel.id.toString())
        .set(qrModel.toJson());
    update();
    //open stream to listen to changes
    await listenStream();
    debugPrint("qrModel.id : ${qrModel.id}");
  }

  listenStream() async {
    Firestore.instance
        .collection("qrWindows")
        .document(qrModel.id.toString())
        .stream
        .listen((event) {
      if (event != null) {
        qrModel = QrModel.fromJson(event.map);
        update();
        if (qrModel.videoUrl != '') {
          debugPrint("event.data() 2 : ${event.map.toString()}");
          Get.to(() => VideoView());
        }
      }
    });
  }
}
