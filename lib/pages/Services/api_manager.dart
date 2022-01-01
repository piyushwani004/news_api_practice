import 'package:http/http.dart' as http;
import 'package:news_api_practice/pages/Constant/constant.dart';

class APIManager {
  void getnews() async {
    var client = http.Client();
    var responce = await client.get(Constant.url);
    if (responce.statusCode == 200) {
      var jsonString = responce.body;
    }
  }
}
