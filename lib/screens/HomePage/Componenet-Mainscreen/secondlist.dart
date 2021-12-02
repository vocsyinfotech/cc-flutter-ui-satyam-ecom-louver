import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';

// ignore: must_be_immutable
class Secondlist extends StatelessWidget {
  String? title;
  String? price;
  String? imageUrl;
  // ignore: use_key_in_widget_constructors
  Secondlist(this.title, this.price, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 375.h / 37.5),
      child: SizedBox(
        height: 375.h / 1.25,
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Container(
                  padding:
                      EdgeInsets.only(top: 375.h / 12.5, left: 375.h / 18.75),
                  height: 375.h / 2.34,
                  width: 375.h / 1.19,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF99581D),
                        Color(0xFF272833),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Styles.regular(title!, fs: 375.h / 15, c: white),
                      sizevertical(height: 375.h / 18.75),
                      Styles.regular(price!, fs: 375.h / 12.5, c: white),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 375.h / 2.67),
                child: Image.asset(
                  imageUrl!,
                  height: 220.h,
                  width: 220.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
