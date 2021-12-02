import 'package:badges/badges.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:thelouvre/model/constdata/buttn.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';
import 'package:thelouvre/model/constdata/textfield.dart';
import 'package:thelouvre/screens/payment/payment.dart';

// ignore: use_key_in_widget_constructors
class Shipping extends StatefulWidget {
  @override
  State<Shipping> createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailaddress = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController addone = TextEditingController();
  TextEditingController addtwo = TextEditingController();
  TextEditingController zip = TextEditingController();
  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      // ignore: avoid_print
      print('Form is valid');
    } else {
      // ignore: avoid_print
      print('Form is invalid');
    }
  }

  String? countryValue;

  String? stateValue;

  String? cityValue;

  bool _default = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
        title: Styles.regular(
          "SHOPPING",
          fs: 13,
          ff: "AvenirBook",
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 375.h / 46.88, right: 375.h / 18.75),
            child: Badge(
              badgeColor: skin2,
              // ignore: prefer_const_constructors
              badgeContent: Text('3'),
              child: SvgPicture.asset("assets/icons/shoppingbagwhite.svg"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizevertical(height: 20.h),
            Styles.regular("Fill in the form below so we can know exactly",
                fs: 14.sp, c: gray3),
            Styles.regular("where to ship your order.", c: gray3, fs: 14.sp),
            sizevertical(height: 20.h),
            Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.r),
                  topLeft: Radius.circular(25.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(30.h.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Textfld(
                          controller: emailaddress,
                          hintte: "Email",
                          keyboardType: TextInputType.emailAddress,
                          error: "Please Enter Email"),
                      Textfld(
                          controller: phone,
                          hintte: "Phone Number",
                          keyboardType: TextInputType.number,
                          error: "Please Enter Mobile Number"),
                      Textfld(
                          controller: addone,
                          hintte: "Address Line 1",
                          keyboardType: TextInputType.text,
                          error: "Enter Address"),
                      Textfld(
                          controller: addtwo,
                          hintte: "Address Line 2",
                          keyboardType: TextInputType.streetAddress,
                          error: "Enter Address"),
                      SelectState(
                        dropdownColor: skin3,
                        style: TextStyle(
                            fontFamily: "AvenirBook",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                        // style: TextStyle(color: Colors.red),
                        onCountryChanged: (value) {
                          setState(() {
                            countryValue = value;
                          });
                        },
                        onStateChanged: (value) {
                          setState(() {
                            stateValue = value;
                          });
                        },
                        onCityChanged: (value) {
                          setState(() {
                            cityValue = value;
                          });
                        },
                      ),
                      Textfld(
                          controller: zip,
                          hintte: "Zip Code",
                          keyboardType: TextInputType.text,
                          error: "Enter Zip Code"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Set Default Address"),
                          CupertinoSwitch(
                              activeColor: skin1,
                              value: _default,
                              onChanged: (val) {
                                setState(() {
                                  _default = val;
                                  // ignore: avoid_print
                                  print(val);
                                });
                              }),
                        ],
                      ),
                      sizevertical(height: 25.h),
                      Flatbtn(() {
                        Get.to(Payment());
                      }, "Next Step", skin1)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
