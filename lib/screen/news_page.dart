import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
              height: MediaQuery.of(context).size.height * 1.1,
              decoration: stylePageBackground(context),
              // padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                mainAxisAlignment: !isMobile(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.center,
                crossAxisAlignment: !isMobile(context)
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/images/tassvg.svg",
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                      ),
                      Text('Новосты', style: styleTitle(context)),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 5),
                        itemCount: listnewsitem.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white.withOpacity(0.5),
                              surfaceTintColor: Colors.white,
                              elevation: 4,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      'https://admin.tascom.uz:8083/api/download/news/${listnewsitem[index].imagepath}',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 300,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            listnewsitem[index].title!,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            listnewsitem[index].description!,
                                            textAlign: TextAlign.justify,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
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
