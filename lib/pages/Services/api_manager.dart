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
        print("getnews jsonMap $jsonMap");
        newsModel = NewsModel.fromJson(jsonMap);
        print("APIManager :_newsModel:: ${newsModel.toString()}");
      }
    } catch (e) {
      print(e);
      return newsModel;
    }
    return newsModel;
  }
}
