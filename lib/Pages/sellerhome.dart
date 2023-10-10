import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Api & Routes/API.dart';
import '../Api & Routes/routes.dart';
import '../Providers/homepro.dart';
import '../Providers/profilepro.dart';

class SellerHome extends StatefulWidget {
  @override
  _SellerHomeState createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  final scrollcontroller = ScrollController();
  @override
  void initState() {
    super.initState();
    scrollcontroller.addListener(() {
      if (scrollcontroller.position.pixels == scrollcontroller.position.maxScrollExtent) {
        print("AYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaa");
        if (!Provider.of<HomePro>(context, listen: false).lowerloading) {
          print("ShOW MORE CALLEDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDdd");
          Provider.of<HomePro>(context, listen: false).lowerloading = true;
          Provider.of<HomePro>(context, listen: false).notifyListenerz();
          int beforelength = Provider.of<HomePro>(context, listen: false).sellerreqs.length;
          API
              .getFeed(Provider.of<ProfilePro>(context, listen: false).userid!, Provider.of<ProfilePro>(context, listen: false).role, Provider.of<HomePro>(context, listen: false).limit, context)
              .then((value) {
            if (value) {
              if (beforelength != Provider.of<HomePro>(context, listen: false).sellerreqs.length) {
                Provider.of<HomePro>(context, listen: false).limit++;
              }

              Provider.of<HomePro>(context, listen: false).mainloading = !Provider.of<HomePro>(context, listen: false).mainloading;
            }
            Provider.of<HomePro>(context, listen: false).lowerloading = false;
            Provider.of<HomePro>(context, listen: false).notifyListenerz();
          });
        }
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getMyFeed();
    });
  }

  getMyFeed() async {
    while (true) {
      var value =
          await API.getFeed(Provider.of<ProfilePro>(context, listen: false).userid!, Provider.of<ProfilePro>(context, listen: false).role, Provider.of<HomePro>(context, listen: false).limit, context);
      if (value) {
        if (Provider.of<HomePro>(context, listen: false).sellerreqs.isNotEmpty) {
          Provider.of<HomePro>(context, listen: false).limit++;
        }
        Provider.of<HomePro>(context, listen: false).mainloading = !Provider.of<HomePro>(context, listen: false).mainloading;
        Provider.of<HomePro>(context, listen: false).showloading = false;
        Provider.of<HomePro>(context, listen: false).notifyListenerz();
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Provider.of<HomePro>(context).showloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              backgroundColor: Colors.white,
              onRefresh: () async {
                if (!Provider.of<HomePro>(context, listen: false).upperloading) {
                  while (true) {
                    print("RELOAD CALLEDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDdd------------------------------------");
                    Provider.of<HomePro>(context, listen: false).limit = 1;
                    Provider.of<HomePro>(context, listen: false).upperloading = true;
                    Provider.of<HomePro>(context, listen: false).showloading = true;
                    Provider.of<HomePro>(context, listen: false).notifyListenerz();
                    var value = await API.getFeed(
                        Provider.of<ProfilePro>(context, listen: false).userid!, Provider.of<ProfilePro>(context, listen: false).role, Provider.of<HomePro>(context, listen: false).limit, context);
                    if (value) {
                      if (Provider.of<HomePro>(context, listen: false).sellerreqs.isNotEmpty) {
                        Provider.of<HomePro>(context, listen: false).limit++;
                      }
                      Provider.of<HomePro>(context, listen: false).mainloading = !Provider.of<HomePro>(context, listen: false).mainloading;
                      Provider.of<HomePro>(context, listen: false).upperloading = false;
                      Provider.of<HomePro>(context, listen: false).showloading = false;
                      Provider.of<HomePro>(context, listen: false).notifyListenerz();
                      break;
                    }
                  }
                }
              },
              child: Provider.of<HomePro>(context).sellerreqs.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No Posts Found 😔",
                          style: TextStyle(
                            fontSize: RouteManager.width / 22,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: RouteManager.width / 30,
                        ),
                        InkWell(
                          onTap: () async {
                            while (true) {
                              print("RELOAD CALLEDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDdd");
                              Provider.of<HomePro>(context, listen: false).limit = 1;
                              Provider.of<HomePro>(context, listen: false).upperloading = true;
                              Provider.of<HomePro>(context, listen: false).showloading = true;
                              Provider.of<HomePro>(context, listen: false).notifyListenerz();
                              var value = await API.getFeed(Provider.of<ProfilePro>(context, listen: false).userid!, Provider.of<ProfilePro>(context, listen: false).role,
                                  Provider.of<HomePro>(context, listen: false).limit, context);
                              if (value) {
                                if (Provider.of<HomePro>(context, listen: false).sellerreqs.isNotEmpty) {
                                  Provider.of<HomePro>(context, listen: false).limit++;
                                }
                                Provider.of<HomePro>(context, listen: false).mainloading = !Provider.of<HomePro>(context, listen: false).mainloading;
                                Provider.of<HomePro>(context, listen: false).upperloading = false;
                                Provider.of<HomePro>(context, listen: false).showloading = false;
                                Provider.of<HomePro>(context, listen: false).notifyListenerz();
                                break;
                              }
                            }
                          },
                          child: Text(
                            "Tap Here to Refresh",
                            style: TextStyle(
                              fontSize: RouteManager.width / 22,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    )
                  : ListView.builder(
                      controller: scrollcontroller,
                      physics: const BouncingScrollPhysics(),
                      itemCount: Provider.of<HomePro>(context).sellerreqs.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(RouteManager.width / 50),
                              color: const Color.fromARGB(255, 243, 237, 237),
                              margin: EdgeInsets.fromLTRB(16, 14, 16, 14),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: RouteManager.width / 14,
                                    // borderRadius: BorderRadius.all(Radius.circular(4)),
                                    backgroundImage: Provider.of<HomePro>(context, listen: false).sellerreqs[index].dp == ""
                                        ? null
                                        : NetworkImage(API.imageip + Provider.of<HomePro>(context, listen: false).sellerreqs[index].dp!),
                                    // child: buildCacheNetworkImage(
                                    //   width: boxImageSize,
                                    //   height: boxImageSize,
                                    //   url: data[index].image,
                                    // ),
                                  ),
                                  SizedBox(
                                    width: RouteManager.width / 30,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Provider.of<HomePro>(context, listen: false).sellerreqs[index].title,
                                          style: TextStyle(
                                            fontSize: RouteManager.width / 24,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: RouteManager.width / 30),
                                        // Text(
                                        //   "#THIS IS TAG",
                                        //   style: TextStyle(
                                        //     fontSize: 13,
                                        //     color: Color(0xFFaaaaaa),
                                        //   ),
                                        //   maxLines: 1,
                                        //   overflow: TextOverflow.ellipsis,
                                        // ),
                                        // SizedBox(height: 12),
                                        // Row(
                                        //   children: [
                                        //     Icon(Icons.star, color: Colors.orange, size: 15),
                                        //     SizedBox(width: 2),
                                        //     Text("THIS IS RATING",
                                        //         style: TextStyle(
                                        //           fontSize: 12,
                                        //           color: Color(0xFF777777),
                                        //         )),
                                        //     SizedBox(width: 6),
                                        //     Icon(Icons.location_pin, color: Color(0xFFe75f3f), size: 15),
                                        //     SizedBox(width: 2),
                                        //     Text("Distance here in" + ' miles',
                                        //         style: TextStyle(
                                        //           fontSize: 12,
                                        //           color: Color(0xFF777777),
                                        //         )),
                                        //   ],
                                        // ),
                                        // SizedBox(height: 6),
                                        Row(
                                          children: [
                                            Icon(Icons.local_offer_outlined, color: Color(0xFFe75f3f), size: 16),
                                            SizedBox(width: RouteManager.width / 60),
                                            Flexible(
                                              child: Text(
                                                Provider.of<HomePro>(context, listen: false).sellerreqs[index].description,
                                                style: TextStyle(
                                                  fontSize: RouteManager.width / 33,
                                                  color: Color.fromARGB(255, 88, 88, 88),
                                                ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: RouteManager.width / 30,
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(255, 236, 181, 28),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            "Bid Now",
                                            style: TextStyle(
                                              fontSize: RouteManager.width / 28,
                                            ),
                                          ),
                                        ),
                                        // data[index].promo != ''
                                        //     ?
                                        //     : SizedBox.shrink(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Opacity(
                              opacity: 0.2,
                              child: Container(
                                height: RouteManager.width / 120,
                                width: RouteManager.width / 1.2,
                                color: const Color.fromARGB(255, 133, 131, 131),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
    );
  }
}
