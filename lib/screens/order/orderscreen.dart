// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:thelouvre/dummy_data.dart';
import 'package:thelouvre/model/categorymodel.dart';
import 'package:thelouvre/model/constdata/buttn.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';
import 'package:thelouvre/screens/orderplaced/orderplaced.dart';

// ignore: use_key_in_widget_constructors
class order extends StatefulWidget {
  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  List<CategoryModel> third = Anatolian;
  // ignore: prefer_typing_uninitialized_variables
  var _character;
  @override
  void setState(VoidCallback fn) {
    // ignore: avoid_print
    print(_character);
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      appBar: AppBar(
        backgroundColor: black1,
        centerTitle: true,
        title: const Text("ORDER"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 25.w, right: 20.w, top: 25.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Styles.regular("Shipping to",
                      c: gray1, fs: 14.sp, ff: "AvenirBook"),
                  Styles.regular("Change",
                      c: skin1, fs: 14.sp, ff: "AvenirBook"),
                ],
              ),
              sizevertical(height: 10.h),
              Styles.regular("Dereboyu Cad. No.23,",
                  c: gray1, fs: 14.sp, ff: "AvenirBook", al: TextAlign.left),
              Styles.regular("34410 - Istanbul/Türkiye",
                  c: gray1, fs: 14.sp, ff: "AvenirBook", al: TextAlign.left),
              sizevertical(height: 10.h),
              const Divider(),
              sizevertical(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Styles.regular("Shipping to",
                      c: gray1, fs: 14.sp, ff: "AvenirBook"),
                  Styles.regular("Change",
                      c: skin1, fs: 14.sp, ff: "AvenirBook"),
                ],
              ),
              sizevertical(height: 10.h),
              Styles.regular("XXXX - XXXX - XXXX - 9123",
                  c: gray1, fs: 14.sp, ff: "AvenirBook", al: TextAlign.left),
              sizevertical(height: 10.h),
              const Divider(),
              sizevertical(height: 10.h),
              Styles.regular("ORDER DETAILS",
                  c: gray1, fs: 14.sp, ff: "AvenirBook", al: TextAlign.left),
              ListView.builder(
                shrinkWrap: true,
                // ignore: avoid_unnecessary_containers
                itemBuilder: (context, i) => Container(
                  child: Row(
                    children: [
                      Image.asset(
                        third[i].imgUrl,
                        height: 100.h,
                      ),
                      Column(
                        children: [
                          Styles.regular(third[i].title,
                              c: gray1,
                              fs: 14.sp,
                              ff: "AvenirBook",
                              al: TextAlign.left),
                          Styles.regular(third[i].price,
                              c: gray1,
                              fs: 20.sp,
                              ff: "AvenirBook",
                              al: TextAlign.left),
                        ],
                      )
                    ],
                  ),
                ),
                itemCount: 3,
              ),
              const Divider(),
              Styles.regular("SHIPPING METHOD",
                  c: gray3, fs: 14.sp, ff: "AvenirBook", al: TextAlign.left),
              ListTile(
                trailing: Styles.regular("FREE",
                    c: skin1, ff: "AvenirBook", fs: 14.sp),
                title: Text(
                  'Standard Shipping (16 days)',
                  style: TextStyle(fontSize: 14.sp, fontFamily: "AvenirBook"),
                ),
                leading: Radio(
                  activeColor: skin1,
                  value: 1,
                  groupValue: _character,
                  onChanged: (val) {
                    setState(
                      () {
                        _character = val;
                      },
                    );
                  },
                ),
              ),
              ListTile(
                trailing: Styles.regular("€40",
                    c: skin1, ff: "AvenirBook", fs: 14.sp),
                title: Text('Express (8 days)',
                    style:
                        TextStyle(fontSize: 14.sp, fontFamily: "AvenirBook")),
                leading: Radio(
                  activeColor: skin1,
                  value: 2,
                  groupValue: _character,
                  onChanged: (val) {
                    setState(
                      () {
                        _character = val;
                      },
                    );
                  },
                ),
              ),
              ListTile(
                trailing: Styles.regular("€80",
                    c: skin1, ff: "AvenirBook", fs: 14.sp),
                title: Styles.regular("Premium (1 day)",
                    ff: "AvenirBook", fs: 14.sp),
                leading: Radio(
                  activeColor: skin1,
                  value: 3,
                  groupValue: _character,
                  onChanged: (val) {
                    setState(
                      () {
                        _character = val;
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(15.h.w),
                decoration: BoxDecoration(
                  color: black1,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.r),
                    topLeft: Radius.circular(25.r),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Styles.regular("Subtotal",
                            c: white, ff: "AvenirBook", fs: 14.sp),
                        Styles.regular("€13.650",
                            c: white, ff: "AvenirBook", fs: 14.sp),
                      ],
                    ),
                    sizevertical(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Styles.regular("Shipping",
                            c: white, ff: "AvenirBook", fs: 14.sp),
                        Styles.regular("\$40.00",
                            c: white, ff: "AvenirBook", fs: 14.sp),
                      ],
                    ),
                    sizevertical(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Styles.regular("Total to Pay",
                            c: white, ff: "AvenirBook", fs: 20.sp),
                        Styles.regular("€13.690",
                            c: white, ff: "AvenirBook", fs: 20.sp),
                      ],
                    ),
                    sizevertical(height: 10.h),
                    Flatbtn(() {
                      Get.to(
                        OrderPlaced(),
                      );
                    }, "Place Order ", skin1),
                    sizevertical(height: 10.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
