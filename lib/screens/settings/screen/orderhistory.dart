// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';

class Tracking extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  Tracking() : super();

  @override
  TrackingState createState() => TrackingState();
}

class TrackingState extends State<Tracking> {
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
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              History(
                id: "ORDER #21403",
                price: "\$99.00",
                date: "31st of December",
                status: "Canceled",
              ),
              History(
                id: "ORDER #21358",
                price: "\$599.00",
                date: "14th of November",
                status: "Delivered",
              ),
              History(
                id: "ORDER #21358",
                price: "\$599.00",
                date: "14th of November",
                status: "Delivered",
              ),
              History(
                id: "ORDER #21313",
                price: "\$599.00",
                date: "2nd ot December",
                status: "Delivered",
              ),
              History(
                id: "ORDER #21403",
                price: "\$99.00",
                date: "31st of December",
                status: "Canceled",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class History extends StatelessWidget {
  String id;
  String date;
  String price;
  String status;

  // ignore: use_key_in_widget_constructors
  History(
      {required this.id,
      required this.price,
      required this.date,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40.h, left: 40.w, right: 40.h),
      child: Column(
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
                "View Details",
                ff: "AvenirBook",
                fs: 14.sp,
                c: skin1,
              ),
            ],
          ),
          sizevertical(height: 22.h),
          Row(
            children: [
              Styles.semiBold(
                "Placed On:  ",
                ff: "AvenirBook",
                fs: 14.sp,
                c: black1,
              ),
              Styles.semiBold(
                date,
                ff: "AvenirBook",
                fs: 14.sp,
                c: black1,
              ),
            ],
          ),
          sizevertical(height: 9.h),
          Row(
            children: [
              Styles.semiBold(
                "Amount:      ",
                ff: "AvenirBook",
                fs: 14.sp,
              ),
              Styles.semiBold(
                price,
                ff: "AvenirBook",
                fs: 14.sp,
                c: black1,
              ),
            ],
          ),
          sizevertical(height: 9.h),
          Row(
            children: [
              Styles.semiBold(
                "Status:         ",
                ff: "AvenirBook",
                fs: 14.sp,
                c: black1,
              ),
              Styles.semiBold(
                status,
                ff: "AvenirBook",
                fs: 14,
                c: black1,
              ),
            ],
          ),
          sizevertical(height: 9.h),
          const Divider(),
        ],
      ),
    );
  }
}
