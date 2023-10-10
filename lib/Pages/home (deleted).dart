import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart' as ft;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import '../Api & Routes/routes.dart';

class HomeDeleted extends StatefulWidget {
  const HomeDeleted({super.key});

  @override
  State<HomeDeleted> createState() => _HomeDeletedState();
}

class _HomeDeletedState extends State<HomeDeleted> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Center(
              child: Text(
                "Home",
                style: TextStyle(
                  fontSize: RouteManager.width / 15,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: RouteManager.width / 6,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 14, 16, 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: RouteManager.width / 14,
                        // borderRadius: BorderRadius.all(Radius.circular(4)),
                        // backgroundImage: Image.asset(RouteManager.dp!.path).image,
                        // child: buildCacheNetworkImage(
                        //   width: boxImageSize,
                        //   height: boxImageSize,
                        //   url: data[index].image,
                        // ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Muneeb Javed",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 6),
                            Text(
                              "#THIS IS TAG",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFFaaaaaa),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange, size: 15),
                                SizedBox(width: 2),
                                Text("THIS IS RATING",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    )),
                                SizedBox(width: 6),
                                Icon(Icons.location_pin, color: Color(0xFFe75f3f), size: 15),
                                SizedBox(width: 2),
                                Text("Distance here in" + ' miles',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    )),
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.local_offer_outlined, color: Color(0xFFe75f3f), size: 16),
                                SizedBox(width: 4),
                                Flexible(
                                  child: Text(
                                    "Description of what a buyer is looking for..........",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            // data[index].promo != ''
                            //     ?
                            //     : SizedBox.shrink(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: RouteManager.width / 6,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 14, 16, 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: RouteManager.width / 14,
                        // borderRadius: BorderRadius.all(Radius.circular(4)),
                        // backgroundImage: Image.asset(RouteManager.dp!.path).image,
                        // child: buildCacheNetworkImage(
                        //   width: boxImageSize,
                        //   height: boxImageSize,
                        //   url: data[index].image,
                        // ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Muneeb Javed",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 6),
                            Text(
                              "#THIS IS TAG",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFFaaaaaa),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange, size: 15),
                                SizedBox(width: 2),
                                Text("THIS IS RATING",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    )),
                                SizedBox(width: 6),
                                Icon(Icons.location_pin, color: Color(0xFFe75f3f), size: 15),
                                SizedBox(width: 2),
                                Text("Distance here in" + ' miles',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    )),
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.local_offer_outlined, color: Color(0xFFe75f3f), size: 16),
                                SizedBox(width: 4),
                                Flexible(
                                  child: Text(
                                    "Description of what a buyer is looking for..........",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            // data[index].promo != ''
                            //     ?
                            //     : SizedBox.shrink(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: RouteManager.width / 6,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 14, 16, 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: RouteManager.width / 14,
                        // borderRadius: BorderRadius.all(Radius.circular(4)),
                        // backgroundImage: Image.asset(RouteManager.dp!.path).image,
                        // child: buildCacheNetworkImage(
                        //   width: boxImageSize,
                        //   height: boxImageSize,
                        //   url: data[index].image,
                        // ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Muneeb Javed",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 6),
                            Text(
                              "#THIS IS TAG",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFFaaaaaa),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange, size: 15),
                                SizedBox(width: 2),
                                Text("THIS IS RATING",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    )),
                                SizedBox(width: 6),
                                Icon(Icons.location_pin, color: Color(0xFFe75f3f), size: 15),
                                SizedBox(width: 2),
                                Text("Distance here in" + ' miles',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    )),
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.local_offer_outlined, color: Color(0xFFe75f3f), size: 16),
                                SizedBox(width: 4),
                                Flexible(
                                  child: Text(
                                    "Description of what a buyer is looking for..........",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            // data[index].promo != ''
                            //     ?
                            //     : SizedBox.shrink(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: RouteManager.width / 6,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 14, 16, 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: RouteManager.width / 14,
                        // borderRadius: BorderRadius.all(Radius.circular(4)),
                        // backgroundImage: Image.asset(RouteManager.dp!.path).image,
                        // child: buildCacheNetworkImage(
                        //   width: boxImageSize,
                        //   height: boxImageSize,
                        //   url: data[index].image,
                        // ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Muneeb Javed",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 6),
                            Text(
                              "#THIS IS TAG",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFFaaaaaa),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange, size: 15),
                                SizedBox(width: 2),
                                Text("THIS IS RATING",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    )),
                                SizedBox(width: 6),
                                Icon(Icons.location_pin, color: Color(0xFFe75f3f), size: 15),
                                SizedBox(width: 2),
                                Text("Distance here in" + ' miles',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    )),
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.local_offer_outlined, color: Color(0xFFe75f3f), size: 16),
                                SizedBox(width: 4),
                                Flexible(
                                  child: Text(
                                    "Description of what a buyer is looking for..........",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            // data[index].promo != ''
                            //     ?
                            //     : SizedBox.shrink(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: RouteManager.width / 6,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 14, 16, 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: RouteManager.width / 14,
                        // borderRadius: BorderRadius.all(Radius.circular(4)),
                        // backgroundImage: Image.asset(RouteManager.dp!.path).image,
                        // child: buildCacheNetworkImage(
                        //   width: boxImageSize,
                        //   height: boxImageSize,
                        //   url: data[index].image,
                        // ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Muneeb Javed",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 6),
                            Text(
                              "#THIS IS TAG",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFFaaaaaa),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange, size: 15),
                                SizedBox(width: 2),
                                Text("THIS IS RATING",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    )),
                                SizedBox(width: 6),
                                Icon(Icons.location_pin, color: Color(0xFFe75f3f), size: 15),
                                SizedBox(width: 2),
                                Text("Distance here in" + ' miles',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    )),
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.local_offer_outlined, color: Color(0xFFe75f3f), size: 16),
                                SizedBox(width: 4),
                                Flexible(
                                  child: Text(
                                    "Description of what a buyer is looking for..........",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            // data[index].promo != ''
                            //     ?
                            //     : SizedBox.shrink(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: RouteManager.width / 6,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(16, 14, 16, 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: RouteManager.width / 14,
                        // borderRadius: BorderRadius.all(Radius.circular(4)),
                        // backgroundImage: Image.asset(RouteManager.dp!.path).image,
                        // child: buildCacheNetworkImage(
                        //   width: boxImageSize,
                        //   height: boxImageSize,
                        //   url: data[index].image,
                        // ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Muneeb Javed",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 6),
                            Text(
                              "#THIS IS TAG",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFFaaaaaa),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.orange, size: 15),
                                SizedBox(width: 2),
                                Text("THIS IS RATING",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    )),
                                SizedBox(width: 6),
                                Icon(Icons.location_pin, color: Color(0xFFe75f3f), size: 15),
                                SizedBox(width: 2),
                                Text("Distance here in" + ' miles',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    )),
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.local_offer_outlined, color: Color(0xFFe75f3f), size: 16),
                                SizedBox(width: 4),
                                Flexible(
                                  child: Text(
                                    "Description of what a buyer is looking for..........",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF777777),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            // data[index].promo != ''
                            //     ?
                            //     : SizedBox.shrink(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
