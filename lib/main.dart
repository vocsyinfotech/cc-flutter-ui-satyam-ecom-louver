import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:thelouvre/screens/Category/category.dart';
import 'package:thelouvre/screens/HomePage/detail.dart';
import 'package:thelouvre/screens/Search/search.dart';
import 'package:thelouvre/screens/auth/authentication/authenticate.dart';
import 'package:thelouvre/screens/auth/authentication/authenticationprovider.dart';
import 'package:thelouvre/screens/auth/otpverified.dart';
import 'package:thelouvre/screens/bottomnavigation.dart';
import 'package:thelouvre/screens/favourite/favourite.dart';
import 'package:thelouvre/screens/filter/filter.dart';
import 'package:thelouvre/screens/settings/settings.dart';

import 'model/constdata/constant.dart';
import 'screens/HomePage/mainscreen.dart';
import 'screens/auth/forgot.dart';
import 'screens/auth/register.dart';
import 'screens/auth/splashscreens.dart';

Future<void> main() async {
  // ignore: prefer_const_constructors
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiProvider(
      providers: [
        Provider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationProvider>().authState,
          initialData: null,
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch().copyWith(secondary: skin1)),

          // ignore: prefer_const_constructors
          initialRoute: "/bottomnavigation",
          getPages: [
            // ignore: prefer_const_constructors
            GetPage(name: "/authenticate", page: () => Authenticate()),
            GetPage(name: '/favourite', page: () => Favourite()),
            GetPage(name: '/settings', page: () => Settings()),
            // ignore: prefer_const_constructors
            GetPage(name: '/filter', page: () => Filter()),
            GetPage(name: '/category', page: () => Category()),
            GetPage(name: '/productdetail', page: () => ProductDetail()),
            // ignore: prefer_const_constructors
            GetPage(name: '/bottomnavigation', page: () => BottomNavigator()),
            GetPage(name: '/mainpage', page: () => MainScreen()),
            GetPage(name: '/splashscreen', page: () => SplashScreen()),
            // ignore: prefer_const_constructors
            GetPage(name: '/register', page: () => Register()),
            GetPage(name: '/forgotten', page: () => Forgotten()),
            GetPage(name: '/otpverified', page: () => OtpVerified()),
            GetPage(name: '/search', page: () => Search())
          ],
        ),
      ),
    );
  }
}
