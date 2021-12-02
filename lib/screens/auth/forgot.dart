import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:thelouvre/model/constdata/buttn.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';

// ignore: use_key_in_widget_constructors
class Forgotten extends StatefulWidget {
  @override
  State<Forgotten> createState() => _ForgottenState();
}

class _ForgottenState extends State<Forgotten> {
  TextEditingController emails = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBar(
          backgroundColor: black1,
          elevation: 0.0,
          centerTitle: true,
          title: Styles.bold("RESET PASSWORD"),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: white,
            ),
            tooltip: 'Menu Icon',
            onPressed: () {
              Get.toNamed('/register');
            },
          ), //IconButton
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 25.h),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Styles.semiBold("Forgot your password?",
                  fs: 25, ff: "AvenirHeavy"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Styles.regular(
                "Enter your email address and we will send you \n instructions on how to reset your password.",
                fs: 14.sp,
                ls: 0.4,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.w.h),
              child: Padding(
                padding: EdgeInsets.only(bottom: 375.w / 18.75),
                child: TextFormField(
                  controller: emails,
                  validator: (value) => value!.isEmpty ? "Enter Email" : null,
                  keyboardType: TextInputType.name,
                  cursorColor: skin1,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: black1, fontSize: 16.sp),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: skin1),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Flatbtn(() {}, "RECOVER EMAIL", skin1),
            sizevertical(height: 30.h),
          ],
        ),
      ),
    );
  }
}
