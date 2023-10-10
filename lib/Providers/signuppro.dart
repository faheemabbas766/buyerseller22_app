import 'package:flutter/cupertino.dart';
import 'dart:io';

class SignUpPro with ChangeNotifier {
  int? userid;
  String? otp;
  String? phn;
  bool obscure1=true;
  bool obscure2=true;
  bool signinobscure=true;
  bool registerselected=true;
  String? selectedcity;
  bool otpalreadyverified=false;
  File? dp;
  bool invalidotp=false;
  clearAll()
  {
    invalidotp=false;
    otpalreadyverified=false;
    obscure1=true;
    obscure2=true;
    signinobscure=true;
    registerselected=true;
    selectedcity=null;
    dp=null;
    userid=null;
    phn=null;
    otp=null;
  }

   notifyListenerz() {
    notifyListeners();
  }
}