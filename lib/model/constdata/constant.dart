// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const teal1 = Color(0xFF3E7C8A);
const teal2 = Color(0xFF4E7A86);
const teal3 = Color(0xFF7197A2);
const teal4 = Color(0xFFB1CAD0);

const skin1 = Color(0xFFCC9D76);
const skin2 = Color(0xFFE2B895);
const skin3 = Color(0xFFEFD2BB);
const skin4 = Color(0xFFFCF2EA);

const red1 = Color(0xFFE50A19);
const red2 = Color(0xFFF4323F);
const red3 = Color(0xFFF75A65);
const red4 = Color(0xFFFFAAB0);

const gray1 = Color(0xFF676870);
const gray2 = Color(0xFF92939B);
const gray3 = Color(0xFFB6B7BC);
const gray4 = Color(0xFFD7D8DD);

const black1 = Color(0xFF000000);
const black2 = Color(0xFF292828);
const black3 = Color(0xFF434343);
const black4 = Color(0xFF969696);

const white = Colors.white;

sizevertical({height}) {
  return SizedBox(
    height: height,
  );
}

img(String url) {
  return Image.asset(
    url,
    height: 375.h,
    width: 375.w,
  );
}
