import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:thelouvre/model/constdata/buttn.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  List<PageViewModel> pages = [
    PageViewModel(
      title: "Satyam",
      bodyWidget: Column(
        children: [
          img("assets/images/Gulcehreibrik.png"),
          Styles.regular(
            "€5650",
            c: Colors.white,
            fs: 20.sp,
            ls: 0.4,
            ff: "AvenirHeavy",
          ),
          sizevertical(height: 5.h),
          Styles.regular(
            "hıstory Culture glass",
            c: Colors.white,
            fs: 13.sp,
            ls: 1.0,
            ff: "AvenirHeavy",
          ),
          sizevertical(height: 5.h),
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Styles.regular(
              "Gülçehre Ibrik \nLimited Edition",
              c: Colors.white,
              fs: 35.sp,
              ff: "AvenirHeavy",
            ),
          ),
          sizevertical(height: 84.h),
          Flatbtn(
            () {},
            "MASTER BUTTON",
            const Color(0xFFD7A324),
          ),
        ],
      ),
    ),
    PageViewModel(
      title: "Satyam",
      bodyWidget: Column(
        children: [
          Styles.regular(
            "hıstory Culture glass",
            c: Colors.white,
            fs: 13.sp,
            ls: 1.0,
            ff: "AvenirHeavy",
          ),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            width: 322.w,
            height: 101.h,
            child: Styles.regular(
              "Hagia Sophia\nDeesis Mosaic Vase",
              c: Colors.white,
              fs: 35.sp,
              ff: "AvenirHeavy",
            ),
          ),
          sizevertical(height: 9.5.h),
          Styles.regular(
            "€5650",
            c: Colors.white,
            fs: 20.sp,
            ls: 0.4,
            ff: "AvenirHeavy",
          ),
          sizevertical(height: 10.h),
          img("assets/images/SoteriaVazo.png"),
          sizevertical(height: 10.h),
          Flatbtn(
            () {},
            "MASTER BUTTON",
            const Color(0xFFD7A324),
          ),
        ],
      ),
    ),
    PageViewModel(
      title: "Satyam",
      bodyWidget: Column(
        children: [
          img("assets/images/MysticalVase.png"),
          Styles.regular(
            "€3150",
            c: Colors.white,
            fs: 20.sp,
            ff: "AvenirHeavy",
          ),
          sizevertical(height: 8.h),
          Styles.regular(
            "Mystical Vase\nLimited Edition",
            c: Colors.white,
            fs: 35.sp,
            ff: "AvenirHeavy",
          ),
          sizevertical(height: 30.h),
          InkWell(
              onTap: () {
                Get.offNamed('/register');
              },
              child: Flatbtn(() {
                Get.offNamed('/register');
              }, "SIGN IN", Colors.transparent)),
          sizevertical(height: 10.h),
          Flatbtn(
            () {},
            "MASTER BUTTON",
            const Color(0xFFD7A324),
          ),
        ],
      ),
    ),
  ];

  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        dotsDecorator: DotsDecorator(
            activeColor: skin1,
            size: Size(375.w / 75, 375.w / 75),
            activeSize: Size(375.w / 18.75, 375.w / 37.5),
            color: const Color(0xFF707070)),
        globalBackgroundColor: black1,
        showNextButton: true,
        next: const Text("Next"),
        done: const Text("Done"),
        doneColor: Colors.black,
        onDone: () {
          Get.toNamed("/register");
        },
        animationDuration: 350,
        color: Colors.black,
        pages: pages,
      ),
    );
  }
}
