import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:thelouvre/model/constdata/buttn.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';
import 'package:thelouvre/screens/track/track.dart';

// ignore: use_key_in_widget_constructors
class OrderPlaced extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.close,
              color: black1,
            ),
          ),
        ],
      ),
      body: Container(
        color: white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Styles.regular(
              "Order placed",
              ff: "AvenirHeavy",
              fs: 30.sp,
            ),
            Styles.regular(
              "Your order #212423 was placed with success.\n  You can see the status of the order at any time.",
              ff: "AvenirHeavy",
              fs: 14.sp,
            ),
            Image.asset("assets/images/done.png"),
            const Spacer(),
            Flatbtn(() {
              Get.to(Tracking());
            }, "SEE ORDER STATUS", skin1),
            sizevertical(height: 15.h),
            Flatbtn(() {}, "CLOSE", skin1),
            sizevertical(height: 15.h),
          ],
        ),
      ),
    );
  }
}
