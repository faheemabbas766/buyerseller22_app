import 'package:buyerseller/Providers/signuppro.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as ft;
import 'package:flutter/services.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:provider/provider.dart';
import '../Api & Routes/API.dart';
import '../Api & Routes/routes.dart';

class SignUp2 extends StatefulWidget {
  const SignUp2({super.key});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: RouteManager.width / 3.8,
                ),
                SizedBox(
                  width: RouteManager.width / 2,
                  height: RouteManager.width / 2,
                  child: Image.asset(
                    "images/otp.png",
                  ),
                ),
                SizedBox(
                  height: RouteManager.width / 6,
                ),
                Text(
                  "Enter Your OTP ",
                  style: TextStyle(
                    fontSize: RouteManager.width / 18,
                  ),
                ),
                SizedBox(
                  height: RouteManager.width / 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PinCodeTextField(
                      pinBoxBorderWidth: RouteManager.width / 100,
                      defaultBorderColor: Colors.transparent,
                      hasTextBorderColor: Colors.blue,
                      maxLength: 5,
                      autofocus: true,
                      hasUnderline: false,
                      onDone: (v) async {
                        if (v != Provider.of<SignUpPro>(context, listen: false).otp) {
                          Provider.of<SignUpPro>(context,listen:false).invalidotp=true;
                          Provider.of<SignUpPro>(context,listen:false).notifyListenerz();
                          ft.Fluttertoast.showToast(
                            msg: "Invalid OTP",
                            toastLength: ft.Toast.LENGTH_LONG,
                          );
                        } else {
                          Provider.of<SignUpPro>(context,listen:false).invalidotp=false;
                          Provider.of<SignUpPro>(context,listen:false).notifyListenerz();
                          API.showLoading(context);
                          API.verifyOTP(Provider.of<SignUpPro>(context, listen: false).userid!, v, context).then(
                            (value) {
                              if (value) {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  RouteManager.signup3,
                                  (route) => false,
                                );
                              }
                            },
                          );
                        }
                      },
                      onTextChanged: (v) {
                        if(v.length<5)
                        {
                          Provider.of<SignUpPro>(context,listen:false).invalidotp=false;
                          Provider.of<SignUpPro>(context,listen:false).notifyListenerz();
                        }
                      },
                      // pinTextAnimatedSwitcherDuration: Duration(seconds: 4),
                      controller: otp,
                      pinBoxColor: Color.fromARGB(255, 195, 225, 250),
                      pinBoxWidth: RouteManager.width / 8,
                      pinBoxHeight: RouteManager.width / 8,
                      pinBoxOuterPadding: EdgeInsets.all(5),
                      keyboardType: TextInputType.number,
                      hasError: Provider.of<SignUpPro>(context).invalidotp,
                      pinTextStyle: TextStyle(
                        fontFamily: 'Outfit',
                        color: Colors.black,
                        fontSize: RouteManager.width / 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: RouteManager.width / 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
