import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomProvidr extends ChangeNotifier {
  int _pageIndex = 0;

  // var btmIndex = StateProvider<int>((ref) => 0);
  int get pageIndex => _pageIndex;
  set pageIndex(int indx) {
    _pageIndex = indx;
    notifyListeners();
  }
}

// var indexProvider = StateProvider<int>((ref) => 0);
//
final bottmBar =
    ChangeNotifierProvider<BottomProvidr>((ref) => BottomProvidr());
