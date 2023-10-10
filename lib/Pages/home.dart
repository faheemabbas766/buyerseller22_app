import 'package:buyerseller/Api%20&%20Routes/api.dart';
import 'package:buyerseller/Pages/buyerhome.dart';
import 'package:buyerseller/Pages/sellerhome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api & Routes/routes.dart';
import '../Providers/homepro.dart';
import '../Providers/profilepro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  final formkey1 = GlobalKey<FormState>();

  String _address = 'Home Address';
  List<String> categories = [
    "Vehicles",
    "Electronics",
    "Clothes",
    "Appliances",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'Switch TO',
              //   style: TextStyle(
              //     fontSize: 12,
              //     fontWeight: FontWeight.w400,
              //     color: Colors.black,
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    isScrollControlled: true,
                    context: context,
                    useSafeArea: true,
                    builder: (BuildContext context) {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: RouteManager.width / 5,
                              child: Image.asset(
                                "images/switchuser.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: RouteManager.width / 30),
                            Text(
                              Provider.of<ProfilePro>(context, listen: false).role == 1 ? "Switch to Seller Mode" : "Switch to Buyer Mode",
                              style: TextStyle(
                                fontSize: RouteManager.width / 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 89, 174, 253),
                              ),
                            ),
                            SizedBox(
                              height: RouteManager.width / 6,
                            ),
                            InkWell(
                              onTap: () {
                                API.showLoading(context);
                                API
                                    .updateRole(
                                  Provider.of<ProfilePro>(context, listen: false).userid!,
                                  Provider.of<ProfilePro>(context, listen: false).role == 1 ? 2 : 1,
                                  context,
                                )
                                    .then((value) {
                                  if (value) {
                                    Provider.of<ProfilePro>(context, listen: false).role = Provider.of<ProfilePro>(context, listen: false).role == 1 ? 2 : 1;
                                    SharedPreferences.getInstance().then(
                                      (prefs) {
                                        prefs.clear();
                                        prefs.setString('userid', Provider.of<ProfilePro>(context, listen: false).userid.toString()).then(
                                          (value) {
                                            prefs.setString('role', Provider.of<ProfilePro>(context, listen: false).role.toString()).then(
                                              (value) {
                                                print("SHARED PREFERENCES SAVEDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDd");
                                                Provider.of<HomePro>(context, listen: false).clearAll();
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
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(RouteManager.width / 30),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(255, 89, 174, 253),
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  "Switch",
                                  style: TextStyle(
                                    fontSize: RouteManager.width / 16,
                                    color: Color.fromARGB(255, 89, 174, 253),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                      // return _reusableWidget.showPopup(_address, _addressData, (String newAddress){
                      //   setState((){
                      //     _address = newAddress;
                      //   });
                      // });
                    },
                  );
                },
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(RouteManager.width / 60),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromARGB(255, 33, 142, 243),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: RouteManager.width / 17,
                            child: Image.asset(
                              "images/switchuser.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            Provider.of<ProfilePro>(context).role == 1 ? "  Buyer" : "  Seller",
                            style: TextStyle(
                              fontSize: RouteManager.width / 24,
                              color: const Color.fromARGB(255, 33, 142, 243),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
            ],
          ),
          // backgroundColor: GlobalStyle.appBarBackgroundColor,
          // create search text field in the app bar
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[100]!,
                    width: 1.0,
                  ),
                ),
              ),
              padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
              height: kToolbarHeight,
              child: SizedBox(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) => Colors.grey[100]!,
                    ),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteManager.searchpage);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchRestaurantPage()));
                  },
                  child: Row(
                    children: [
                      // SizedBox(width: 8),
                      Icon(Icons.search, color: Colors.grey[500], size: RouteManager.width / 18),
                      SizedBox(width: 8),
                      Text(
                        'What are you looking for ?',
                        style: TextStyle(
                          fontSize: RouteManager.width / 27,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(RouteManager.width / 30),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.notifications,
                  color: const Color.fromARGB(255, 33, 142, 243),
                  size: RouteManager.width / 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(RouteManager.width / 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(RouteManager.profilepage);
                },
                child: Icon(
                  Icons.person,
                  color: const Color.fromARGB(255, 33, 142, 243),
                  size: RouteManager.width / 16,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: RouteManager.width / 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: const Color.fromARGB(255, 241, 237, 237),
                      ),
                    ),
                  ),
                  width: double.infinity,
                  height: RouteManager.width / 3.3,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        // color: Colors.yellow,
                        width: double.infinity,
                        height: RouteManager.width / 6.6,
                        child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, s) {
                            return Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: RouteManager.width / 17,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: RouteManager.width / 14,
                                        child: Image.asset(
                                          "images/appliances.png",
                                        ),
                                      ),
                                      Text(
                                        categories[s],
                                        style: TextStyle(
                                          // color: Color,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  s == categories.length - 1
                                      ? SizedBox()
                                      : SizedBox(
                                          width: RouteManager.width / 17,
                                        ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: RouteManager.width / 30,
                ),
                Provider.of<ProfilePro>(context).role == 1
                    ? Expanded(
                        flex: 8,
                        child: BuyerHome(),
                      )
                    : Expanded(
                        flex: 8,
                        child: SellerHome(),
                      ),
                // Expanded(
                //   flex: 7,
                //   child: Container(
                // height: RouteManager.height/1.8,
                // color: Colors.green,
                // child: BuyerHome(),

                // child: ListView.builder(
                //   itemCount: 9,
                //   itemBuilder: (context, index) {
                //     return Container(
                //       margin: EdgeInsets.fromLTRB(16, 14, 16, 14),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           CircleAvatar(
                //             radius: RouteManager.width / 14,
                //             // borderRadius: BorderRadius.all(Radius.circular(4)),
                //             // backgroundImage: Image.asset(RouteManager.dp!.path).image,
                //             // child: buildCacheNetworkImage(
                //             //   width: boxImageSize,
                //             //   height: boxImageSize,
                //             //   url: data[index].image,
                //             // ),
                //           ),
                //           SizedBox(
                //             width: RouteManager.width / 30,
                //           ),
                //           const Expanded(
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   "Muneeb Javed",
                //                   style: TextStyle(
                //                     fontSize: 15,
                //                     color: Colors.black,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                   maxLines: 1,
                //                   overflow: TextOverflow.ellipsis,
                //                 ),
                //                 SizedBox(height: 6),
                //                 Text(
                //                   "#THIS IS TAG",
                //                   style: TextStyle(
                //                     fontSize: 13,
                //                     color: Color(0xFFaaaaaa),
                //                   ),
                //                   maxLines: 1,
                //                   overflow: TextOverflow.ellipsis,
                //                 ),
                //                 SizedBox(height: 12),
                //                 Row(
                //                   children: [
                //                     Icon(Icons.star, color: Colors.orange, size: 15),
                //                     SizedBox(width: 2),
                //                     Text("THIS IS RATING",
                //                         style: TextStyle(
                //                           fontSize: 12,
                //                           color: Color(0xFF777777),
                //                         )),
                //                     SizedBox(width: 6),
                //                     Icon(Icons.location_pin, color: Color(0xFFe75f3f), size: 15),
                //                     SizedBox(width: 2),
                //                     Text("Distance here in" + ' miles',
                //                         style: TextStyle(
                //                           fontSize: 12,
                //                           color: Color(0xFF777777),
                //                         )),
                //                   ],
                //                 ),
                //                 SizedBox(height: 6),
                //                 Row(
                //                   children: [
                //                     Icon(Icons.local_offer_outlined, color: Color(0xFFe75f3f), size: 16),
                //                     SizedBox(width: 4),
                //                     Flexible(
                //                       child: Text(
                //                         "Description of what a buyer is looking for..........",
                //                         style: TextStyle(
                //                           fontSize: 12,
                //                           color: Color(0xFF777777),
                //                         ),
                //                         maxLines: 1,
                //                         overflow: TextOverflow.ellipsis,
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //                 // data[index].promo != ''
                //                 //     ?
                //                 //     : SizedBox.shrink(),
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //     );
                //   },
                // ),
                //   ),
                // ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            Provider.of<HomePro>(context).lowerloading
                ? Align(
                    alignment: Alignment(0, 0.8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.blue,
                      ),
                      padding: EdgeInsets.all(RouteManager.width / 60),
                      width: RouteManager.width / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: RouteManager.width / 20,
                            height: RouteManager.width / 20,
                            child: CircularProgressIndicator(
                              strokeWidth: RouteManager.width / 200,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "   Loading..",
                            style: TextStyle(
                              fontSize: RouteManager.width / 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
            Provider.of<ProfilePro>(context).role == 2
                ? const SizedBox()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // SizedBox(width: RouteManager.width / 15),
                          InkWell(
                            onTap: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (contextssdsd) {
                                  return StatefulBuilder(builder: (context, s) {
                                    return AlertDialog(
                                      title: Center(
                                        child: Text(
                                          "Create Request",
                                          style: TextStyle(
                                            fontSize: RouteManager.width / 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      elevation: 2000,
                                      content: Container(
                                        height: RouteManager.width / 1.4,
                                        child: Form(
                                          key: formkey1,
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: RouteManager.width / 1.2,
                                                child: TextFormField(
                                                  controller: title,
                                                  // obscureText: Provider.of<SignUpPro>(context).signinobscure,
                                                  decoration: InputDecoration(
                                                    // prefixIcon: const Icon(
                                                    //   Icons.TITL,
                                                    //   color: Colors.blue,
                                                    // ),
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                      borderSide: const BorderSide(
                                                        width: 2,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
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
                                                    hintText: "Enter Title",
                                                    hintStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.grey),
                                                    enabled: true,
                                                    contentPadding: EdgeInsets.symmetric(horizontal: RouteManager.width / 30, vertical: RouteManager.width / 30),
                                                    counterText: "",
                                                    labelText: "Title",
                                                    labelStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.blue),
                                                  ),
                                                  maxLength: 20,
                                                  style: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.black),
                                                  enableIMEPersonalizedLearning: true,
                                                  // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                                  onTapOutside: (pointerdownevent) {
                                                    print("AYAAAAAAAAAAAAAaa");
                                                  },
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Enter Title";
                                                    }
                                                    if (value.length < 6) {
                                                      return "Must have 6 Characters";
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                height: RouteManager.width / 15,
                                              ),
                                              SizedBox(
                                                width: RouteManager.width / 1.2,
                                                child: TextFormField(
                                                  controller: description,
                                                  minLines: 3,
                                                  maxLines: 4,
                                                  // obscureText: Provider.of<SignUpPro>(context).signinobscure,
                                                  decoration: InputDecoration(
                                                    // prefixIcon: const Icon(
                                                    //   Icons.person,
                                                    //   color: Colors.blue,
                                                    // ),
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(12),
                                                      borderSide: const BorderSide(
                                                        width: 2,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
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
                                                    hintText: "Enter Description",
                                                    hintStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.grey),
                                                    enabled: true,
                                                    contentPadding: EdgeInsets.symmetric(horizontal: RouteManager.width / 30, vertical: RouteManager.width / 30),
                                                    counterText: "",
                                                    labelText: "Description",
                                                    labelStyle: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.blue),
                                                  ),
                                                  // maxLength: 20,
                                                  style: TextStyle(fontFamily: 'Outfit', fontSize: RouteManager.width / 22, color: Colors.black),
                                                  // enableIMEPersonalizedLearning: true,
                                                  // maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Enter Description";
                                                    }
                                                    if (value.length < 6) {
                                                      return "Must have 6 Characters";
                                                    }
                                                    return null;
                                                  },
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
                                                    'Post',
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
                                                    API
                                                        .createPost(
                                                      Provider.of<ProfilePro>(context, listen: false).userid!,
                                                      title.text,
                                                      description.text,
                                                      "This is Category",
                                                      context,
                                                    )
                                                        .then((value) {
                                                      if (value) {
                                                        title.text = "";
                                                        description.text = "";
                                                        setState(() {});
                                                        Navigator.of(context, rootNavigator: true).pop();
                                                      }
                                                      Navigator.of(context, rootNavigator: true).pop();
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                                },
                              ).then((value) {
                                title.text = "";
                                description.text = "";
                              });
                            },
                            child: Container(
                              padding:EdgeInsets.all(RouteManager.width/80),
                              // height: RouteManager.width / 7,
                              // padding: EdgeInsets.all(RouteManager.width / 50),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(RouteManager.width / 20),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.add_box_outlined,
                                    color: Colors.white,
                                    size: RouteManager.width / 12,
                                  ),
                                  Text(
                                    "Add Request",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:RouteManager.width/150),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
