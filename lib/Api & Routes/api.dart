import 'dart:convert';
import 'dart:io';

import 'package:buyerseller/Entities/buyerrequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as ft;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:provider/provider.dart';
import '../Entities/sellerrequest.dart';
import '../Providers/homepro.dart';
import '../Providers/profilepro.dart';
import '../Providers/signuppro.dart';
import 'routes.dart';

class API {
  static var ip = "https://seller.wd4webdemo.com/";
  static var imageip = "https://seller.wd4webdemo.com/public/uploads/";

  static showLoading(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (contextssdsd) {
        return WillPopScope(
          onWillPop: () {
            return Future(() => false);
          },
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: RouteManager.width / 4,
                          height: RouteManager.width / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3), // Image border
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(20), // Image radius
                            child: Image.asset(
                              'images/bid.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: RouteManager.width / 7,
                          height: RouteManager.width / 7,
                          child: CircularProgressIndicator(
                            strokeWidth: RouteManager.width / 200,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<bool> checkUser(String phn, BuildContext context) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ip + "checkuser"),
    );
    request.headers.addAll({'Content-type': 'multipart/form-data'});
    request.fields.addAll({
      'phone': phn,
    });
    var response;
    try {
      response = await request.send().timeout(Duration(seconds: 25), onTimeout: () {
        throw "TimeOut";
      });
      var responsed = await http.Response.fromStream(response);
      if (response.statusCode == 200) {
        var res = jsonDecode(responsed.body);
        print("RESPONSE:::::::::::::::::::::::::::::::::::::::::" + res.toString());
        if (res["status"] == 600) {
          ft.Fluttertoast.showToast(
            msg: res["message"],
            toastLength: ft.Toast.LENGTH_LONG,
          );
          Provider.of<SignUpPro>(context, listen: false).otp = res["data"]["AU_OTP"];
          Provider.of<SignUpPro>(context, listen: false).userid = int.parse(res["data"]["AU_ID"]);
          print("OTP IS------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + Provider.of<SignUpPro>(context, listen: false).otp!);
          return true;
        } else if (res["status"] == 610) {
          if (int.parse(res["data"]["AU_VERIFIED"]) == 0) {
            Provider.of<SignUpPro>(context, listen: false).otp = res["data"]["AU_OTP"];
            Provider.of<SignUpPro>(context, listen: false).userid = int.parse(res["data"]["AU_ID"]);
            print("OTP IS------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + Provider.of<SignUpPro>(context, listen: false).otp!);
            return true;
          } else if (res["data"]["AU_NAME"] == null) {
            Provider.of<SignUpPro>(context, listen: false).otpalreadyverified = true;
            Provider.of<SignUpPro>(context, listen: false).userid = int.parse(res["data"]["AU_ID"]);
            ft.Fluttertoast.showToast(
              msg: "OTP Already Verified",
              toastLength: ft.Toast.LENGTH_LONG,
            );
            return true;
          }
          ft.Fluttertoast.showToast(
            msg: res["message"],
            toastLength: ft.Toast.LENGTH_LONG,
          );
        }
        return false;
      } else {
        ft.Fluttertoast.showToast(
          msg: "Failed",
          toastLength: ft.Toast.LENGTH_LONG,
        );
        return false;
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
        msg: "Failed",
        toastLength: ft.Toast.LENGTH_LONG,
      );
      return false;
    }
  }

  static Future<bool> verifyOTP(int userid, String otp, BuildContext context) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ip + "verifyotp"),
    );
    request.headers.addAll({'Content-type': 'multipart/form-data'});
    request.fields.addAll({
      'id': userid.toString(),
      'otp': otp.toString(),
    });
    var response;
    try {
      response = await request.send().timeout(Duration(seconds: 25), onTimeout: () {
        throw "TimeOut";
      });
      var responsed = await http.Response.fromStream(response);
      if (response.statusCode == 200) {
        var res = jsonDecode(responsed.body);
        if (res["status"] == 602) {
          ft.Fluttertoast.showToast(
            msg: res["message"],
            toastLength: ft.Toast.LENGTH_LONG,
          );
          return true;
        }
        return false;
      } else {
        ft.Fluttertoast.showToast(
          msg: "Failed",
          toastLength: ft.Toast.LENGTH_LONG,
        );
        return false;
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
        msg: "Failed",
        toastLength: ft.Toast.LENGTH_LONG,
      );
      return false;
    }
  }

