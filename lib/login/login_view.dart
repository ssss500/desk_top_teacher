import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../widgte/custom_text.dart';
import 'login_controller.dart';

class LoginView extends StatelessWidget {
  DecorationImage imageBG ;
  Widget logo;

  LoginView({
    super.key,
    required this.imageBG,
    required this.logo  ,
  });

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // windows ui
    return Scaffold(
      body: Center(
        child: Container(
          height: height * 0.8,
          width: width * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: height * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    //image background
                    image: imageBG,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        logo,
                        const SizedBox(
                          height: 20,
                        ),
                        //registration instructions using CustomText and space
                        CustomText(
                          "تعليمات التسجيل",
                          color: Colors.white,
                        ),
                        space(),
                        CustomText(
                          "1- ادخل علي الفيديو الذي تريد مشاهدته",
                          color: Colors.white,
                        ),
                        space(),
                        CustomText(
                          "2- اضغط علي ⋮ اعلي الفيديو علي اليمين",
                          color: Colors.white,
                        ),
                        space(),
                        CustomText(
                          "3- اضغط علي مشاهدة الفيديو علي الكمبيوتر",
                          color: Colors.white,
                        ),
                        space(),
                        CustomText(
                          "4- عند فتح الكاميره قبل بعمل سكان للكود",
                          color: Colors.white,
                        ),
                        space(),
                        space(),
                        space(),
                        CustomText(
                          "${controller.myVersion} V",
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child:
                    //qr code
                    Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<LoginController>(builder: (controller) {
                      return Column(
                        children: [
                          if (controller.qrModel.id == "")
                            const CircularProgressIndicator()
                          else
                            QrImageView(
                              data: controller.qrModel.id.toString(),
                              version: QrVersions.auto,
                              size: 300.0,
                            ),
                          // SizedBox(
                          //   height: 300,
                          //   width: 300,
                          //   child: PrettyQrView.data(
                          //     data: controller.qrModel.id.toString(),
                          //
                          //     decoration: const PrettyQrDecoration(
                          //       image: PrettyQrDecorationImage(
                          //         image: AssetImage('assets/images/logo.png'),
                          //       ),
                          //     ),
                          //     // version: QrVersions.auto,
                          //     // size: 300.0,
                          //   ),
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          if (kDebugMode)
                            CustomText(
                              controller.qrModel.id.toString(),
                              color: Colors.black,
                            ),
                        ],
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  space() {
    return const SizedBox(
      height: 20,
    );
  }
}
