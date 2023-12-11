import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:desk_top_teacher/video/video_player_controller.dart'
    as videoPlayerController;
import 'package:media_kit_video/media_kit_video.dart' as mkv;
import 'package:media_kit_video/media_kit_video_controls/media_kit_video_controls.dart';
//import 'package:pod_player/pod_player.dart';
import 'package:media_kit_video/media_kit_video_controls/media_kit_video_controls.dart'
    as media_kit_video_controls;

import '../login/login_controller.dart';
import '../login/login_view.dart';
import '../widgte/custom_text.dart';
    const Color primaryColor = Color(0xff0F214C);

class VideoView extends StatelessWidget {
  VideoView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<videoPlayerController.VideoPlayerController>(
        init: videoPlayerController.VideoPlayerController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 70,
                  color: primaryColor,
                  child: Stack(
                    children: [
                      //title
                      CustomText(
                        controller.loginController.qrModel.videoName ?? '',
                        color: Colors.white,
                      ),
                      Positioned(
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () {
                              // controller.loginController.createNewQr();
                              Get.offAll(LoginView());
                              LoginController loginController =
                                  Get.put(LoginController());
                              loginController.createNewQr();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height - 70,
                    child: // Wrap [Video] widget with [MaterialDesktopVideoControlsTheme].
                        MaterialDesktopVideoControlsTheme(
                      normal: MaterialDesktopVideoControlsThemeData(
                        // Modify theme options:
                        seekBarThumbColor: Colors.red,
                        seekBarPositionColor: Colors.red,
                        toggleFullscreenOnDoublePress: false,
                        // Modify top button bar:
                        // topButtonBar: [
                        //   const Spacer(),
                        //   MaterialDesktopCustomButton(
                        //     onPressed: () {
                        //       debugPrint('Custom "Settings" button pressed.');
                        //     },
                        //     icon: const Icon(Icons.settings),
                        //   ),
                        // ],
                        // Modify bottom button bar:
                        bottomButtonBar: [
                          const MaterialDesktopPlayOrPauseButton(),
                          const MaterialDesktopVolumeButton(),
                          const MaterialDesktopPositionIndicator(),
                          const Spacer(),

                          MaterialCustomButton(
                            onPressed: () {
                              Get.bottomSheet(
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),

                                    child: Material(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children:
                                            controller.speedRates.keys.map((k) {
                                          final v = controller.speedRates[k]!;
                                          return ListTile(
                                            title: Text(k),
                                            onTap: () {
                                              controller.player.setRate(v);
                                              Navigator.pop(context);
                                            },
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                  );
                            },
                            icon: const Icon(Icons.speed),
                          ),
                          // Added Skip Next Button
                          const MaterialDesktopFullscreenButton(),
                        ],
                      ),
                      fullscreen: const MaterialDesktopVideoControlsThemeData(),
                      child: Scaffold(
                        body: mkv.Video(
                          controller: controller.controller,
                          controls: media_kit_video_controls
                              .MaterialDesktopVideoControls,
                        ),
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
