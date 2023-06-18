
import 'package:hive/hive.dart';
part 'bookmarkData_model.g.dart';

@HiveType(typeId: 1)
class BookmarkDataModel extends HiveObject {
  @HiveField(0)
  String? Imageurl;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? content;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? url;

  BookmarkDataModel({
    required this.Imageurl,
    required this.title,
    required this.content,
    required this.description,
    required this.url
  });
}