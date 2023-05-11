import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:news_app/models/generalModel.dart';

class WorldApi{

  Future<GeneralModel>getWorldData() async
  {
    Response response = await get(Uri.parse('https://newsapi.org/v2/everything?q=keyword&apiKey=a17d68f035fd4ae58f6fe6d26d0ad168'));
    try{
      if(response.statusCode ==200)
      {
        var result =  generalModelFromJson(response.body);
        return result;
      }
      else
      {
        throw Exception(response.statusCode );
      }
    }
    catch(e)
    {
      throw Exception(e.toString());
    }
    
  }
}

final worldApiNewsData = Provider<WorldApi>((ref) => WorldApi());