import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';

// ignore: use_key_in_widget_constructors
class Voucher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Styles.regular("MY VOUCHER", fs: 13.sp, ff: "AvenirBook"),
      ),
      body: Container(
        padding: EdgeInsets.all(25.h.w),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r),
            topLeft: Radius.circular(25.r),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Styles.regular("ACTIVE VOUCHERS",
                  fs: 14.sp, ff: "AvenirBook", al: TextAlign.left),
              sizevertical(height: 15.0),
              Column(
                children: [
                  Ticket(
                    title: "Boutique Discount",
                    date: "Valid until February 2020",
                    discount: "20%",
                  ),
                  Ticket(
                    title: "Traditional Special",
                    date: "Valid until 14th February 2020",
                    discount: "14%",
                  ),
                  Ticket(
                    title: "Christmas Special",
                    date: "Valid until February 2020",
                    discount: "30%",
                  ),
                ],
              ),
              Styles.regular("USED VOUCHERS",
                  fs: 14.sp, ff: "AvenirBook", al: TextAlign.left),
              sizevertical(height: 15.h),
              Ticket(
                title: "2 for 1",
                date: "Used on 24th December 2019",
                discount: "20%",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Ticket extends StatelessWidget {
  String title;
  String date;
  String discount;
  // ignore: use_key_in_widget_constructors
  Ticket({required this.title, required this.date, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15..h),
      padding: EdgeInsets.all(15.h.w),
      height: 92.h,
      width: 315.w,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(8.r),
        image: const DecorationImage(
            image: AssetImage(
              "assets/images/Voucher.png",
            ),
            fit: BoxFit.fill),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Styles.semiBold(title,
                  ff: "AvenirHeavy", fs: 20.sp, al: TextAlign.left),
              Styles.bold(date,
                  ff: "AvenirBook", fs: 14.sp, al: TextAlign.left),
            ],
          ),
          Styles.semiBold(discount, ff: "AvenirHeavy", fs: 30.sp, c: skin1),
        ],
      ),
    );
  }
}
