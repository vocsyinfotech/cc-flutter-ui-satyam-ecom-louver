import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';
import 'package:thelouvre/model/constdata/buttn.dart';
import 'package:thelouvre/model/constdata/constant.dart';
import 'package:thelouvre/model/constdata/text.dart';
import 'package:thelouvre/screens/auth/authentication/authenticationprovider.dart';

import '../../model/constdata/textfield.dart';

// ignore: use_key_in_widget_constructors
class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      // ignore: avoid_print
      print('Form is valid');
    } else {
      // ignore: avoid_print
      print('Form is invalid');
    }
  }

  // ignore: prefer_typing_uninitialized_variables
  var emailerror;

  // ignore: prefer_typing_uninitialized_variables
  var passworderror;
  bool _login = false;
  bool rememberMe = false;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black1,
      appBar: AppBar(
        title: Text(
          "REGISTER",
          style: TextStyle(fontSize: 14.sp, fontFamily: "AvenirBook"),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: black1,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
            color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Styles.semiBold(
                      _login ? "Let’s sign you in" : "Create your account",
                      fs: 25.sp,
                      ls: 0.0,
                      ff: 'AvenirHeavy')),
              Padding(
                padding: EdgeInsets.all(8.0.h.w),
                child: Center(
                  child: Styles.regular(
                    _login
                        ? "Welcome back, you’ve been missed!"
                        : "After your registration is complete,\n you can see our opportunity products",
                    al: TextAlign.center,
                    fs: 14.sp,
                    ls: 0.4,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0.w, right: 30.w, top: 15.h),
                child: Form(
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _login
                                ? Container()
                                : Textfld(
                                    controller: username,
                                    hintte: "UserName",
                                    keyboardType: TextInputType.emailAddress,
                                    error: "Enter Email",
                                  ),
                            // Textfld(
                            //   controller: email,
                            //   hintte: _login ? "Username or email" : "Email",
                            //   keyboardType: TextInputType.name,
                            //   error: "Enter UserName",
                            // ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 375.w / 18.75),
                              child: TextFormField(
                                controller: email,
                                validator: (value) =>
                                    value!.isEmpty ? "Enter Email" : null,
                                keyboardType: TextInputType.name,
                                cursorColor: skin1,
                                decoration: InputDecoration(
                                  labelText:
                                      _login ? "Username or email" : "Email",
                                  labelStyle:
                                      TextStyle(color: black1, fontSize: 16.sp),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: skin1),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: _login
                                  ? EdgeInsets.only(bottom: 00.0.h)
                                  : EdgeInsets.only(bottom: 20.0.h),
                              child: TextFormField(
                                controller: password,
                                obscureText: _isObscure,
                                obscuringCharacter: '~',
                                cursorColor: skin1,
                                validator: (value) =>
                                    value!.isEmpty ? "Enter Password" : null,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: skin1,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      }),
                                  labelText: "Password",
                                  labelStyle:
                                      TextStyle(color: black1, fontSize: 16.sp),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: skin1),
                                  ),
                                ),
                              ),
                            ),
                            _login
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                          side: const BorderSide(color: skin1),
                                          activeColor: skin1,
                                          value: rememberMe,
                                          onChanged: (value) {
                                            setState(() {
                                              rememberMe = value!;
                                            });
                                          }),
                                      Styles.regular("Remember me", fs: 15.sp),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed('/forgotten');
                                        },
                                        child: Styles.regular(
                                            "Forgotten password?",
                                            fs: 15.sp),
                                      ),
                                    ],
                                  )
                                : Container(),
                            _login
                                ? Container()
                                : Textfld(
                                    controller: phone,
                                    hintte: "Phone",
                                    keyboardType: TextInputType.number,
                                    error: "Enter Phone number"),
                          ],
                        ),
                      ),
                      sizevertical(height: 20.h),
                      Flatbtn(
                        () {
                          if (_login) {
                            //Provider sign in method
                            context.read<AuthenticationProvider>().signIn(
                                  email: email.text,
                                  password: password.text,
                                );
                            // Get.toNamed("/bottomnavigation");
                          } else {
                            //Provider sign up method
                            context.read<AuthenticationProvider>().signUp(
                                  email: email.text,
                                  password: password.text,
                                );
                          }
                          validateAndSave();
                        },
                        _login ? "SIGN IN" : "SIGN UP",
                        skin2,
                      ),
                      _login
                          ? sizevertical(height: 100.h)
                          : sizevertical(height: 00.h),
                      sizevertical(height: 40.h),
                      Container(
                        decoration: BoxDecoration(
                          // color: red3,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            width: 1,
                            color: red2,
                          ),
                        ),
                        height: 55.h,
                        width: 240.w,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: Row(
                              children: [
                                const Image(
                                  image: AssetImage("assets/icons/google.png"),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Styles.semiBold(
                                  "Continue with Google",
                                  fs: 15.sp,
                                  c: red2,
                                  ff: "AvenirMedium",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      sizevertical(height: 10.h),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(
                            width: 1.w,
                            color: Colors.blueAccent,
                          ),
                        ),
                        height: 55.h,
                        width: 240.w,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: Row(
                              children: [
                                const Image(
                                  image:
                                      AssetImage("assets/icons/facebook.png"),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Styles.semiBold(
                                  "Continue with FaceBook",
                                  fs: 15.sp,
                                  c: Colors.blueAccent,
                                  // ls: 3.0,
                                  ff: "AvenirMedium",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      sizevertical(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Styles.regular("Already have an account?", fs: 15.sp),
                          InkWell(
                            child: Styles.bold(_login ? "Sign UP" : "Sign In",
                                fs: 14.w),
                            onTap: () {
                              setState(() {
                                _login = !_login;
                              });
                            },
                          )
                        ],
                      ),
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
}
