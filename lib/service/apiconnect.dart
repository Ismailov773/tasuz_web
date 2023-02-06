import 'package:get/get_connect/connect.dart';
import '../models/news_item.dart';
import '../models/producers/Producer.dart';
import 'api.dart';

class ApiConnector extends GetConnect{

  Api api = Api();

  Future<List<Producer>> getProducer() async {
    List<Producer> listProducer  = await api.getProducer();

    return listProducer;
  }

  Future<List<NewsItem>> getNews() async {
    List<NewsItem> listNews  = await api.getNews();

    return listNews;
  }




}