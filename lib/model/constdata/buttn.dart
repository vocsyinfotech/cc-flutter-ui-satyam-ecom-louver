import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';

// ignore: must_be_immutable
class Flatbtn extends StatelessWidget {
  Function() onpress;
  String? text;
  Color color = skin1;
  // ignore: use_key_in_widget_constructors
  Flatbtn(this.onpress, this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shadowColor: Colors.transparent,
      borderRadius: BorderRadius.circular(25.h),
      child: InkWell(
        onTap: onpress,
        borderRadius: BorderRadius.circular(25.h),
        splashColor: skin1,
        child: Container(
          height: 44.h,
          width: 240.w,
          // padding: EdgeInsets.all(width / 18.75),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(22.w)),
          child: Center(
            child: Styles.regular(
              text!,
              c: Colors.white,
              fs: 15.sp,
              ls: 3,
              ff: "AvenirMedium",
            ),
          ),
        ),
      ),
    );
  }
}
