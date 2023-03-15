import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasuz_web/models/producers/ModelSet.dart';
import 'package:tasuz_web/models/producers/Section.dart';
import '../models/catalog_service_item.dart';
import '../models/news_item.dart';
import '../models/producers/OptionSet.dart';
import '../models/producers/Producer.dart';
import '../service/apiconnect.dart';

class Controller extends GetxController {
  final ScrollController homeController = ScrollController();

  var listProducer = <Producer>[].obs;
  var listNewsItem = <NewsItem>[].obs;
  var listSection = <Section>[].obs;
  var listModelSet = <ModelSet>[].obs;
  var listOptionSet = <OptionSet>[].obs;

  ModelSet? modelSet;
  OptionSet? optionSet;

  final ApiConnector _apiConnector = ApiConnector();

  RxBool changeLocal = false.obs;

  @override
  void onInit() {
    super.onInit();
    homeController;
    fetchNews();
    fetchProducer();
    changeModelSet;
    changeOptionSet;
    changeLocale();
  }

  changeLocale() {
    changeLocal.toggle();
  }

  changeModelSet(ModelSet modelSet) {
    this.modelSet = modelSet;
  }

  changeOptionSet(OptionSet optionSet) {
    this.optionSet = optionSet;
  }

  fetchProducer() async {
    listProducer.value = await _apiConnector.getProducer();
  }

  fetchNews() async {
    listNewsItem.value = await _apiConnector.getNews();
  }
}
