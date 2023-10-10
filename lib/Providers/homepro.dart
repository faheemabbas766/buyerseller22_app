import 'package:flutter/cupertino.dart';
import 'dart:io';

import '../Entities/buyerrequest.dart';
import '../Entities/sellerrequest.dart';

class HomePro with ChangeNotifier {
  // final GlobalKey<AnimatedListState> buyerkey = GlobalKey();
  // final GlobalKey<AnimatedListState> sellerkey = GlobalKey();
  int limit = 1;
  bool upperloading = false;
  bool mainloading = false;
  bool showloading = true;
  bool lowerloading = false;
  List<BuyerRequest> buyerreqs = [];
  List<SellerRequest> sellerreqs =[];
  clearAll() {
    limit = 1;
    upperloading = false;
    mainloading = false;
    showloading = true;
    lowerloading = false;
    buyerreqs=[];
    sellerreqs=[];
  }

  notifyListenerz() {
    notifyListeners();
  }
}
