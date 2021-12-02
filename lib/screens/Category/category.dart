import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thelouvre/dummy_data.dart';
import 'package:thelouvre/model/categorymodel.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/listviewheader.dart';
import 'package:thelouvre/model/constdata/text.dart';
import 'package:thelouvre/screens/HomePage/Componenet-Mainscreen/listviewitem.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class Category extends StatelessWidget {
  List<CategoryModel> first = OttomanCollection;
  List<CategoryModel> second = ZevkiSelim;
  List<CategoryModel> third = Anatolian;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(375.h / 15),
                    topRight: Radius.circular(375.h / 15),
                  ),
                  color: Colors.white),
              child: Column(
                children: [
                  sizevertical(height: 375.h / 12.5),
                  Styles.semiBold("Ottoman Collection",
                      fs: 375.h / 15, ff: "AvenirHeavy"),
                  Styles.semiBold("Classic Collections",
                      fs: 375.h / 15, ff: "AvenirHeavy"),
                  Styles.semiBold("Search through more than 1000+ watches",
                      fs: 375.h / 25, ff: "AvenirBook"),
                  sizevertical(height: 375.h / 12.5),
                  ListViewheader("Limited Edition", () {}),
                  sizevertical(height: 375.h / 37.5),
                  SizedBox(
                    height: 375.h / 1.67,
                    child: ListView.builder(
                      itemCount: first.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => ListViewfirst(
                          discount: true,
                          save: true,
                          disc: first[i].discount,
                          data: first,
                          id: first[i].id,
                          imageUrl: first[i].imgUrl,
                          title: first[i].title,
                          price: first[i].price),
                    ),
                  ),
                  sizevertical(height: 375.h / 37.5),
                  ListViewheader("Anatolian Civilizations", () {}),
                  sizevertical(height: 375.h / 37.5),
                  SizedBox(
                    height: 375.h / 1.67,
                    child: ListView.builder(
                      itemCount: third.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => ListViewfirst(
                          discount: true,
                          save: true,
                          disc: third[i].discount,
                          data: third,
                          id: third[i].id,
                          imageUrl: third[i].imgUrl,
                          title: third[i].title,
                          price: third[i].price),
                    ),
                  ),
                  sizevertical(height: 375.h / 37.5),
                  ListViewheader("Zevk-i Selim Catalog", () {}),
                  sizevertical(height: 375.h / 37.5),
                  SizedBox(
                    height: 375.h / 1.67,
                    child: ListView.builder(
                      itemCount: first.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => ListViewfirst(
                          discount: true,
                          save: true,
                          disc: second[i].discount,
                          data: second,
                          id: second[i].id,
                          imageUrl: second[i].imgUrl,
                          title: second[i].title,
                          price: second[i].price),
                    ),
                  ),
                  sizevertical(height: 375.h / 37.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
