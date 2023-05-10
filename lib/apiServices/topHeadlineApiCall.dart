import 'package:http/http.dart';

import '../models/api_model.dart';

class topHeadLineApiCAll {
  Future<ApiModel> getApi() async {
    Response response = await get(Uri.parse(
        'https://gnews.io/api/v4/top-headlines?category=general&lang=en&country=in&max=10&apikey=747e3f25fe5441945a17dcb5a89a5a85'));
    try {
      if (response.statusCode == 200) {
        final result = apiModelFromJson(response.body);
        return result;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
