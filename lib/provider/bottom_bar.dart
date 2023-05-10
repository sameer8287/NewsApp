import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomBar extends ChangeNotifier{
  // int indexProvider = StateProvider((ref) => 0);

  set setIndex(int indx)
  {
    // ref.read(indexProvider.state).state = indx;
    // indexProvider =indx as StateProvider<int>;
  }
}

final bottmBar = ChangeNotifierProvider<BottomBar>((ref) => BottomBar());