
import 'package:hive/hive.dart';
import 'package:news_app/models/bookmarkData_model.dart';

class Boxes{
  static Box<BookmarkDataModel> getData() => Hive.box<BookmarkDataModel>('news');
}