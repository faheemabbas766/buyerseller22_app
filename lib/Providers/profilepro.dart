import 'package:flutter/cupertino.dart';
import 'dart:io';

class ProfilePro with ChangeNotifier {
  int? userid;
  String? name;
  String? company;
  String? email;
  String? city;
  String? address;
  String? dp;
  int role = 1;
  String? phn;

  clearAll() {
    userid = null;
    name = null;
    company=null;
    email=null;
    city=null;
    address=null;
    dp = null;
    role = 1;
    phn=null;
  }

  notifyListenerz() {
    notifyListeners();
  }
}
