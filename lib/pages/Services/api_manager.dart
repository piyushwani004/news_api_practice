import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api_practice/pages/Constant/constant.dart';
import 'package:news_api_practice/pages/Models/NewsModel.dart';

class APIManager {
  Future<NewsModel> getnews() async {
    var newsModel;
    try {
      var client = http.Client();
      var responce = await client.get(Constant.url);
      if (responce.statusCode == 200) {
        var jsonString = responce.body;
        var jsonMap = jsonDecode(jsonString);
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (e) {
      return newsModel;
    }
    return newsModel;
  }
}
