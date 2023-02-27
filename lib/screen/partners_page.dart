import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tasuz_web/components/constants.dart';
import 'package:tasuz_web/screen/catalog_select_page.dart';
import '../components/onhover.dart';
import '../components/responsive.dart';
import '../controller/controller.dart';

class PartnersPage extends StatefulWidget {
  const PartnersPage({Key? key}) : super(key: key);

  @override
  State<PartnersPage> createState() => _PartnersPageState();
}

class _PartnersPageState extends State<PartnersPage> {
  final Controller _controller = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMobile(context)? MediaQuery.of(context).size.height * 1.7 : MediaQuery.of(context).size.height * 2,
      decoration: stylePageBackground(context),
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FittedBox(
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/images/tassvg.svg",
                ),
                Obx(
                  () => Text(
                      _controller.changeLocal.isFalse
                          ? "Bizning hamkorlar"
                          : 'Наши партнеры',
                      style: styleTitle(context)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          FittedBox(
            child: Obx(() => Text(
                  _controller.changeLocal.isFalse
                      ? "Ushbu sahifada qurilish faoliyatini rivojlantirishga va qurilishni yangi, zamonaviy darajaga olib chiqishga yordam beradigan hurmatli hamkorlarimiz ro'yxati keltirilgan. \n Yangi texnologiyalarni yaratish va joriy etish murakkab va ko'p bosqichli jarayondir. Biz hamkorlarimiz, mijozlarimiz, yetkazib beruvchilarimiz bilan faxrlanamiz,\n ular biz bilan birgalikda qurilish texnologiyalarini modernizatsiya va optimallashtirish strategiyasini tanlaydilar."
                      : "На данной странице указаны наши уважаемые партнеры, которые помогают нам развивать строительную деятельность, и выводить строительство \n  на новый, современный уровень.  Создавать и внедрять новые технологии - это сложный и многоэтапный процесс. \n Мы гордимся партнерами, клиентами, поставщиками, которые вместе с нами выбирают стратегию модернизации и оптимизации технологий строительства.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                )),
          ),
          SizedBox(
            height: 40,
          ),
          Obx(() => Text(
                _controller.changeLocal.isFalse
                    ? "Xorijiy kompaniyalar"
                    : "Иностранные компании",
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.yellow,
                    decorationThickness: 2,
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              )),
          SizedBox(
            height: 20,
          ),
          getCatalog(),
          SizedBox(
            height: 40,
          ),
          Obx(() => Text(
                _controller.changeLocal.isFalse
                    ? "Mahalliy kompaniyalar"
                    : "Местные компании",
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.yellow,
                    decorationThickness: 2,
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              )),
          SizedBox(
            height: 20,
          ),
          getCatalog2(),
          SizedBox(
            height: 40,
          ),
          Obx(() => Text(
                _controller.changeLocal.isFalse
                    ? "Lizing kompaniyalari"
                    : "Лизинговые компании",
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.yellow,
                    decorationThickness: 2,
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              )),
          SizedBox(
            height: 20,
          ),
          getCatalog3(),
        ],
      ),
    );
  }

  GridView getCatalog() {
    return GridView.count(
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 5, bottom: 5),
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 4 / 3,
      crossAxisSpacing: 30,
      mainAxisSpacing: 5,
      crossAxisCount: isMobile(context) ? 4 : 6,
      children: <Widget>[
        FittedBox(
          child: Column(
            children: [
              Image.asset(
                'assets/images/partners/foreigncomp1.png',
              ),
              Text(
                  "Papenburg Baugesellschaft",
                  style: stylePartnersText(context),
                ),
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset(
                'assets/images/partners/foreigncomp2.png',
              ),
                Text(
                  "Enter Enginering ",
                  style: stylePartnersText(context),
                ),
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset(
                'assets/images/partners/foreigncomp3.png',
              ),
               Text(
                  "Kukdong",
                  style: stylePartnersText(context),
                ),
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset(
                'assets/images/partners/foreigncomp4.png',
              ),
              Text(
                  "Posco",
                  style: stylePartnersText(context),
                ),
            ],
          ),
        ),
      ],
    );
  }

  GridView getCatalog2() {
    return GridView.count(
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 5, bottom: 5),
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 4 / 3,
      crossAxisSpacing: 30,
      mainAxisSpacing: 5,
      crossAxisCount: isMobile(context) ? 4 : 6,
      children: <Widget>[
        FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/partners/incomp1.png'),
              Text(
                "Ahangarancement",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp2.png'),
              Text(
                "O'zbekgidroenergo",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp3.png'),
              Text(
                "Real house",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp4.png'),
              Text(
                "Discover Invest",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp5.png'),
              Text(
                "Binokor",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp6.png'),
              Text(
                "Akfa",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp7.png'),
              Text(
                "Road Max",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp8.png'),
              Text(
                "O'zbekko'mir",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp9.png'),
              Text(
                "Qizilqum cement",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp10.png'),
              Text(
                "НГМК",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp11.png'),
              Text(
                "ETQ",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp12.png'),
              Text(
                "Shortan",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp13.png'),
              Text(
                "O`zbekiston Temir Yo`llari",
                textAlign: TextAlign.center,
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp14.png'),
              Text(
                "АГМК",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
      ],
    );
  }

  GridView getCatalog3() {
    return GridView.count(
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 5, bottom: 5),
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 4 / 3,
      crossAxisSpacing: 30,
      mainAxisSpacing: 5,
      crossAxisCount: isMobile(context) ? 4 : 6,
      children: <Widget>[
        FittedBox(
          child: Column(
            children: [
              Image.asset('assets/images/partners/leasingcomp1.png'),
              Text(
                "Premier Class Leasing",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        FittedBox(
          child: Column(
            children: [
              Image.asset('assets/images/partners/leasingcomp2.png'),
              Text(
                "O'zavtosanoat Leasing",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
      ],
    );
  }
}
