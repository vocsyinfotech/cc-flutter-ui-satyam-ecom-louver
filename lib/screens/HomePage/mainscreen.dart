import 'package:flutter/material.dart';
import 'package:thelouvre/dummy_data.dart';
import 'package:thelouvre/model/categorymodel.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/listviewheader.dart';
import 'package:thelouvre/model/constdata/text.dart';

import 'Componenet-Mainscreen/listviewitem.dart';
import 'Componenet-Mainscreen/secondlist.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class MainScreen extends StatelessWidget {
  List<CategoryModel> first = OttomanCollection;
  List<CategoryModel> second = ZevkiSelim;
  List<CategoryModel> third = Anatolian;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: black1,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(width / 15),
                    topRight: Radius.circular(width / 15),
                  ),
                  color: Colors.white),
              child: Column(
                children: [
                  sizevertical(height: width / 12.5),
                  Styles.semiBold("Ottoman Collection",
                      fs: width / 15, ff: "AvenirHeavy"),
                  Styles.bold("Find the perfect watch for your wrist",
                      fs: width / 25, ff: "AvenirBook"),
                  sizevertical(height: width / 12.5),
                  ListViewheader("Categories", () {}),
                  sizevertical(height: width / 37.5),
                  SizedBox(
                    height: width / 1.67,
                    child: ListView.builder(
                      itemCount: first.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => ListViewfirst(
                          discount: false,
                          save: false,
                          disc: first[i].discount,
                          data: first,
                          id: first[i].id,
                          imageUrl: first[i].imgUrl,
                          title: first[i].title,
                          price: first[i].price),
                    ),
                  ),
                  ListViewheader("Categories", () {}),
                  sizevertical(height: width / 37.5),
                  SizedBox(
                    height: width / 1.70,
                    child: Center(
                      child: ListView.builder(
                        itemCount: second.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Secondlist(second[i].title, second[i].price,
                              second[i].imgUrl);
                        },
                      ),
                    ),
                  ),
                  sizevertical(height: width / 37.5),
                  ListViewheader("Featured products", () {}),
                  sizevertical(height: width / 37.5),
                  SizedBox(
                    height: width / 1.67,
                    child: ListView.builder(
                      itemCount: third.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => ListViewfirst(
                          discount: false,
                          save: false,
                          disc: third[i].discount,
                          data: third,
                          id: third[i].id,
                          imageUrl: third[i].imgUrl,
                          title: third[i].title,
                          price: third[i].price),
                    ),
                  ),
                  sizevertical(height: width / 37.5),
                  SizedBox(
                    height: width / 1.67,
                    child: ListView.builder(
                      itemCount: first.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => ListViewfirst(
                          discount: false,
                          save: false,
                          disc: second[i].discount,
                          data: second,
                          id: second[i].id,
                          imageUrl: second[i].imgUrl,
                          title: second[i].title,
                          price: second[i].price),
                    ),
                  ),
                  sizevertical(height: width / 37.5),
                  ListViewheader("Search by brand", () {}),
                  sizevertical(height: width / 37.5),
                  SizedBox(
                    height: width / 1.67,
                    child: ListView.builder(
                      itemCount: first.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, i) => ListViewfirst(
                          discount: false,
                          save: false,
                          disc: first[i].discount,
                          data: first,
                          id: first[i].id,
                          imageUrl: first[i].imgUrl,
                          title: first[i].title,
                          price: first[i].price),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
