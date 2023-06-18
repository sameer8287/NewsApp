import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:news_app/apiServices/generalApiCall.dart';
import 'package:news_app/models/bookmarkData_model.dart';
import 'package:news_app/views/detailPage.dart';
import 'package:news_app/views/landing_homepage.dart';
import 'package:path_provider/path_provider.dart';
import 'apiServices/topHeadlineApiCall.dart';

final topHeadLineprovider = Provider((ref) => topHeadLineApiCAll());
final headlineData =
    FutureProvider((ref) => ref.read(topHeadLineprovider).getApi());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  Hive.registerAdapter(BookmarkDataModelAdapter());
  await Hive.openBox<BookmarkDataModel>('news');
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
      builder: EasyLoading.init(),
    );
  }
}
// flutter packagespub run build_runner build

