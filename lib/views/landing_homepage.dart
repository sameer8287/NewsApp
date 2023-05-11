import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/views/bottomNavScreens/bookmark.dart';
import 'package:news_app/views/bottomNavScreens/home_screen.dart';
import 'package:news_app/views/bottomNavScreens/userprofile.dart';
import 'package:news_app/views/bottomNavScreens/worldwide.dart';
import 'package:news_app/components/bottom_nav_bar.dart';

import '../provider/bottom_bar.dart';

class LandingHomeScreen extends ConsumerWidget {
  LandingHomeScreen({super.key});
  List<Widget> lst = [
    HomeScreen(),
    WordWidePage(),
    BookMarkScreen(),
    UserProfileScreen()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idx = ref.watch(bottmBar);
    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'News App',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            splashRadius: 25,
            splashColor: Colors.grey,
            icon: Icon(Icons.menu),
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 28,
                )),
            SizedBox(
              width: displayWidth * 0.01,
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: lst[idx.pageIndex],
        bottomNavigationBar: BottomNavBar(
            displayWidth: displayWidth,
            idx: idx,
            listOfStrings: listOfStrings,
            listOfIcons: listOfIcons));
  }

  List<IconData> listOfIcons = [
    Icons.home,
    Ionicons.planet,
    Ionicons.bookmark_outline,
    Icons.account_circle,
  ];

  List<String> listOfStrings = [
    'Home',
    'World',
    'Bookmark',
    'Account',
  ];
}
