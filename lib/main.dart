import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/apiServices/generalApiCall.dart';
import 'package:news_app/views/detailPage.dart';
import 'package:news_app/views/landing_homepage.dart';
import 'apiServices/topHeadlineApiCall.dart';

final topHeadLineprovider = Provider((ref) => topHeadLineApiCAll());
final headlineData =
    FutureProvider((ref) => ref.read(topHeadLineprovider).getApi());

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingHomeScreen(),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:ionicons/ionicons.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       title: 'Bottom Navigation Bar',
//       home: HomePage(),
//     ),
//   );
// }

