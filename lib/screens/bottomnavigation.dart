// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';
import 'package:thelouvre/screens/Category/category.dart';
import 'package:thelouvre/screens/Search/search.dart';
import 'package:thelouvre/screens/filter/filter.dart';
import 'package:thelouvre/screens/settings/settings.dart';

import 'HomePage/mainscreen.dart';
import 'favourite/favourite.dart';

List<String> allNames = ["ahmed", "ali", "john", "user"];

class BottomNavigator extends StatefulWidget {
  BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  String? _sortValue;
  String _ascValue = "ASC";
  var _selectedIndex = 0;

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  final List<Widget> _items = [
    MainScreen(),
    Category(),
    Category(),
    Favourite(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Styles.semiBold(
          "STORE",
          ff: "AvenirBook",
          fs: 375.w / 25,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(Search(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(seconds: 2));
              // showSearch(
              //   context: context,
              //   delegate: CustomSearchDelegate(),
              // );
            },
            icon: const Icon(Icons.search_rounded),
            color: white,
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                Get.to(Filter(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(seconds: 2));
              },
            ),
          )
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: _items),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        currentIndex:
            _selectedIndex, // this will be set when a new tab is tapped
        items: List.generate(
          5,
          (index) => BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/${index + 1}.svg",
                width: 375.w / 23.44,
                height: 375.w / 18.75,
              ),
              activeIcon: SvgPicture.asset(
                "assets/icons/${index + 1}.svg",
                width: 375.w / 23.44,
                height: 375.w / 18.75,
                color: const Color(0xffCC9D76),
              ),
              label: ''),
        ),
      ),
    );
  }

  Future<void> showFilterDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext build) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: const Center(
                  child: Text(
                "Filter",
                style: TextStyle(color: black1),
              )),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 12.h, right: 10.w),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 16.w),
                            child: Icon(
                              Icons.sort,
                              size: 16.w.h,
                              // ignore: prefer_const_constructors
                              color: Color(0xff808080),
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                hint: const Text("Sort by"),
                                items: <String>[
                                  "Name",
                                  "Age",
                                  "Date",
                                ].map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value,
                                        style: TextStyle(
                                            color: black1, fontSize: 16.sp)),
                                  );
                                }).toList(),
                                value: _sortValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    _sortValue = newValue!;
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8.h, right: 10.w),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 16.w),
                            child: const Icon(
                              Icons.sort_by_alpha,
                              color: Color(0xff808080),
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                items: <String>[
                                  "ASC",
                                  "DESC",
                                ].map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value,
                                        style: TextStyle(
                                            color: black1, fontSize: 16.sp)),
                                  );
                                }).toList(),
                                value: _ascValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    _ascValue = newValue!;
                                  });
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }
}

class CustomSearchDelegate extends SearchDelegate {
  var suggestion = ["ahmed", "ali", "mohammad"];
  List<String>? searchResult;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchResult!.clear();
    searchResult =
        allNames.where((element) => element.startsWith(query)).toList();
    return Container(
      margin: EdgeInsets.all(20.h.w),
      child: ListView(
          padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
          scrollDirection: Axis.vertical,
          children: List.generate(suggestion.length, (index) {
            var item = suggestion[index];
            return Card(
              color: Colors.white,
              child:
                  Container(padding: EdgeInsets.all(16.h.w), child: Text(item)),
            );
          })),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? suggestion
        : allNames.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          if (query.isEmpty) {
            query = suggestion[index];
          }
        },
        leading: Icon(query.isEmpty ? Icons.history : Icons.search),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    const TextStyle(color: black1, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: const TextStyle(color: skin1),
              )
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
