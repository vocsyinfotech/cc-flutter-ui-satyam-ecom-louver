import 'package:flutter/material.dart';
import 'package:thelouvre/model/constdata/buttn.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class OtpSend extends StatelessWidget {
  Function()? ontap;
  String? image;
  String? text;
  String? description;
  String? btnText;
  // ignore: use_key_in_widget_constructors
  OtpSend(this.ontap, this.image, this.text, this.description, this.btnText);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(width / 3.75),
                  child: Container(
                    height: 160.0,
                    width: 160.0,
                    color: skin4,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: 130.0,
                    width: 130.0,
                    color: skin3,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    color: skin1,
                    child: const Image(
                      image: AssetImage(
                        "assets/icons/otpsend.png",
                      ),
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
              ],
            ),
          ),
          sizevertical(height: 15.0),
          Styles.bold(text!, fs: 25, al: TextAlign.center),
          sizevertical(height: 15.0),
          Styles.regular(description!, fs: 15, al: TextAlign.center),
          sizevertical(height: 100.0),
          Flatbtn(ontap!, btnText, skin2)
        ],
      ),
    );
  }
}
