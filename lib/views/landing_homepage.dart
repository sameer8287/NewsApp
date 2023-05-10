import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/views/bottomNavScreens/bookmark.dart';
import 'package:news_app/views/bottomNavScreens/home_screen.dart';
import 'package:news_app/views/bottomNavScreens/userprofile.dart';
import 'package:news_app/views/bottomNavScreens/worldwide.dart';

import '../provider/bottom_bar.dart';

var indexProvider = StateProvider<int>((ref) => 0);
class LandingHomeScreen extends ConsumerWidget {
   LandingHomeScreen({super.key});
  List<Widget> lst = [
    HomeScreen(),
    WorldWide(),
    BookMarkScreen(),
    UserProfileScreen()
  ];

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
              icon: Icon(
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
      body: lst[ref.watch(indexProvider)],
      bottomNavigationBar:  Container(
            margin: EdgeInsets.all(displayWidth * .05),
            height: displayWidth * .155,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
              borderRadius: BorderRadius.circular(50),
            ),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                ref.read(indexProvider.state).state = index;
                  
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == ref.watch(indexProvider)
                          ? displayWidth * .32
                          : displayWidth * .18,
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: index == ref.watch(indexProvider) ? displayWidth * .12 : 0,
                        width: index == ref.watch(indexProvider) ? displayWidth * .32 : 0,
                        decoration: BoxDecoration(
                          color: index == ref.watch(indexProvider)
                              ? Colors.black
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == ref.watch(indexProvider)
                          ? displayWidth * .31
                          : displayWidth * .18,
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width: index == ref.watch(indexProvider)
                                    ? displayWidth * .13
                                    : 0,
                              ),
                              AnimatedOpacity(
                                opacity: index == ref.watch(indexProvider) ? 1 : 0,
                                duration: Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: Text(
                                  index == ref.watch(indexProvider)
                                      ? '${listOfStrings[index]}'
                                      : '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              AnimatedContainer(
                                duration: Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                width: index == ref.watch(indexProvider)
                                    ? displayWidth * .03
                                    : 20,
                              ),
                              Icon(
                                listOfIcons[index],
                                size: displayWidth * .076,
                                color: index == ref.watch(indexProvider)
                                    ? Colors.white
                                    : Colors.black26,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
    );
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
// var currentIndex = 0;
//   List<Widget> lst = [
//     HomeScreen(),
//     WorldWide(),
//     BookMarkScreen(),
//     UserProfileScreen()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     double displayWidth = MediaQuery.of(context).size.width;
//     double displayHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'News App',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {},
//           splashRadius: 25,
//           splashColor: Colors.grey,
//           icon: Icon(Icons.menu),
//           color: Colors.black,
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.search,
//               color: Colors.black,
//               size: 30,
//             ),
//           ),
//           IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.notifications,
//                 color: Colors.black,
//                 size: 28,
//               )),
//           SizedBox(
//             width: displayWidth * 0.01,
//           )
//         ],
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: lst[currentIndex],
//       bottomNavigationBar:  Container(
//             margin: EdgeInsets.all(displayWidth * .05),
//             height: displayWidth * .155,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(.2),
//                   blurRadius: 30,
//                   offset: const Offset(0, 10),
//                 ),
//               ],
//               borderRadius: BorderRadius.circular(50),
//             ),
//             child: ListView.builder(
//               itemCount: 4,
//               scrollDirection: Axis.horizontal,
//               padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
//               itemBuilder: (context, index) => InkWell(
//                 onTap: () {
                  
                  
//                 },
//                 splashColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 child: Stack(
//                   children: [
//                     AnimatedContainer(
//                       duration: Duration(seconds: 1),
//                       curve: Curves.fastLinearToSlowEaseIn,
//                       width: index == currentIndex
//                           ? displayWidth * .32
//                           : displayWidth * .18,
//                       alignment: Alignment.center,
//                       child: AnimatedContainer(
//                         duration: Duration(seconds: 1),
//                         curve: Curves.fastLinearToSlowEaseIn,
//                         height: index == currentIndex ? displayWidth * .12 : 0,
//                         width: index == currentIndex ? displayWidth * .32 : 0,
//                         decoration: BoxDecoration(
//                           color: index == currentIndex
//                               ? Colors.black
//                               : Colors.transparent,
//                           borderRadius: BorderRadius.circular(50),
//                         ),
//                       ),
//                     ),
//                     AnimatedContainer(
//                       duration: Duration(seconds: 1),
//                       curve: Curves.fastLinearToSlowEaseIn,
//                       width: index == currentIndex
//                           ? displayWidth * .31
//                           : displayWidth * .18,
//                       alignment: Alignment.center,
//                       child: Stack(
//                         children: [
//                           Row(
//                             children: [
//                               AnimatedContainer(
//                                 duration: Duration(seconds: 1),
//                                 curve: Curves.fastLinearToSlowEaseIn,
//                                 width: index == currentIndex
//                                     ? displayWidth * .13
//                                     : 0,
//                               ),
//                               AnimatedOpacity(
//                                 opacity: index == currentIndex ? 1 : 0,
//                                 duration: Duration(seconds: 1),
//                                 curve: Curves.fastLinearToSlowEaseIn,
//                                 child: Text(
//                                   index == currentIndex
//                                       ? '${listOfStrings[index]}'
//                                       : '',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 15,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               AnimatedContainer(
//                                 duration: Duration(seconds: 1),
//                                 curve: Curves.fastLinearToSlowEaseIn,
//                                 width: index == currentIndex
//                                     ? displayWidth * .03
//                                     : 20,
//                               ),
//                               Icon(
//                                 listOfIcons[index],
//                                 size: displayWidth * .076,
//                                 color: index == currentIndex
//                                     ? Colors.white
//                                     : Colors.black26,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )
//     );
//   }

//   List<IconData> listOfIcons = [
//     Icons.home,
//     Ionicons.planet,
//     Ionicons.bookmark_outline,
//     Icons.account_circle,
//   ];

//   List<String> listOfStrings = [
//     'Home',
//     'World',
//     'Bookmark',
//     'Account',
//   ];




  
  
  