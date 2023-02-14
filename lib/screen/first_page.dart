import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tasuz_web/controller/controller.dart';
import '../components/constants.dart';
import '../components/responsive.dart';

final List<String> imgList = [
  'assets/images/background.jpeg',
  'assets/images/background2.jpeg',
  'assets/images/background3.jpeg',
  'assets/images/background4.jpeg',
];

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final CarouselController _controller = CarouselController();
  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Builder(
          builder: (context) {
            final double height = MediaQuery.of(context).size.height;
            final double width = MediaQuery.of(context).size.width;
            return CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                height: height,
                // aspectRatio: 16/10,
                viewportFraction: 1,
                enlargeCenterPage: false,
                autoPlay: true,
              ),
              items: imgList
                  .map((item) => Center(
                          child: Image.network(
                        item,
                        fit: BoxFit.fill,
                        height: height,
                        width: width,
                      )))
                  .toList(),
            );
          },
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black.withOpacity(0.4),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Padding(
            padding: EdgeInsets.all(!isMobile(context) ? 40 : 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Obx(() => Text(
                      controller.changeLocal.isFalse
                          ? "Maxsus texnikalar, uskunalar va ehtiyot qismlarni etkazib berish."
                          : 'Поставки  спецтехники,  оборудования и запчастей',
                      textAlign: isMobile(context)
                          ? TextAlign.center
                          : TextAlign.center,
                      style: TextStyle(
                          fontSize: isMobile(context) ? 25 : 50,
                          fontWeight: FontWeight.w800,
                          color: kTextColor),
                    )),
                const SizedBox(height: 40),
                Obx(() => Text(
                      controller.changeLocal.isFalse
                          ? "TAS o‘zining asosiy qadriyatiga sodiq bo‘lib, “Buyuk mas’uliyatni o‘z zimmasiga olish, yuksak axloq bilan ish tutish va katta yutuqlarga erishish” va o‘zining “Qat’iy, Amaliy, Ilg‘or va Ijodkor” korporativ ruhiga, o‘zining yakuniy maqsadi sari olg‘a intilaveradi."
                          : 'TAS придерживается своей основной ценности «Взять на себя большую ответственность, действовать с высокой моралью и добиваться больших достижений» и своего корпоративного духа «Строгого, Практичного, Прогрессивного и Креативного», чтобы продолжать двигаться к своей конечной цели.',
                      textAlign: isMobile(context)
                          ? TextAlign.center
                          : TextAlign.center,
                      style: TextStyle(
                          fontSize: isMobile(context) ? 13 : 22,
                          fontWeight: FontWeight.w400,
                          color: kTextColor),
                    )),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_sharp),
                      color: Colors.green,
                      onPressed: () {
                        setState(() {
                          _controller.previousPage();
                        });
                      },
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      color: Colors.green,
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                      onPressed: () {
                        _controller.nextPage();
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
