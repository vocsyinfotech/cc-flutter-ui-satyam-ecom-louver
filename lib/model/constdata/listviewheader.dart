import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';

// ignore: must_be_immutable
class ListViewheader extends StatelessWidget {
  String? title;
  Function()? ontap;

  // ignore: use_key_in_widget_constructors
  ListViewheader(this.title, this.ontap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 375.w / 37.5, right: 375.w / 37.5),
      child: Row(
        children: [
          Styles.semiBold(title!, fs: 20.sp, ff: "AvenirHeavy"),
          const Spacer(),
          InkWell(
              onTap: ontap,
              child: Styles.semiBold("See all",
                  fs: 15.sp, c: skin1, ff: "AvenirBook")),
          const Icon(
            Icons.double_arrow_sharp,
            color: skin1,
          )
        ],
      ),
    );
  }
}
