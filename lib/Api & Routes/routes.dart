import 'package:buyerseller/Pages/profile.dart';
import 'package:buyerseller/Pages/search.dart';
import 'package:buyerseller/Pages/secondhome.dart';
import 'package:buyerseller/Pages/splashscreen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../Pages/home.dart';
import '../Pages/signup1.dart';
import '../Pages/signup2.dart';
import '../Pages/signup3.dart';

class RouteManager {
  static BuildContext? context;
  // static File? dp;
  static var width;
  static var height;
  // static String? deviceid;
  static const String rootpage = "/";
  static const String signup1 = "/signup1";
  static const String signup2 = "/signup2";
  static const String signup3 = "/signup3";
  static const String homepage = "/home";
  static const String searchpage = "/search";
  static const String profilepage = "/profile";
  // static const String secondhomepage = "/home2";
  // static const String signinpage = "/signin";
  // static const String homepage = "/homepage";
  // static const String jobviewpage = "/jobviewpage";
  // static const String startshiftpage = "/startshift";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case signinpage:
      //   return MaterialPageRoute(builder: (context) => SignIn());
      case rootpage:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case signup1:
        return MaterialPageRoute(builder: (context) => SignUp1());
      case signup2:
        return MaterialPageRoute(builder: (context) => SignUp2());
      case signup3:
        return MaterialPageRoute(builder: (context) => SignUp3());
      case homepage:
        return MaterialPageRoute(builder: (context) => Home());
      case profilepage:
        return MaterialPageRoute(builder: (context) => Profile());
      case searchpage:
        return MaterialPageRoute(builder: (context) => Search());
      // case secondhomepage:
      //   return MaterialPageRoute(builder: (context) => HomePage());
      // case homepage:
      //   return MaterialPageRoute(builder: (context) => Home());
      // case jobviewpage:
      //   return MaterialPageRoute(builder: (context) => JobView());
      // case startshiftpage:
      //   return MaterialPageRoute(builder: (context) => StartShift());
      default:
        throw const FormatException("Route no Found!");
    }
  }
}
