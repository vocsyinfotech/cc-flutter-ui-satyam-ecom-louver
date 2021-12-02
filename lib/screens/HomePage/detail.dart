// ignore: duplicate_ignore
// ignore_for_file: unused_local_variable, use_key_in_widget_constructors, duplicate_ignore
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:thelouvre/controller/databasecontroller.dart';
import 'package:thelouvre/dummy_data.dart';
import 'package:thelouvre/model/categorymodel.dart';
import 'package:thelouvre/model/constdata/buttn.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';
import 'package:thelouvre/screens/shippingscreen/shipping.dart';

import 'Componenet-Mainscreen/listviewitem.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class ProductDetail extends StatefulWidget {
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  var index = 0;
  // ignore: prefer_typing_uninitialized_variables
  var rating;
  double? height;
  late DataBaseController dataBaseController = DataBaseController.instance;
  List ids = [];
  // ignore: prefer_typing_uninitialized_variables
  var id;
  late ScreenArguments arg;
  getarg() {
    arg = Get.arguments;
  }

  @override
  void initState() {
    getarg();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    id = arg.data!.where((element) => element.id == arg.id);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: black1,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: black1,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 375.h / 46.88, right: 375.h / 18.75),
            child: Badge(
              badgeColor: skin2,
              // ignore: prefer_const_constructors
              badgeContent: Text('3'),
              child: SvgPicture.asset("assets/icons/shoppingbag.svg"),
            ),
          )
        ],
        title: Styles.regular(
          "Product details",
          ff: "AvenirBook",
          c: black1,
          fs: 375.h / 22.06,
        ),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(375.h / 50.75),
              height: 375.h / 1.28,
              child: Image.asset(
                id.first.imgUrl,
                // fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(375.h / 12.5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.71),
                            color: white),
                        child: DefaultTabController(
                          length: 3,
                          initialIndex: 0,
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              sizevertical(height: 375.h / 12.5),
                              Styles.semiBold(
                                id.first.title,
                                fs: 375.h / 12.5,
                                al: TextAlign.center,
                              ),
                              sizevertical(height: 375.h / 12.5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RatingBar.builder(
                                    itemSize: 15,
                                    initialRating: 1,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    // itemPadding:
                                    //     const EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: skin1,
                                      size: 5,
                                    ),
                                    onRatingUpdate: (rating) {
                                      setState(() {
                                        rating = rating;
                                      });
                                    },
                                  ),
                                  Styles.regular("  $rating  Reviews",
                                      c: black1, ff: "AvenirBook", fs: 12.sp),
                                ],
                              ),
                              sizevertical(height: 375.h / 12.5),
                              Styles.regular(
                                id.first.description.length < 10
                                    ? id.first.description.substring(0, 150) +
                                        "."
                                    : id.first.description,
                                fs: 375.h / 25,
                                c: gray1,
                                al: TextAlign.center,
                              ),
                              sizevertical(height: 375.h / 12.5),
                              Styles.semiBold(
                                id.first.price,
                                fs: 375.h / 12.5,
                                al: TextAlign.center,
                                c: skin1,
                              ),
                              sizevertical(height: 375.h / 12.5),
                              TabBar(
                                onTap: (tab) {
                                  setState(() {
                                    index = tab;
                                  });
                                },
                                tabs: const [
                                  Text(
                                    'Description',
                                    style: TextStyle(color: black1),
                                  ),
                                  Text(
                                    'Specifications',
                                    style: TextStyle(color: black1),
                                  ),
                                  Text(
                                    'Reviews',
                                    style: TextStyle(color: black1),
                                  ),
                                ],
                                unselectedLabelStyle:
                                    TextStyle(fontSize: 15.sp),
                                labelPadding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 10.h),
                                indicatorColor: skin1,
                                isScrollable: true,
                                indicatorSize: TabBarIndicatorSize.label,
                              ),
                              IndexedStack(
                                sizing: StackFit.loose,
                                index: index,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 100.h),
                                    height: 300.h,
                                    margin: EdgeInsets.only(top: 30.h),
                                    width: MediaQuery.of(context).size.width,
                                    child: Styles.regular(
                                      id.first.description,
                                      al: TextAlign.center,
                                      fs: 14,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      specification(
                                        left: "Case diameter",
                                        right: "Diameter: 20 cm Length: 40 cm",
                                      ),
                                      specification(
                                        left: "Product Origin ",
                                        right: "Turkey",
                                      ),
                                      specification(
                                        left: "Production method",
                                        right: "100% handmade.",
                                      ),
                                      specification(
                                        left: "Material",
                                        right: "Gold and Glass crafting",
                                      ),
                                      specification(
                                        left: "Strap color",
                                        right: "Gold Color",
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 275.h,
                                        child: ListView(
                                          children: [
                                            Review(
                                              name: "Victor Flexin",
                                              opinion:
                                                  "The dial on this timepiece is extremely unique, as it is a concentric circular pattern that is covered by sturdy sapphire glass.",
                                            ),
                                            Review(
                                              name: "Mike Flexin",
                                              opinion:
                                                  "The dial on this timepiece is extremely unique, as it is a concentric circular pattern that is covered by sturdy sapphire glass.",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Styles.semiBold("Similar products",
                                  ff: "AvenirHeavy", fs: 24.sp),
                              sizevertical(height: 15.h),
                              SizedBox(
                                height: 250.h,
                                child: lists(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              addRepaintBoundaries: true,
            ),
          ),
        ],
      ),
      bottomNavigationBar: FutureBuilder<List<MovieData>>(
          future: dataBaseController.retrieveTodos(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (ids.isEmpty) {
                for (var i = 0; i < snapshot.data!.length; i++) {
                  ids.add(snapshot.data![i].productid);
                }
                // ignore: avoid_print, unnecessary_brace_in_string_interps
                print('ID == ${ids}');
              }
            }
            return Container(
              color: white,
              height: 375.h / 4.93,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      // ignore: avoid_print
                      print(id.first.id);
                      ids.toString().contains(id.first.id)
                          ? dataBaseController.deleteTodo(id: id.first.id)
                          : dataBaseController.insertTodo(MovieData(
                              id: id.first.id,
                              title: id.first.title,
                              price: id.first.price,
                              description: id.first.description,
                              image: id.first.imgUrl,
                              productid: id.first.id));
                      setState(() {});
                    },
                    child: Container(
                      height: 44.h,
                      width: 44.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: gray4),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 17.w, vertical: 15.h),
                        child: SvgPicture.asset(
                          "assets/icons/bookmarkfilled.svg",
                          width: 10.w,
                          height: 14.h,
                          color: ids.toString().contains(id)
                              ? Colors.red
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Flatbtn(() {
                    Get.to(Shipping());
                  }, "ADD TO CART", skin1),
                  InkWell(
                    splashColor: skin1,
                    onTap: () {},
                    child: Container(
                      height: 44.h,
                      width: 44.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: gray4),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 16.h),
                        child: SvgPicture.asset(
                          "assets/icons/sharedfill.svg",
                          width: 10.w,
                          height: 14.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class specification extends StatelessWidget {
  String left;
  String right;

  // ignore: use_key_in_widget_constructors
  specification({required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Styles.regular(left, fs: 14.sp),
              Styles.regular(right, fs: 14.sp)
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

// ignore: must_be_immutable
class Review extends StatelessWidget {
  String name;
  String opinion;

  // ignore: use_key_in_widget_constructors
  Review({required this.name, required this.opinion});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 28.h),
            child: Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 13.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r), color: gray4),
                  child: Image.asset("assets/icons/image.png"),
                ),
                SizedBox(
                  width: 18.w,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Styles.bold(name, ff: "Avenir", fs: 16.sp),
                    Icon(
                      Icons.star,
                      size: 14.w,
                      color: skin1,
                    ),
                  ],
                ),
                const Spacer(),
                Styles.regular("23 September 2019", ff: "Avenir", fs: 12.sp),
              ],
            ),
          ),
          Styles.regular(
            opinion,
            ff: "AvenirBook",
            fs: 14.sp,
            al: TextAlign.left,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 35.h,
              bottom: 30.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: gray4,
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 30.w),
                  height: 36.h,
                  width: 110.w,
                  child:
                      Styles.regular("Helpful?", fs: 14.sp, ff: "AvenirBook"),
                ),
                Styles.semiBold(
                  "Report",
                  fs: 14.sp,
                  ff: "AvenirBook",
                  c: skin1,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1.w,
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class lists extends StatefulWidget {
  @override
  State<lists> createState() => _listsState();
}

// ignore: camel_case_types
class _listsState extends State<lists> {
  List<CategoryModel> third = Anatolian;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: third.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return ListViewfirst(
            data: third,
            disc: third[i].discount,
            discount: false,
            id: third[i].id,
            save: false,
            imageUrl: third[i].imgUrl,
            title: third[i].title,
            price: third[i].price);
      },
    );
  }
}
