import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:thelouvre/model/constdata/buttn.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../model/constdata/otpsend.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class OtpVerified extends StatelessWidget {
  bool _start = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close,
              size: 50.h.w,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Styles.bold("Enter the 4 digit code sent to:", fs: 25.sp),
          sizevertical(height: 15.h),
          Styles.bold("1 222 555 6677", fs: 25.sp),
          sizevertical(height: 30.h),
          Styles.regular(
              "We've sent a 4 digit code to your phone number.\nPlease enter the verification code.",
              al: TextAlign.center,
              fs: 15.sp),
          sizevertical(height: 80.h),
          OTPTextField(
            length: 4,
            width: MediaQuery.of(context).size.width,
            fieldWidth: 20.w,
            style: TextStyle(
              fontSize: 12.sp,
              color: skin1,
            ),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.underline,
            otpFieldStyle: OtpFieldStyle(
              enabledBorderColor: skin1,
              errorBorderColor: red2,
            ),
            onCompleted: (pin) {
              Get.to(
                OtpSend(
                  () {},
                  "assets/icons/otpsend.png",
                  'Phone verified',
                  'Congratulations, your phone number has been \nverified. You can now start using the app.',
                  'CONTINUE',
                ),
              );
            },
          ),
          const Spacer(),
          Styles.regular("Didn’t receive the SMS?",
              fs: 15.sp, al: TextAlign.center),
          Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Styles.regular("Request new code in ",
                    fs: 15.sp, al: TextAlign.center),
                Countdown(
                  seconds: 5,
                  build: (BuildContext context, double time) =>
                      Text(time.toString()),
                  interval: const Duration(milliseconds: 100),
                  onFinished: () {
                    _start = false;
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Flatbtn(() {
              // ignore: avoid_print
              !_start ? print("purur thai gayu ") : print("chalu chhe ");
            }, "REQUESTING", skin1),
          )
        ],
      ),
    );
  }
}