  static Future<bool> createUser(int userid, String name, String compname, String email, String address, File? dp, String pwd, String country, String city, BuildContext context) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ip + "createuser"),
    );
    request.headers.addAll({'Content-type': 'multipart/form-data'});
    request.fields.addAll(
      {
        'id': userid.toString(),
        'name': name,
        'password': pwd,
        'company_name': compname,
        'email': email,
        'country': 1.toString(),
        'city': city.toString() == "Rawalpindi" ? 1.toString() : 2.toString(),
        'address': address.toString(),
      },
    );
    if (dp != null) {
      request.files.add(await http.MultipartFile.fromPath('picture', dp.path, contentType: MediaType('image', 'jpeg')));
    }

    var response;
    try {
      response = await request.send().timeout(Duration(seconds: 25), onTimeout: () {
        throw "TimeOut";
      });
      var responsed = await http.Response.fromStream(response);
      if (response.statusCode == 200) {
        var res = jsonDecode(responsed.body);
        print("RESPONSE::::::::::::::::::::::::::::::::::" + res.toString());
        if (res["status"] == 603) {
          ft.Fluttertoast.showToast(
            msg: res["message"],
            toastLength: ft.Toast.LENGTH_LONG,
          );
          return true;
        } else if (res["status"] == 605) {
          ft.Fluttertoast.showToast(
            msg: res["message"],
            toastLength: ft.Toast.LENGTH_LONG,
          );
          return false;
        }
        return false;
      } else {
        ft.Fluttertoast.showToast(
          msg: "Failed",
          toastLength: ft.Toast.LENGTH_LONG,
        );
        return false;
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
        msg: "Failed",
        toastLength: ft.Toast.LENGTH_LONG,
      );
      return false;
    }
  }

  static Future<bool> signIn(String phn, String pwd, BuildContext context) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ip + "userlogin"),
    );
    request.headers.addAll({'Content-type': 'multipart/form-data'});
    request.fields.addAll(
      {
        'phone': phn.toString(),
        'password': pwd,
      },
    );
    var response;
    try {
      response = await request.send().timeout(Duration(seconds: 25), onTimeout: () {
        throw "TimeOut";
      });
      var responsed = await http.Response.fromStream(response);
      if (response.statusCode == 200) {
        print("AYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa");
        var res = jsonDecode(responsed.body);
        if (res["status"] == 702) {
          ft.Fluttertoast.showToast(
            msg: res["message"],
            toastLength: ft.Toast.LENGTH_LONG,
          );
          Provider.of<ProfilePro>(context, listen: false).userid = int.parse(res["data"]["AU_ID"]);
          Provider.of<ProfilePro>(context, listen: false).name = res["data"]["AU_NAME"];
          Provider.of<ProfilePro>(context, listen: false).role = int.parse(res["data"]["AU_CURRENT_ROLE"]);
          Provider.of<ProfilePro>(context, listen: false).dp = res["data"]["AU_Profile"];
          Provider.of<ProfilePro>(context, listen: false).email = res["data"]["AU_EMAIL"];
          Provider.of<ProfilePro>(context, listen: false).company = res["data"]["AU_COMPANY"];
          Provider.of<ProfilePro>(context, listen: false).address = res["data"]["AU_ADDRESS"];
          Provider.of<ProfilePro>(context, listen: false).phn = res["data"]["AU_PHONE"];
          Provider.of<ProfilePro>(context, listen: false).company = res["data"]["AU_COMPANY"];
          if (res["data"]["AU_CITY"] == "1") {
            Provider.of<ProfilePro>(context, listen: false).city = "Rawalpindi";
          } else {
            Provider.of<ProfilePro>(context, listen: false).city = "Islamabad";
          }
          return true;
        } else {
          ft.Fluttertoast.showToast(
            msg: res["message"],
            toastLength: ft.Toast.LENGTH_LONG,
          );
          return false;
        }
      } else {
        ft.Fluttertoast.showToast(
          msg: "Failed",
          toastLength: ft.Toast.LENGTH_LONG,
        );
        return false;
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
        msg: "Failed",
        toastLength: ft.Toast.LENGTH_LONG,
      );
      return false;
    }
  }

  static Future<bool> updateRole(int userid, int role, BuildContext context) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ip + "updaterole"),
    );
    request.headers.addAll({'Content-type': 'multipart/form-data'});
    request.fields.addAll(
      {
        'id': userid.toString(),
        'role': role.toString(),
      },
    );
    var response;
    try {
      response = await request.send().timeout(
        Duration(seconds: 25),
        onTimeout: () {
          throw "TimeOut";
        },
      );
      var responsed = await http.Response.fromStream(response);
      if (response.statusCode == 200) {
        print("AYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa");
        var res = jsonDecode(responsed.body);
        if (res["status"] == 801) {
          ft.Fluttertoast.showToast(
            msg: "Welcome",
            toastLength: ft.Toast.LENGTH_LONG,
          );
          return true;
        } else {
          ft.Fluttertoast.showToast(
            msg: "Failed",
            toastLength: ft.Toast.LENGTH_LONG,
          );
        }
        return false;
      } else {
        ft.Fluttertoast.showToast(
          msg: "Failed",
          toastLength: ft.Toast.LENGTH_LONG,
        );
        return false;
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
        msg: "Failed",
        toastLength: ft.Toast.LENGTH_LONG,
      );
      return false;
    }
  }

  static Future<bool> getUser(int userid, BuildContext context) async {
    var response;
    try {
      response = await http.get(
        Uri.parse(
          ip + "getuser/" + userid.toString(),
        ),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      ).timeout(
        const Duration(seconds: 25),
      );
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        print("RESPONSE:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::" + res.toString());
        Provider.of<ProfilePro>(context, listen: false).name = res["data"][0]["name"];
        Provider.of<ProfilePro>(context, listen: false).role = int.parse(res["data"][0]["role"]);
        Provider.of<ProfilePro>(context, listen: false).dp = res["data"][0]["profile_pic"];
        Provider.of<ProfilePro>(context, listen: false).email = res["data"][0]["email"];
        Provider.of<ProfilePro>(context, listen: false).company = res["data"][0]["company"];
        Provider.of<ProfilePro>(context, listen: false).address = res["data"][0]["address"];
        Provider.of<ProfilePro>(context, listen: false).phn = res["data"][0]["phn"];
        if (res["data"][0]["city"] == "1") {
          Provider.of<ProfilePro>(context, listen: false).city = "Rawalpindi";
        } else {
          Provider.of<ProfilePro>(context, listen: false).city = "Islamabad";
        }
        return true;
      } else {
        print(response.statusCode.toString() + "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
        throw Exception();
      }
    } catch (e) {
      print(e.toString() + "############################################################################################################################################################");
      return false;
    }
  }

  static Future<bool> updateProfile(int userid, String name, String companyname, String address, String picture, File? dp, BuildContext context) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ip + "updateprofile"),
    );
    request.headers.addAll({'Content-type': 'multipart/form-data'});
    request.fields.addAll(
      {
        'id': userid.toString(),
        'name': name.toString(),
        'company_name': companyname.toString(),
        'address': address.toString(),
        'oldpicture': picture.toString(),
      },
    );
    if (dp != null) {
      request.files.add(await http.MultipartFile.fromPath('picture', dp.path, contentType: MediaType('image', 'jpeg')));
    }
    var response;
    try {
      response = await request.send().timeout(Duration(seconds: 25), onTimeout: () {
        throw "TimeOut";
      });
      var responsed = await http.Response.fromStream(response);
      if (response.statusCode == 200) {
        var res = jsonDecode(responsed.body);
        print("RESPONSE:::::::::::::::::::::::::::::::::::::::::::::::::::;;;;" + res.toString());
        Provider.of<ProfilePro>(context, listen: false).name = name;
        Provider.of<ProfilePro>(context, listen: false).company = companyname;
        Provider.of<ProfilePro>(context, listen: false).address = address;
        Provider.of<ProfilePro>(context, listen: false).dp = res["data"]["AU_Profile"];
        ft.Fluttertoast.showToast(
          msg: "Changes Saved",
          toastLength: ft.Toast.LENGTH_LONG,
        );
        return true;
      } else {
        print("ROLAAAAAAAAAAAAAAAAAAAAA::::::::::" + jsonDecode(responsed.body).toString());
        ft.Fluttertoast.showToast(
          msg: "Failed",
          toastLength: ft.Toast.LENGTH_LONG,
        );
        return false;
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
        msg: "Failed",
        toastLength: ft.Toast.LENGTH_LONG,
      );
      return false;
    }
  }

  static Future<bool> createPost(int userid, String title, String desc, String category, BuildContext context) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ip + "createrequest"),
    );
    request.headers.addAll({'Content-type': 'multipart/form-data'});
    request.fields.addAll(
      {
        'id': userid.toString(),
        'r_title': title,
        'r_description': desc,
        'r_category': category,
      },
    );

    var response;
    try {
      response = await request.send().timeout(Duration(seconds: 25), onTimeout: () {
        throw "TimeOut";
      });
      var responsed = await http.Response.fromStream(response);
      if (response.statusCode == 200) {
        var res = jsonDecode(responsed.body);
        print("RESPONSE::::::::::::::::::::::::::::::::::" + res.toString());
        if (res["status"] == 401) {
          ft.Fluttertoast.showToast(
            msg: res["message"],
            toastLength: ft.Toast.LENGTH_LONG,
          );
          return true;
        }
        return false;
      } else {
        ft.Fluttertoast.showToast(
          msg: "Failed",
          toastLength: ft.Toast.LENGTH_LONG,
        );
        return false;
      }
    } catch (e) {
      ft.Fluttertoast.showToast(
        msg: "Failed",
        toastLength: ft.Toast.LENGTH_LONG,
      );
      return false;
    }
  }

  static Future<bool> getFeed(int userid, int role, int limit, BuildContext context) async {
    print("GET REQUEST CALLEDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD-->" + role.toString() + "-->" + limit.toString());
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ip + "getrequest"),
    );
    request.headers.addAll({'Content-type': 'multipart/form-data'});
    request.fields.addAll(
      {
        'id': userid.toString(),
        'role': role.toString(),
        'limit': limit.toString(),
      },
    );

    var response;
    try {
      response = await request.send().timeout(Duration(seconds: 25), onTimeout: () {
        throw "TimeOut";
      });
      var responsed = await http.Response.fromStream(response);
      if (response.statusCode == 200) {
        var res = jsonDecode(responsed.body);
        print("GetRequest::::::::::::::::::::::::::::::::::" + res.toString());
        if (res["status"] == 401) {
          if (limit == 1) {
            if (role == 1) {
              List<BuyerRequest> brlist = [];
              for (var i in res["data"]) {
                brlist.add(
                  BuyerRequest(
                    int.parse(i["r_id"]),
                    i["profile_pic"],
                    i["title"],
                    i["description"],
                  ),
                );
              }
              Provider.of<HomePro>(context, listen: false).buyerreqs = brlist;
            } else {
              List<SellerRequest> srlist = [];
              for (var i in res["data"]) {
                srlist.add(
                  SellerRequest(
                    int.parse(i["r_id"]),
                    i["profile_pic"],
                    i["title"],
                    i["description"],
                    i["city"] == "1" ? "Rawalpindi" : "Islamabad",
                  ),
                );
              }
              Provider.of<HomePro>(context, listen: false).sellerreqs = srlist;
            }
          } else {
            if (role == 1) {
              List<BuyerRequest> brlist = [];
              for (var i in res["data"]) {
                brlist.add(
                      BuyerRequest(
                        int.parse(i["r_id"]),
                        i["profile_pic"],
                        i["title"],
                        i["description"],
                      ),
                    );
                // if (Provider.of<HomePro>(context, listen: false).buyerkey.currentContext != null) {
                //   Provider.of<HomePro>(context, listen: false).buyerkey.currentState!.insertItem(0, duration: const Duration(seconds: 1));
                //   print("AYA-------------------------------------------------------------------------------------");
                // }
              }
              Provider.of<HomePro>(context, listen: false).buyerreqs += brlist;
            } else {
              List<SellerRequest> srlist = [];
              for (var i in res["data"]) {
                srlist.add(
                  SellerRequest(
                    int.parse(i["r_id"]),
                    i["profile_pic"],
                    i["title"],
                    i["description"],
                    i["city"] == "1" ? "Rawalpindi" : "Islamabad",
                  ),
                );
              }
              Provider.of<HomePro>(context, listen: false).sellerreqs += srlist;
            }
          }

          return true;
        }
        return false;
      } else {
        print("ROLAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
