import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:thelouvre/model/constdata/buttn.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/screens/order/orderscreen.dart';

// ignore: use_key_in_widget_constructors
class Payment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PaymentState();
  }
}

class PaymentState extends State<Payment> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.w,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      appBar: AppBar(
        backgroundColor: black1,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "PAYMENT DETAIL",
          style: TextStyle(fontSize: 13.sp, fontFamily: "AvenirBook"),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 375.h / 46.88, right: 375.h / 18.75),
            child: Badge(
              badgeColor: skin2,
              // ignore: prefer_const_constructors
              badgeContent: Text('3'),
              child: SvgPicture.asset("assets/icons/shoppingbagwhite.svg"),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.h,
              ),
              CreditCardWidget(
                cardType: CardType.mastercard,
                isChipVisible: true,
                //glassmorphismConfig: Glassmorphism.defaultConfig(),
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                cardBgColor: gray4,
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Column(
                    children: <Widget>[
                      CreditCardForm(
                        formKey: formKey,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumber: cardNumber,
                        cvvCode: cvvCode,
                        isHolderNameVisible: true,
                        isCardNumberVisible: true,
                        isExpiryDateVisible: true,
                        cardHolderName: cardHolderName,
                        expiryDate: expiryDate,
                        themeColor: skin2,
                        textColor: Colors.white,
                        cardNumberDecoration: InputDecoration(
                          focusColor: skin1,
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          hintStyle: TextStyle(color: black1, fontSize: 12.sp),
                          labelStyle: TextStyle(color: black1, fontSize: 16.sp),
                        ),
                        expiryDateDecoration: InputDecoration(
                          hintStyle: TextStyle(color: black1, fontSize: 12.sp),
                          labelStyle: TextStyle(color: black1, fontSize: 16.sp),
                          labelText: 'Expired Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: InputDecoration(
                          hintStyle: TextStyle(color: black1, fontSize: 12.sp),
                          labelStyle: TextStyle(color: black1, fontSize: 16.sp),
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: InputDecoration(
                          hintStyle: TextStyle(color: black1, fontSize: 12.sp),
                          labelStyle: TextStyle(color: black1, fontSize: 16.sp),
                          labelText: 'Card Holder',
                        ),
                        onCreditCardModelChange: onCreditCardModelChange,
                      ),
                      const Spacer(),
                      Flatbtn(() {
                        Get.to(order());
                      }, "Confirm Payment", skin1),
                      sizevertical(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
