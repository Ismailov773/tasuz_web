import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasuz_web/controller/controller.dart';
import '../components/constants.dart';
import '../components/responsive.dart';
import '../models/news_item.dart';
import '../service/apiconnect.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final ApiConnector _apiConnector = ApiConnector();
  final Controller _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsItem>>(
        future: _apiConnector.getNews(),
        builder:
            (BuildContext context, AsyncSnapshot<List<NewsItem>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<NewsItem> listnewsitem = snapshot.data!;
            return Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              decoration: stylePageBackground(context),
              // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/images/tassvg.svg",
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                      Obx(() => Text(
                          _controller.changeLocal.isFalse
                              ? "Yangiliklar"
                              : 'Новосты',
                          style: styleTitle(context))),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 5),
                        itemCount: listnewsitem.length,
                        itemBuilder: (context, index) {
                          return Card(
                              color: Colors.white.withOpacity(0.8),
                              surfaceTintColor: Colors.white,
                              elevation: 4,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Image.network(
                                        'https://admin.tascom.uz:8083/api/download/news/${listnewsitem[index].imagepath}',

                                      ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      // height: MediaQuery.of(context).size.height/2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Obx(() => Text(
                                                _controller.changeLocal.isFalse
                                                    ? listnewsitem[index]
                                                        .titleuz!
                                                    : listnewsitem[index]
                                                        .title!,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Obx(() => Text(
                                                _controller.changeLocal.isFalse
                                                    ? listnewsitem[index]
                                                        .descriptionuz!
                                                    : listnewsitem[index]
                                                        .description!,
                                                textAlign: TextAlign.justify,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Divider(),
                                          Text(listnewsitem[index].date!),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ));
                        },
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        });
  }
}
