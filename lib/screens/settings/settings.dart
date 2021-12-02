import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';
import 'package:thelouvre/screens/auth/authentication/authenticationprovider.dart';
import 'package:thelouvre/screens/payment/payment.dart';
import 'package:thelouvre/screens/settings/screen/address.dart';
import 'package:thelouvre/screens/settings/screen/articals.dart';
import 'package:thelouvre/screens/settings/screen/orderhistory.dart';
import 'package:thelouvre/screens/settings/screen/voucher.dart';

// ignore: use_key_in_widget_constructors
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      body: Container(
        padding: EdgeInsets.only(
          left: 22.w,
          right: 22.w,
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r),
            topLeft: Radius.circular(25.r),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25.h),
                height: 80.w,
                width: 80.w,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.asset(
                        "assets/images/cards.jpg",
                        fit: BoxFit.cover,
                        height: 80.w,
                        width: 80.w,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ClipRRect(
                        child: SvgPicture.asset("assets/images/profiles.svg"),
                      ),
                    ),
                  ],
                ),
              ),
              sizevertical(height: 20.h),
              Styles.regular(
                "Ugur Ates",
                ff: "AvenirHeavy",
                fs: 20.sp,
              ),
              Styles.regular("ugurates19@gmail.com",
                  ff: "AvenirBook", fs: 14.sp),
              sizevertical(height: 30.h),
              Settingitem(
                  title: "Order History",
                  ontap: () {
                    Get.to(Tracking());
                  }),
              Settingitem(
                  title: "My Addresses",
                  ontap: () {
                    Get.to(Address());
                  }),
              Settingitem(
                  title: "My Cards",
                  ontap: () {
                    Get.to(Payment());
                  }),
              Settingitem(
                  title: "Vouchers",
                  ontap: () {
                    Get.to(Voucher());
                  }),
              Settingitem(title: "Nearby Stores", ontap: () {}),
              Settingitem(
                  title: "Latest Articles",
                  ontap: () {
                    Get.to(Artical());
                  }),
              Settingitem(title: "Settings", ontap: () {}),
              Settingitem(
                  title: "Log Out",
                  ontap: () {
                    context.read<AuthenticationProvider>().signOut();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Settingitem extends StatelessWidget {
  Function() ontap;
  String title;
  // ignore: use_key_in_widget_constructors
  Settingitem({required this.title, required this.ontap});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Styles.bold(title, fs: 16.sp, ff: "AvenirBook"),
              Icon(
                Icons.arrow_forward_ios,
                size: 15.h.w,
              ),
            ],
          ),
        ),
        sizevertical(height: 15.h),
        Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
          child: const Divider(),
        ),
      ],
    );
  }
}
