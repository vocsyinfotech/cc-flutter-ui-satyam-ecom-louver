import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thelouvre/model/categorymodel.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';
import 'package:thelouvre/screens/HomePage/Componenet-Mainscreen/listviewitem.dart';

import '../../dummy_data.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class Favourite extends StatelessWidget {
  List<CategoryModel> first = OttomanCollection;
  List<CategoryModel> second = ZevkiSelim;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: black1,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: black1,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15.h, bottom: 20.h),
              child: Styles.regular(
                "Seems like you don’t have any items \n in your favorite list.",
                fs: 14.sp,
                c: gray2,
                al: TextAlign.center,
              ),
            ),
            Expanded(
              child: Container(
                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40.h, bottom: 30.h),
                      child: Styles.regular("Products you might like",
                          ff: "AvenirHeavy",
                          fs: 20.sp,
                          c: black1,
                          al: TextAlign.center),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: first.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 221.h,
                        crossAxisCount: 2,
                        crossAxisSpacing: 6.5.h,
                        mainAxisSpacing: 6.5.h,
                      ),
                      itemBuilder: (BuildContext context, int i) {
                        return ListViewfirst(
                          data: first,
                          title: first[i].title,
                          disc: first[i].discount,
                          save: true,
                          discount: true,
                          imageUrl: first[i].imgUrl,
                          price: first[i].price,
                          id: first[i].id,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> reportList = ["BCA", "MCA", "Other", "Experience", "Fresher"];

  String? selectedReportList;

  _showReportDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Select Any One"),
            content: MultiSelectChip(
              reportList,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedReportList = selectedList;
                });
              },
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Select"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                MultiSelectChip(
                  reportList,
                  onSelectionChanged: (selectedList) {
                    setState(() {
                      selectedReportList = selectedList;
                    });
                  },
                ),
                Text(selectedReportList.toString())
              ]),
        ));
  }
}

class MultiSelectChip extends StatefulWidget {
  MultiSelectChip(this.reportList, {required this.onSelectionChanged});
  final List<String> reportList;
  final Function(String) onSelectionChanged;

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  String selectedChoice = "";

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;

              widget.onSelectionChanged(selectedChoice);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
