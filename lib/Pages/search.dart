import 'dart:async';
import 'package:buyerseller/Api%20&%20Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _etSearch = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            iconTheme: IconThemeData(
                // color: GlobalStyle.appBarIconThemeColor,
                ),
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            centerTitle: true,
            titleSpacing: 0.0,
            backgroundColor: Colors.white,
            elevation: 0,
            // create search text field in the app bar
            title: Container(
              margin: EdgeInsets.only(right: RouteManager.width/26,),
              height: kToolbarHeight - 16,
              child: TextField(
                controller: _etSearch,
                autofocus: true,
                textInputAction: TextInputAction.search,
                onChanged: (textValue) {
                  setState(() {});
                },
                onTap: () {
                  setState(() {
                    // _loadData = false;
                  });
                },
                onSubmitted: (textValue) {
                  if (textValue != '') {
                    // _getRestaurantData();
                  }
                },
                maxLines: 1,
                style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[500],
                    size: RouteManager.width / 17,
                  ),
                  suffixIcon: (_etSearch.text == '')
                      ? null
                      : GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                _etSearch = TextEditingController(text: '');
                              },
                            );
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.grey[500],
                            size: 18,
                          ),
                        ),
                  contentPadding: EdgeInsets.all(0),
                  isDense: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  hintText: 'Find Items',
                  hintStyle: TextStyle(fontSize: RouteManager.width / 28, color: Colors.grey[500]),
                ),
              ),
            )),
        body: WillPopScope(
          onWillPop: () {
            Navigator.pop(context);
            FocusScope.of(context).unfocus();
            return Future.value(true);
          },
          // if search field is empty, show history search
          // if search field not empty, show search text
          child: Text(""),
        ),
      ),
    );
  }
}
