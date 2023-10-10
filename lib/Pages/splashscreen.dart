import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart' as ft;
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Api & Routes/api.dart';
import '../Api & Routes/routes.dart';
import '../Providers/homepro.dart';
import '../Providers/profilepro.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool navvalue = true;
  @override
  Widget build(BuildContext context) {
    RouteManager.width = MediaQuery.of(context).size.width;
    RouteManager.height = MediaQuery.of(context).size.height;
    print("Width : " + RouteManager.width.toString());
    print("Height: " + RouteManager.height.toString());
    return SafeArea(
      child: AnimatedSplashScreen.withScreenRouteFunction(
        screenRouteFunction: () async {
          while (true) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            if (prefs.getString('role') != null && prefs.getString('userid') != null) {
              Provider.of<ProfilePro>(context, listen: false).userid = int.parse(prefs.getString('userid').toString());
              Provider.of<ProfilePro>(context, listen: false).role = int.parse(prefs.getString('role').toString());
              while (true) {
                var val = await API.getUser(Provider.of<ProfilePro>(context, listen: false).userid!, context);
                if (val) {
                  break;
                }
              }
              return Future.value("/home");
            }
            navvalue = true;
            return Future.value("/signup1");
          }
        },
        disableNavigation: navvalue,
        splashTransition: SplashTransition.rotationTransition,
        splash: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            "images/bid.png",
          ),
        ),
        curve: Curves.easeInOutCubic,
        splashIconSize: 100,
        centered: true,
        animationDuration: const Duration(seconds: 2),
        backgroundColor: Colors.black,
      ),
    );
  }
}
