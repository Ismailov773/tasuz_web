import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/news_item.dart';
import '../models/producers/Producer.dart';

class Api {
  Uri url = Uri.parse("https://admin.tascom.uz:8083/api/producerget");
  Uri url2 = Uri.parse("https://admin.tascom.uz:8083/api/newsget");

  Future<List<Producer>> getProducer() async {
    final response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
      List<Producer> list = json.map((e) => Producer.fromJson(e)).toList();

      return list;
    } else
      (Exception e) {
        return Exception(e);
      };

    return [];
  }

  Future<List<NewsItem>> getNews() async {
    final response = await http.get(url2);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
      List<NewsItem> list2 = json.map((e) => NewsItem.fromJson(e)).toList();

      return list2;
    } else
      (Exception e) {
        return Exception(e);
      };

    return [];
  }
}
