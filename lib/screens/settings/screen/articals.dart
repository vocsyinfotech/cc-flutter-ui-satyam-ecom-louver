import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thelouvre/model/categorymodel.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';

import '../../../dummy_data.dart';

// ignore: use_key_in_widget_constructors
class Artical extends StatefulWidget {
  @override
  State createState() {
    return ArticalState();
  }
}

class ArticalState extends State<Artical> {
  List<CategoryModel> first = OttomanCollection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      appBar: AppBar(
        title: Styles.regular(
          "LATEST ARTICAL",
          ff: "AvenirBook",
          fs: 13.sp,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            )),
        child: ExpandableTheme(
          data: const ExpandableThemeData(
            hasIcon: false,
            animationDuration: Duration(seconds: 1),
            useInkWell: true,
          ),
          child: ListView.builder(
            itemCount: first.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              return Card1(
                title: first[i].title,
                image: first[i].imgUrl,
                description: first[i].description,
              );
            },
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Card1 extends StatelessWidget {
  String image;
  String description;
  String title;
  // ignore: use_key_in_widget_constructors
  Card1({required this.image, required this.title, required this.description});
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: EdgeInsets.all(10.h.w),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            Container(
              width: 315.w,
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                color: black1,
                shape: BoxShape.rectangle,
              ),
              child: Image.asset(
                image,
                height: 100.h,
                // fit: BoxFit.cover,
              ),
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: true,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Padding(
                  padding: EdgeInsets.all(10.h.w),
                  child: Styles.semiBold(title, ff: "AvenirHeavy", fs: 24.sp),
                ),
                collapsed: Text(
                  description,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Text(
                          description,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        )),
                  ],
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding:
                        EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                      theme: const ExpandableThemeData(crossFadePoint: 0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
