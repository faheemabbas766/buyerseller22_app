import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as ft;
import 'package:flutter/services.dart';
import 'package:metaballs/metaballs.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Api & Routes/API.dart';
import '../Api & Routes/routes.dart';
import '../Providers/homepro.dart';
import '../Providers/profilepro.dart';
import '../Providers/signuppro.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({super.key});

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  TextEditingController phn = TextEditingController();
  TextEditingController pwd = TextEditingController();
  final formkey1 = GlobalKey<FormState>();
  final formkey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
            body: Stack(
          children: [
            Metaballs(
              color: const Color.fromARGB(255, 66, 133, 244),
              effect: MetaballsEffect.follow(
                growthFactor: 1,
                smoothing: 1,
                radius: 0.5,
              ),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 11, 9, 152),
                Color.fromARGB(255, 150, 154, 207),
              ], begin: Alignment.bottomRight, end: Alignment.topLeft),
              metaballs: 30,
              animationDuration: const Duration(milliseconds: 200),
              speedMultiplier: 1,
              bounceStiffness: 3,
              minBallRadius: 15,
              maxBallRadius: 40,
              glowRadius: 0.7,
              glowIntensity: 0.6,
            ),
            Opacity(
              opacity: 0.4,
              child: Container(
                color: Colors.black,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  width: RouteManager.width / 2,
                  height: RouteManager.width / 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(48), // Image radius
                      child: Image.asset('images/bid.png', fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(
                  height: RouteManager.width / 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   width: RouteManager.width / 30,
                    // ),
                    Icon(
                      Icons.call,
                      color: Color.fromARGB(255, 133, 216, 136),
                      size: RouteManager.width / 11,
                    ),
                    Text(
                      " 92",
                      style: TextStyle(
                        fontSize: RouteManager.width / 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: RouteManager.width / 30,
                    ),
                    SizedBox(
                      width: RouteManager.width / 2.4,
                      child: Form(
                        key: formkey1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          controller: phn,
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
                                color: Colors.white,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 255, 145, 145),
                              ),
                            ),
                            hintText: "3xxxxxxxxx",
                            hintStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 19, color: const Color.fromARGB(255, 211, 211, 211)),
                            enabled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: RouteManager.width / 30, vertical: RouteManager.width / 30),
                            counterText: "",
                            errorStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 30, color: const Color.fromARGB(255, 255, 145, 145)),
                          ),
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          style: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 19, color: Colors.white),
                          // cursorHeight: RouteManager.width / 22,
                          // enableIMEPersonalizedLearning: true,
                          // onChanged: (s) {
                          //   if (s.length > 2) {
                          //     phn.text = s.substring(0, s.length);
                          //     // phn.text = "POK";
                          //   }
                          // },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Phn No.";
                            }
                            if (value.length != 10) {
                              return "Incomplete Phn No";
                            }
                            return null;
                          },
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          onTapOutside: (pointerdownevent) {
                            print("AYAAAAAAAAAAAAAaa");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: RouteManager.width / 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 55, 118, 228),
                            Color.fromARGB(255, 238, 93, 93),
                            // const Color.fromARGB(255, 207, 127, 221)
                            //add more colors
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(RouteManager.width / 30),
                          primary: Colors.transparent,
                          onSurface: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          final isvalidform = formkey1.currentState!.validate();
                          if (!isvalidform) {
                            return;
                          }
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (contextssdsd) {
                              return StatefulBuilder(builder: (context, s) {
                                return AlertDialog(
                                  title: Center(
                                    child: Text(
                                      "Password",
                                      style: TextStyle(
                                        fontSize: RouteManager.width / 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  elevation: 2000,
                                  content: Container(
                                    height: RouteManager.width / 2.6,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: RouteManager.width / 1.2,
                                          child: Form(
                                            key: formkey2,
                                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                            child: TextFormField(
                                              controller: pwd,
                                              obscureText: Provider.of<SignUpPro>(context).signinobscure,
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
                                                hintText: "Password",
                                                hintStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.grey),
                                                enabled: true,
                                                contentPadding: EdgeInsets.symmetric(horizontal: RouteManager.width / 30, vertical: RouteManager.width / 30),
                                                counterText: "",
                                                labelText: "Password",
                                                labelStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.blue),
                                                suffixIcon: InkWell(
                                                  onTap: () {
                                                    Provider.of<SignUpPro>(context, listen: false).signinobscure = !Provider.of<SignUpPro>(context, listen: false).signinobscure;
                                                    Provider.of<SignUpPro>(context, listen: false).notifyListenerz();
                                                  },
                                                  child: Provider.of<SignUpPro>(context).signinobscure ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                                                ),
                                              ),
                                              maxLength: 20,
                                              style: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.black),
                                              enableIMEPersonalizedLearning: true,
                                              maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                              onTapOutside: (pointerdownevent) {
                                                print("AYAAAAAAAAAAAAAaa");
                                              },
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Enter Password";
                                                }
                                                if (value.length < 6) {
                                                  return "Incomplete Password";
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: RouteManager.width / 20,
                                        ),
                                        DecoratedBox(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(255, 55, 118, 228),
                                                Color.fromARGB(255, 238, 93, 93),
                                                // const Color.fromARGB(255, 207, 127, 221)
                                                //add more colors
                                              ],
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                          ),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.all(RouteManager.width / 30),
                                              primary: Colors.transparent,
                                              onSurface: Colors.transparent,
                                              shadowColor: Colors.transparent,
                                            ),
                                            child: const Text(
                                              'Sign In',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () {
                                              final isvalidform = formkey2.currentState!.validate();
                                              if (!isvalidform) {
                                                return;
                                              }
                                              API.showLoading(context);
                                              API.signIn(phn.text, pwd.text, context).then(
                                                (value) {
                                                  if (value) {
                                                    if (Provider.of<ProfilePro>(context, listen: false).role == 0) {
                                                      showDialog(
                                                        barrierDismissible: false,
                                                        context: context,
                                                        builder: (contextssdsd) {
                                                          return WillPopScope(
                                                            onWillPop: () {
                                                              return Future(() => false);
                                                            },
                                                            child: AlertDialog(
                                                              title: Text(
                                                                "Continue as...",
                                                                style: TextStyle(
                                                                  fontSize: RouteManager.width / 16,
                                                                ),
                                                              ),
                                                              elevation: 2000,
                                                              content: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                      backgroundColor: const Color.fromRGBO(52, 109, 199, 10),
                                                                    ),
                                                                    child: Row(
                                                                      children: [
                                                                        Text(
                                                                          "Buyer ",
                                                                          style: TextStyle(fontSize: RouteManager.width / 22),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    onPressed: () async {
                                                                      Provider.of<ProfilePro>(context, listen: false).role = 1;
                                                                      API.showLoading(context);
                                                                      API
                                                                          .updateRole(
                                                                        Provider.of<ProfilePro>(context, listen: false).userid!,
                                                                        Provider.of<ProfilePro>(context, listen: false).role,
                                                                        context,
                                                                      )
                                                                          .then(
                                                                        (value) {
                                                                          if (value) {
                                                                            SharedPreferences.getInstance().then(
                                                                              (prefs) {
                                                                                prefs.clear();
                                                                                prefs.setString('userid', Provider.of<ProfilePro>(context, listen: false).userid.toString()).then(
                                                                                  (value) {
                                                                                    prefs.setString('role', Provider.of<ProfilePro>(context, listen: false).role.toString()).then(
                                                                                      (value) {
                                                                                        print("SHARED PREFERENCES SAVEDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDd");
                                                                                        Navigator.of(context).pushNamedAndRemoveUntil(
                                                                                          RouteManager.homepage,
                                                                                          (route) => false,
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            );
                                                                          }
                                                                        },
                                                                      );
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
                                                                          "Seller ",
                                                                          style: TextStyle(fontSize: RouteManager.width / 22),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    onPressed: () async {
                                                                      Provider.of<ProfilePro>(context, listen: false).role = 2;
                                                                      API.showLoading(context);
                                                                      API
                                                                          .updateRole(
                                                                        Provider.of<ProfilePro>(context, listen: false).userid!,
                                                                        Provider.of<ProfilePro>(context, listen: false).role,
                                                                        context,
                                                                      )
                                                                          .then(
                                                                        (value) {
                                                                          final prefs = SharedPreferences.getInstance().then(
                                                                            (prefs) {
                                                                              prefs.clear();
                                                                              prefs.setString('userid', Provider.of<ProfilePro>(context, listen: false).userid.toString()).then(
                                                                                (value) {
                                                                                  prefs.setString('role', Provider.of<ProfilePro>(context, listen: false).role.toString()).then(
                                                                                    (value) {
                                                                                      print("SHARED PREFERENCES SAVEDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDd");
                                                                                      Navigator.of(context).pushNamedAndRemoveUntil(
                                                                                        RouteManager.homepage,
                                                                                        (route) => false,
                                                                                      );
                                                                                      phn.text = "";
                                                                                      pwd.text = "";
                                                                                    },
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    } else {
                                                      final prefs = SharedPreferences.getInstance().then(
                                                        (prefs) {
                                                          prefs.clear();
                                                          prefs.setString('userid', Provider.of<ProfilePro>(context, listen: false).userid.toString()).then(
                                                            (value) {
                                                              prefs.setString('role', Provider.of<ProfilePro>(context, listen: false).role.toString()).then(
                                                                (value) {
                                                                  print("SHARED PREFERENCES SAVEDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDd");
                                                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                                                    RouteManager.homepage,
                                                                    (route) => false,
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          );
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    Navigator.of(context, rootNavigator: true).pop();
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                            },
                          ).then((value) {
                            pwd.text = "";
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: RouteManager.width / 12,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 238, 93, 93),
                            Color.fromARGB(255, 55, 118, 228),

                            // const Color.fromARGB(255, 207, 127, 221)
                            //add more colors
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(RouteManager.width / 30),
                          primary: Colors.transparent,
                          onSurface: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          final isvalidform = formkey1.currentState!.validate();
                          if (!isvalidform) {
                            return;
                          }
                          API.showLoading(context);
                          Provider.of<SignUpPro>(context, listen: false).phn = phn.text;
                          API.checkUser(phn.text, context).then(
                            (value) {
                              if (value) {
                                if (Provider.of<SignUpPro>(context, listen: false).otpalreadyverified) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    RouteManager.signup3,
                                    (route) => false,
                                  );
                                } else {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    RouteManager.signup2,
                                    (route) => false,
                                  );
                                }
                              } else {
                                Navigator.of(context, rootNavigator: true).pop();
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                //   onPressed: () {
                //     Navigator.of(context).pushNamed(
                //       RouteManager.signup2,
                //     );
                //   },
                //   child: Text(
                //     "Send OTP",
                //     style: TextStyle(fontSize: RouteManager.width / 18),
                //   ),
                // ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
