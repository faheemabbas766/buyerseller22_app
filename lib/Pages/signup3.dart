import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart' as ft;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:provider/provider.dart';
import '../Api & Routes/API.dart';
import '../Api & Routes/routes.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

import '../Providers/signuppro.dart';

class SignUp3 extends StatefulWidget {
  const SignUp3({super.key});

  @override
  State<SignUp3> createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pwd1 = TextEditingController();
  TextEditingController pwd2 = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController companyname = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formkey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: RouteManager.width / 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: RouteManager.width / 7,
                          backgroundImage: Provider.of<SignUpPro>(context).dp == null ? null : Image.file(Provider.of<SignUpPro>(context).dp!).image,
                          child: Provider.of<SignUpPro>(context).dp != null
                              ? SizedBox()
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera_alt_sharp,
                                      color: Colors.white,
                                      size: RouteManager.width / 10,
                                    ),
                                    Text(
                                      "Upload Photo",
                                      style: TextStyle(fontSize: RouteManager.width / 27, color: Colors.white),
                                    ),
                                    Text(
                                      "(Optional)",
                                      style: TextStyle(fontSize: RouteManager.width / 35, color: Colors.white),
                                    ),
                                  ],
                                ),
                        ),
                        onTap: () {
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (contextssdsd) {
                                return AlertDialog(
                                  elevation: 2000,
                                  content: Row(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(52, 109, 199, 10),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Camera ",
                                              style: TextStyle(fontSize: RouteManager.width / 22),
                                            ),
                                            Icon(Icons.camera_alt_rounded),
                                          ],
                                        ),
                                        onPressed: () async {
                                          final ImagePicker _picker = ImagePicker();
                                          final XFile? image = await _picker.pickImage(
                                            imageQuality: 10,
                                            source: ImageSource.camera,
                                          );
                                          Navigator.of(context).pop();
                                          if (image != null) {
                                            Provider.of<SignUpPro>(context, listen: false).dp = File(image.path);
                                            setState(() {});
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        width: RouteManager.width / 20,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(52, 109, 199, 10),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Gallery ",
                                              style: TextStyle(fontSize: RouteManager.width / 22),
                                            ),
                                            const Icon(Icons.photo_library),
                                          ],
                                        ),
                                        onPressed: () async {
                                          final ImagePicker _picker = ImagePicker();
                                          final XFile? image = await _picker.pickImage(
                                            imageQuality: 10,
                                            source: ImageSource.gallery,
                                          );
                                          Navigator.of(context).pop();
                                          if (image != null) {
                                            Provider.of<SignUpPro>(context, listen: false).dp = File(image.path);
                                            setState(() {});
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                        // child: Container(
                        //   decoration: const BoxDecoration(
                        //     // color: Colors.red,
                        //     shape: BoxShape.circle,
                        //   ),
                        //   width: RouteManager.width / 3.6,
                        //   height: RouteManager.width / 3.6,
                        //   child: Stack(
                        //     children: [
                        //       Opacity(
                        //         opacity: 0.3,
                        //         child: Container(
                        //           width: RouteManager.width / 3.6,
                        //           height: RouteManager.width / 3.6,
                        //           decoration: const BoxDecoration(
                        //             color: Colors.black,
                        //             shape: BoxShape.circle,
                        //           ),
                        //         ),
                        //       ),
                        //       Center(
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Icon(
                        //               Icons.camera_alt_sharp,
                        //               color: Colors.white,
                        //               size: RouteManager.width / 10,
                        //             ),
                        //             Text(
                        //               "Upload Photo",
                        //               style: TextStyle(fontSize: RouteManager.width / 27, color: Colors.white),
                        //             ),
                        //           ],
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: RouteManager.width / 14,
                  ),
                  // Text(
                  //   "Enter Your Name ",
                  //   style: TextStyle(
                  //     fontSize: RouteManager.width / 22,
                  //     color: Colors.blue,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  SizedBox(
                    width: RouteManager.width / 1.2,
                    child: TextFormField(
                      controller: TextEditingController(text: "+92 " + Provider.of<SignUpPro>(context, listen: false).phn!),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                        // hintText: "Name",
                        // hintStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.grey),
                        enabled: false,
                        contentPadding: EdgeInsets.symmetric(horizontal: RouteManager.width / 30, vertical: RouteManager.width / 30),
                        // counterText: "",
                        labelText: "Your Phn No.",
                        labelStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.green),
                        prefixIcon: Icon(
                          Icons.call,
                          color: Colors.green,
                        ),
                      ),
                      style: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Color.fromARGB(255, 127, 148, 127)),
                    ),
                  ),
                  SizedBox(
                    height: RouteManager.width / 14,
                  ),
                  SizedBox(
                    width: RouteManager.width / 1.2,
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                        hintText: "Name",
                        hintStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.grey),
                        enabled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: RouteManager.width / 30, vertical: RouteManager.width / 30),
                        counterText: "",
                        labelText: "Name",
                        labelStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.blue),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                      ),
                      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      // keyboardType: TextInputType.number,
                      maxLength: 20,
                      style: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.black),
                      // cursorHeight: RouteManager.width / 22,
                      enableIMEPersonalizedLearning: true,
                      // onChanged: (s) {
                      //   if (s.length > 2) {
                      //     phn.text = s.substring(0, s.length);
                      //     // phn.text = "POK";
                      //   }
                      // },
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      onTapOutside: (pointerdownevent) {
                        print("AYAAAAAAAAAAAAAaa");
                      },
                    ),
                  ),
                  SizedBox(
                    height: RouteManager.width / 14,
                  ),
                  SizedBox(
                    width: RouteManager.width / 1.2,
                    child: TextFormField(
                      controller: companyname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.blue,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                        hintText: "Company Name (Optional)",
                        hintStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.grey),
                        enabled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: RouteManager.width / 30, vertical: RouteManager.width / 30),
                        counterText: "",
                        labelText: "Company Name (Optional)",
                        labelStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.blue),
                        prefixIcon: Icon(
                          Icons.work,
                          color: Colors.blue,
                        ),
                      ),
                      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      // keyboardType: TextInputType.number,
                      maxLength: 20,
                      style: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.black),
                      // cursorHeight: RouteManager.width / 22,
                      enableIMEPersonalizedLearning: true,
                      // onChanged: (s) {
                      //   if (s.length > 2) {
                      //     phn.text = s.substring(0, s.length);
                      //     // phn.text = "POK";
                      //   }
                      // },
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      onTapOutside: (pointerdownevent) {
                        print("AYAAAAAAAAAAAAAaa");
                      },
                    ),
                  ),
                  SizedBox(
                    height: RouteManager.width / 14,
                  ),
                  // Text(
                  //   "Enter Your Email ",
                  //   style: TextStyle(
                  //     fontSize: RouteManager.width / 22,
                  //     color: Colors.blue,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: RouteManager.width / 30,
                  // ),
                  SizedBox(
                    width: RouteManager.width / 1.2,
                    child: TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.blue,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.grey),
                        enabled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: RouteManager.width / 30, vertical: RouteManager.width / 30),
                        counterText: "",
                        labelText: "Email",
                        labelStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.blue),
                      ),
                      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      // keyboardType: TextInputType.number,
                      maxLength: 20,
                      style: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.black),
                      // cursorHeight: RouteManager.width / 22,
                      enableIMEPersonalizedLearning: true,
                      // onChanged: (s) {
                      //   if (s.length > 2) {
                      //     phn.text = s.substring(0, s.length);
                      //     // phn.text = "POK";
                      //   }
                      // },
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      onTapOutside: (pointerdownevent) {
                        print("AYAAAAAAAAAAAAAaa");
                      },
                    ),
                  ),
                  SizedBox(
                    height: RouteManager.width / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownButton<String>(
                        items: [],
                        onChanged: (obj) {},
                        value: "Pakistan",
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                          size: RouteManager.width / 14,
                        ),
                        hint: Row(
                          children: [
                            SizedBox(
                              width: RouteManager.width / 12,
                              child: Image.asset("images/pakistan.png"),
                            ),
                            Text(
                              " Pakistan",
                              style: TextStyle(
                                fontSize: RouteManager.width / 22,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      DropdownButton<String>(
                        items: <String>["Rawalpindi", "Islamabad"].map((c) {
                          return DropdownMenuItem<String>(
                            value: c,
                            child: Text(
                              c,
                              style: TextStyle(fontSize: RouteManager.width / 23),
                            ),
                          );
                        }).toList(),
                        onChanged: (obj) {
                          Provider.of<SignUpPro>(context, listen: false).selectedcity = obj;
                          Provider.of<SignUpPro>(context, listen: false).notifyListenerz();
                        },
                        value: Provider.of<SignUpPro>(context).selectedcity,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.blue,
                          size: RouteManager.width / 14,
                        ),
                        hint: Text(
                          "Select City",
                          style: TextStyle(
                            fontSize: RouteManager.width / 22,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: RouteManager.width / 16,
                  ),
                  // Text(
                  //   "Enter Your Password ",
                  //   style: TextStyle(
                  //     fontSize: RouteManager.width / 22,
                  //     color: Colors.black,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: RouteManager.width / 30,
                  // ),
                  SizedBox(
                    width: RouteManager.width / 1.2,
                    child: TextFormField(
                      controller: address,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_on_rounded,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.blue,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                        hintText: "Address",
                        hintStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.grey),
                        enabled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: RouteManager.width / 30, vertical: RouteManager.width / 30),
                        counterText: "",
                        labelText: "Address",
                        labelStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.blue),
                      ),
                      style: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.black),
                      enableIMEPersonalizedLearning: true,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      onTapOutside: (pointerdownevent) {
                        print("AYAAAAAAAAAAAAAaa");
                      },
                    ),
                  ),
                  SizedBox(
                    height: RouteManager.width / 14,
                  ),
                  SizedBox(
                    width: RouteManager.width / 1.2,
                    child: TextFormField(
                      controller: pwd1,
                      obscureText: Provider.of<SignUpPro>(context).obscure1,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.blue,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.grey),
                        enabled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: RouteManager.width / 30, vertical: RouteManager.width / 30),
                        counterText: "",
                        labelText: "Password",
                        labelStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.blue),
                        suffixIcon: InkWell(
                          onTap: () {
                            Provider.of<SignUpPro>(context, listen: false).obscure1 = !Provider.of<SignUpPro>(context, listen: false).obscure1;
                            Provider.of<SignUpPro>(context, listen: false).notifyListenerz();
                          },
                          child: Provider.of<SignUpPro>(context).obscure1 ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                        ),
                      ),
                      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      // keyboardType: TextInputType.number,
                      maxLength: 20,
                      style: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.black),
                      // cursorHeight: RouteManager.width / 22,
                      enableIMEPersonalizedLearning: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return null;
                        }
                        if (value.length < 6) {
                          return "Minimum 6 Characters";
                        }
                        if (value.length > 20) {
                          return "Maximum 20 Characters Allowed";
                        }
                        return null;
                      },
                      // onChanged: (s) {
                      //   if (s.length > 2) {
                      //     phn.text = s.substring(0, s.length);
                      //     // phn.text = "POK";
                      //   }
                      // },
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      onTapOutside: (pointerdownevent) {
                        print("AYAAAAAAAAAAAAAaa");
                      },
                    ),
                  ),
                  SizedBox(
                    height: RouteManager.width / 14,
                  ),
                  // Text(
                  //   "Re-Enter Your Password ",
                  //   style: TextStyle(
                  //     fontSize: RouteManager.width / 22,
                  //     color: Colors.black,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: RouteManager.width / 30,
                  // ),
                  SizedBox(
                    width: RouteManager.width / 1.2,
                    child: TextFormField(
                      controller: pwd2,
                      obscureText: Provider.of<SignUpPro>(context, listen: false).obscure2,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.blue,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                        ),
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.grey),
                        enabled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: RouteManager.width / 30, vertical: RouteManager.width / 30),
                        counterText: "",
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.blue),
                        suffixIcon: InkWell(
                          onTap: () {
                            Provider.of<SignUpPro>(context, listen: false).obscure2 = !Provider.of<SignUpPro>(context, listen: false).obscure2;
                            Provider.of<SignUpPro>(context, listen: false).notifyListenerz();
                          },
                          child: Provider.of<SignUpPro>(context).obscure2 ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return null;
                        }
                        if (value != pwd1.text) {
                          return "Passwords Do Not Match";
                        }
                        return null;
                      },

                      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      // keyboardType: TextInputType.number,
                      maxLength: 20,
                      style: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.black),
                      // cursorHeight: RouteManager.width / 22,
                      enableIMEPersonalizedLearning: true,
                      // onChanged: (s) {
                      //   if (s.length > 2) {
                      //     phn.text = s.substring(0, s.length);
                      //     // phn.text = "POK";
                      //   }
                      // },
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      onTapOutside: (pointerdownevent) {
                        print("AYAAAAAAAAAAAAAaa");
                      },
                    ),
                  ),
                  SizedBox(
                    height: RouteManager.width / 18,
                  ),
                  AnimatedButton(
                    onPress: () {
                      // if (Provider.of<SignUpPro>(context, listen: false).dp == null) {
                      //   ft.Fluttertoast.showToast(
                      //     msg: "Select Photo",
                      //     toastLength: ft.Toast.LENGTH_SHORT,
                      //   );
                      //   // Provider.of<SignUpPro>(context, listen: false).registerselected = Provider.of<SignUpPro>(context, listen: false).registerselected;
                      //   // Provider.of<SignUpPro>(context, listen: false).notifyListenerz();
                      //   // Provider.of<SignUpPro>(context, listen: false).registerselected = !Provider.of<SignUpPro>(context, listen: false).registerselected;
                      //   // Provider.of<SignUpPro>(context, listen: false).notifyListenerz();
                      //   print("------------->>>>>>>>>>>>>>>>>>>>" + Provider.of<SignUpPro>(context, listen: false).registerselected.toString());
                      //   return;
                      // }
                      if (name.text == "" || email.text == "" || address.text == "" || pwd1.text == "" || pwd2.text == "") {
                        ft.Fluttertoast.showToast(
                          msg: "Please Fill all Fields",
                          toastLength: ft.Toast.LENGTH_SHORT,
                        );
                        return;
                      }
                      if (Provider.of<SignUpPro>(context, listen: false).selectedcity == null) {
                        ft.Fluttertoast.showToast(
                          msg: "Select City",
                          toastLength: ft.Toast.LENGTH_SHORT,
                        );
                        return;
                      }
                      final isvalidform = formkey.currentState!.validate();
                      if (isvalidform) {
                        print("VALIDATEDDDDDDDDDDDDDDDDDDDD");
                        API.showLoading(context);
                        API
                            .createUser(Provider.of<SignUpPro>(context, listen: false).userid!, name.text, companyname.text, email.text, address.text,
                                Provider.of<SignUpPro>(context, listen: false).dp, pwd1.text,"Pakistan",Provider.of<SignUpPro>(context,listen:false).selectedcity!, context)
                            .then((value) {
                          if (value) {
                            Provider.of<SignUpPro>(context, listen: false).selectedcity=null;
                            Provider.of<SignUpPro>(context, listen: false).clearAll();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              RouteManager.signup1,
                              (route) => false,
                            );
                          }
                          else
                          {
                            Navigator.of(context, rootNavigator: true).pop();
                          }
                        });
                      }
                    },
                    width: RouteManager.width / 1.1,
                    isReverse: false,
                    backgroundColor: Colors.white,
                    // borderColor: Colors.green,
                    selectedBackgroundColor: Colors.blue,
                    isSelected: Provider.of<SignUpPro>(context).registerselected,
                    selectedText: "Register",
                    // animationDuration: Duration(seconds: 1),
                    text: 'Registering...',
                    selectedTextColor: Colors.white,
                    transitionType: TransitionType.CENTER_TB_IN,
                    textStyle: TextStyle(
                      fontSize: RouteManager.width / 13,
                      letterSpacing: 2,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
