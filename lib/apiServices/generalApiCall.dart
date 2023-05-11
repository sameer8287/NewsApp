import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:http/http.dart';
import 'package:news_app/models/generalModel.dart';

class GeneralApiCall {
  // String ?CategoryType;
  // GeneralApiCall({
  // required this.CategoryType
  // });
  Future<GeneralModel> GeneralNews(String? category) async {
    Response response = await get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=a17d68f035fd4ae58f6fe6d26d0ad168'));
    try {
      if (response.statusCode == 200) {
        var result = generalModelFromJson(response.body);
        print(result.toString());
        return result;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      log(num.parse(e.toString()));
      throw Exception(e.toString());
    }
  }

  
}

final generalApi = Provider<GeneralApiCall>((ref) => GeneralApiCall());
