import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';

class Tracking extends StatefulWidget {
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  Tracking() : super();

  final String title = "Stepper Demo";

  @override
  TrackingState createState() => TrackingState();
}

class TrackingState extends State<Tracking> {
  //
  // ignore: non_constant_identifier_names
  int current_step = 0;
  List<Step> steps = [
    Step(
      title: Text(
        'Order Placed',
        style: TextStyle(fontSize: 20.sp, fontFamily: "AvenirHeavy"),
      ),
      subtitle: Text(
        "Your order #212423 was placed on 23th November 2019.",
        style: TextStyle(fontSize: 14.sp, fontFamily: "AvenirBook"),
      ),
      isActive: true,
      content: const Text(""),
    ),
    Step(
      title: Text(
        'Processing',
        style: TextStyle(fontSize: 20.sp, fontFamily: "AvenirHeavy"),
      ),
      subtitle: Text(
        "Your order still needs to be processed by our store before sending it to you.",
        style: TextStyle(fontSize: 14.sp, fontFamily: "AvenirBook"),
      ),
      content: const Text(''),
      isActive: true,
    ),
    Step(
      title: Text(
        'Picked up by the courier',
        style: TextStyle(fontSize: 20.sp, fontFamily: "AvenirHeavy"),
      ),
      subtitle: Text(
        "Your order has been picked up by one of our couriers and its on your way.",
        style: TextStyle(
          fontSize: 14.sp,
          fontFamily: "AvenirBook",
        ),
      ),
      content: const Text(''),
      isActive: true,
    ),
    Step(
      title: Text(
        'Delivering',
        style: TextStyle(fontSize: 20.sp, fontFamily: "AvenirHeavy"),
      ),
      subtitle: Text(
        "The package is on your way. Make sure to be at the location to meet the courier.",
        style: TextStyle(fontSize: 14.sp, fontFamily: "AvenirHeavy"),
      ),
      content: const Text(''),
      isActive: true,
    ),
    Step(
      title: Text(
        'Delivered',
        style: TextStyle(fontSize: 20.sp, fontFamily: "AvenirHeavy"),
      ),
      subtitle: Text(
        "It seems like the package has arrived to you. Hope you are happy with it!",
        style: TextStyle(fontSize: 14.sp, fontFamily: "AvenirBook"),
      ),
      content: const Text(''),
      state: StepState.complete,
      isActive: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: black1,
        centerTitle: true,
        title: Styles.regular("ORDER STATUS", fs: 13.sp, ff: "AvenirBook"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r),
            topLeft: Radius.circular(25.r),
          ),
        ),
        child: Stepper(
          currentStep: current_step,
          steps: steps,
          type: StepperType.vertical,
          onStepTapped: (step) {
            setState(() {
              current_step = step;
            });
          },
          onStepContinue: () {
            setState(() {
              if (current_step < steps.length - 1) {
                current_step = current_step + 1;
              } else {
                current_step = 0;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (current_step > 0) {
                current_step = current_step - 1;
              } else {
                current_step = 0;
              }
            });
          },
        ),
      ),
    );
  }
}
