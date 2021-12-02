import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thelouvre/model/constdata/constant.dart';

// ignore: must_be_immutable
class Textfld extends StatelessWidget {
  String hintte;
  String error;
  final TextInputType keyboardType;
  TextEditingController controller;

  // ignore: use_key_in_widget_constructors
  Textfld({
    required this.hintte,
    required this.keyboardType,
    required this.error,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 375.w / 18.75),
      child: TextFormField(
        controller: controller,
        validator: (value) => value!.isEmpty ? error : null,
        keyboardType: keyboardType,
        cursorColor: skin1,
        decoration: InputDecoration(
          labelText: hintte,
          labelStyle: TextStyle(color: black1, fontSize: 16.sp),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: skin1),
          ),
        ),
      ),
    );
  }
}
