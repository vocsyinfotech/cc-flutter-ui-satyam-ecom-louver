// ignore_for_file: must_be_immutable, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:thelouvre/model/categorymodel.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';

class ListViewfirst extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  ListViewfirst(
      {required this.data,
      required this.disc,
      required this.discount,
      required this.id,
      required this.save,
      required this.imageUrl,
      required this.title,
      required this.price});

  List<CategoryModel> data;
  bool discount;
  int disc;
  int id;
  bool save;
  String imageUrl;
  String title;
  String price;

  // ignore: use_key_in_widget_constructors
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ignore: prefer_const_constructors
        Get.toNamed("/productdetail", arguments: ScreenArguments(id, data));
      },
      child: SizedBox(
        height: 375.h / 1.25,
        width: 375.w / 1.87,
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  imageUrl,
                  height: 375.h / 2.5,
                  width: 375.w / 2.5,
                ),
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: "AvenirBook",
                    fontSize: 15.sp,
                  ),
                ),
                // Styles.regular(title, ff: "AvenirBook", fs: width / 25),
                Styles.regular(price, ff: "AvenirHeavy", fs: 375.w / 15),
              ],
            ),
            discount
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.all(3.h.w),
                      margin: EdgeInsets.only(right: 15.w),
                      height: 24.h,
                      width: 39.w,
                      decoration: BoxDecoration(
                          color: skin1,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.r),
                              bottomLeft: Radius.circular(10.r))),
                      child: Text(
                        "${disc}%",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  )
                : Container(),
            save
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        // ignore: avoid_print
                        print("Like");
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        margin: EdgeInsets.only(right: 15.w, bottom: 80.h),
                        height: 30.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                          color: skin4,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.r),
                          ),
                        ),
                        child: Image.asset("assets/icons/savefill.png"),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class ScreenArguments {
  final int? id;
  final List<CategoryModel>? data;

  ScreenArguments(this.id, this.data);
}
