// import 'package:better_player/better_player.dart';
// import 'package:better_player/better_player.dart';
// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'dart:async';
// import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
//import 'package:pod_player/pod_player.dart';
//import 'package:video_player/video_player.dart';

import '../login/login_controller.dart';
import '../models/user_model.dart';

class VideoPlayerController extends GetxController {
  // late BetterPlayerController betterPlayerController;
  // HomeController homeController = Get.find<HomeController>();
 // late PodPlayerController? chewieController;
  UserModel userModel = UserModel();
  final loginController = Get.find<LoginController>();
  late final player = Player(
    configuration: const PlayerConfiguration(
      bufferSize: 4 << 20, // 1MB
      logLevel: MPVLogLevel.error,
    ),
  );
  late final controller = VideoController(player);
  // late ChewieController? chewieController;
  // late VideoPlayerController videoPlayerController;
  String videoUrl(String url) {
    return url.replaceAll(".m3u8", ".mpd");
  }
  StreamSubscription? _subscription;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    player.open(Media(videoUrl(loginController.qrModel.videoUrl!)));

   // chewieController = PodPlayerController(
   //    podPlayerConfig: const PodPlayerConfig(
   //      autoPlay: true,
   //      forcedVideoFocus: true,
   //      videoQualityPriority: [
   //        1080,
   //        720,
   //      ],
   //    ),
   //    playVideoFrom: PlayVideoFrom.network(
   //      loginController.qrModel.videoUrl!,
   //      videoPlayerOptions: VideoPlayerOptions(
   //        allowBackgroundPlayback: false,
   //        mixWithOthers: false,
   //       ),
   //      httpHeaders: {
   //        "Authorization":
   //            "Bearer 2fd82211af2095d02d0b85646d62dbae288fbb7a0b22fb353a4e94ede14b2f6b"
   //      },
   //    ),
   //  )..initialise();
    increaseEntryCounter();
    // listenerVideo();
    // debugPrint("onInit");
  }

  Timer? timer;
 final  speedRates = {
    // '0.25x': 0.25,
    // '0.5x': 0.5,
    '1.0x': 1.0,
    '1.5x': 1.5,
    '1.75x': 1.75,
    '2.0x': 2.0,
  };
  void changeSpeed() async{

    showBottomSheet(
      context: Get.context!,
      elevation: 10,
      builder: (context) {
        return  Column(
            mainAxisSize: MainAxisSize.min,
            children: speedRates.keys.map((k) {
              final v = speedRates[k]!;
              return ListTile(
                title: Text(k),
                onTap: () {
                  player.setRate(v);
                  Navigator.pop(context);
                },
              );
            }).toList(),
          );
      },
    );
  }
  increaseEntryCounter() async {
    //delay 2 min add 1 to entryCounter once only one time
    //dispose timer if i close before 2 min
    debugPrint("start timer");

    if(loginController.qrModel.userUuid!=""){
      timer = Timer.periodic(const Duration(minutes: 4), (timr) async {
        debugPrint("increaseEntryCounter");
        await Firestore.instance
            .collection("student")
            .document(loginController.qrModel.userUuid.toString())
            .update({
          "seenVideos.${loginController.qrModel.videoID}.entryCounter":
               userModel.seenVideos!["${loginController.qrModel.videoID}"]!.entryCounter!+1,
        }).then((value) {
          debugPrint("increaseEntryCounter");
        });
        timer!.cancel();
      });
    }
  }

  @override
  void onClose() {
   // chewieController!.dispose();
    timer!.cancel();
    player.dispose();

    super.onClose();
  }

  sendNewTime(String elements) async {
    List list = userModel.seenVideos!["${loginController.qrModel.videoID}"]!.timeFinish!;
    list.add(elements);
   await Firestore.instance
        .collection("student")
        .document(loginController.qrModel.userUuid.toString())
        .update({
      'seenVideos.${loginController.qrModel.videoID}.timeFinish':
          list,
    });
  }
  listenerUserModel(){
    if(loginController.qrModel.userUuid!="") {
      Firestore.instance
        .collection("student")
        .document(loginController.qrModel.userUuid.toString())
        .stream
        .listen((event) {
       userModel = UserModel.fromJson(event!.map);

       listenerVideo();
    });
    }
  }

  listenerVideo() {
    player.stream.position.listen((Duration position) {
      Duration progress = position;
      late Duration duration  ;
      player.stream.duration.first.then((value) {
        duration = value;
      });
      final listTimeFinish =
        userModel.seenVideos!["${loginController.qrModel.videoID}"]!.timeFinish!;
      if (progress > duration * 0.05 &&
          progress < duration * 0.08 &&
          !listTimeFinish.contains("5")) {
        sendNewTime("5");
      } else if (progress > duration * 0.20 &&
          progress < duration * 0.23 &&
          !listTimeFinish.contains("20")) {
        sendNewTime("20");
      } else if (progress > duration * 0.25 &&
          progress < duration * 0.30 &&
          !listTimeFinish.contains("25")) {
        sendNewTime("25");
      } else if (progress > duration * 0.40 &&
          progress < duration * 0.43 &&
          !listTimeFinish.contains("40")) {
        sendNewTime("40");
      } else if (progress > duration * 0.60 &&
          progress < duration * 0.63 &&
          !listTimeFinish.contains("60")) {
        sendNewTime("60");
      } else if (progress > duration * 0.80 &&
          progress < duration * 0.83 &&
          !listTimeFinish.contains("80")) {
        sendNewTime("80");
      } else if (progress > duration * 0.95 &&
          progress < duration * 0.98 &&
          !listTimeFinish.contains("95")) {
        sendNewTime("95");
      }
    });
  }
}
