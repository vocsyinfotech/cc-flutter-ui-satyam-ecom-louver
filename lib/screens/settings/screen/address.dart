// ignore: duplicate_ignore
// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:thelouvre/model/constdata/buttn.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';
import 'package:thelouvre/screens/shippingscreen/shipping.dart';

// ignore: duplicate_ignore, duplicate_ignore
class Address extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  Address() : super();

  @override
  AddressState createState() => AddressState();
}

class AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Styles.regular("ORDER HISTORY", fs: 13.sp, ff: "AvenirBook"),
      ),
      body: Container(
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
            SingleChildScrollView(
              child: Column(
                children: [
                  History(
                    id: "HOME ADDRESS",
                    add: "Dereboyu Cad. 23, \n 34410 - Istanbul/Türkiye",
                  ),
                  History(
                    id: "WORK ADDRESS",
                    add: "Dereboyu Cad. 23, \n 34410 - Istanbul/Türkiye",
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: Flatbtn(() {
                Get.to(Shipping());
              }, "ADD ADDRESS", skin1),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class History extends StatelessWidget {
  String id;
  String add;

  History({required this.id, required this.add});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40.h, left: 40.w, right: 40.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Styles.regular(
                id,
                ff: "AvenirBook",
                fs: 14.sp,
              ),
              Styles.regular(
                "Change",
                ff: "AvenirBook",
                fs: 14.sp,
                c: skin1,
              ),
            ],
          ),
          sizevertical(height: 22.h),
          Styles.semiBold(
            add,
            ff: "AvenirBook",
            fs: 14.sp,
            c: black1,
            al: TextAlign.left,
          ),
          sizevertical(height: 9.h),
          const Divider(),
        ],
      ),
    );
  }
}
