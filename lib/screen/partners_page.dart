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
      height: MediaQuery.of(context).size.height * 2.1,
      decoration: stylePageBackground(context),
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: !isMobile(context)
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        crossAxisAlignment: !isMobile(context)
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: [
              SvgPicture.asset(
                "assets/images/tassvg.svg",
                fit: BoxFit.contain,
                alignment: Alignment.center,
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
          SizedBox(
            height: 30,
          ),
          Obx(() => Text(
                _controller.changeLocal.isFalse
                    ? "Ushbu sahifada qurilish faoliyatini rivojlantirishga va qurilishni yangi, zamonaviy darajaga olib chiqishga yordam beradigan hurmatli hamkorlarimiz ro'yxati keltirilgan. Yangi texnologiyalarni yaratish va joriy etish murakkab va ko'p bosqichli jarayondir. Biz hamkorlarimiz, mijozlarimiz, yetkazib beruvchilarimiz bilan faxrlanamiz, ular biz bilan birgalikda qurilish texnologiyalarini modernizatsiya va optimallashtirish strategiyasini tanlaydilar."
                    : "На данной странице указаны наши уважаемые партнеры, которые помогают нам развивать строительную деятельность, и выводить строительство на новый, современный уровень. Создавать и внедрять новые технологии - это сложный и многоэтапный процесс. Мы гордимся партнерами, клиентами, поставщиками, которые вместе с нами выбирают стратегию модернизации и оптимизации технологий строительства.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              )),
          SizedBox(
            height: 30,
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
          Container(
            height: MediaQuery.of(context).size.height / 4.5,
            child: getCatalog(),
          ),
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
          Container(
            height: MediaQuery.of(context).size.height / 1.3,
            child: getCatalog2(),
          ),
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
          Container(
            height: MediaQuery.of(context).size.height / 4.5,
            child: getCatalog3(),
          ),
        ],
      ),
    );
  }

  GridView getCatalog() {
    return GridView.count(
      primary: false,
      padding: EdgeInsets.only(top: 5, bottom: 5),
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 4 / 3,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      crossAxisCount: 6,
      children: <Widget>[
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/foreigncomp1.png'),
              SizedBox(
                height: 10,
              ),
              Text("Papenburg Baugesellschaft",
                  style: stylePartnersText(context))
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/foreigncomp2.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter engineering",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/foreigncomp3.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "Kukdong",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/foreigncomp4.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "Posco",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
      ],
    );
  }

  GridView getCatalog2() {
    return GridView.count(
      primary: false,
      padding: EdgeInsets.only(top: 5, bottom: 5),
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 4 / 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 6,
      children: <Widget>[
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp1.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "Ahangarancement",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp2.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "O'zbekgidroenergo",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp3.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "Real house",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp4.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "Discover Invest",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp5.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "Binokor",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp6.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "Akfa",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp7.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "Road Max",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp8.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "O'zbekko'mir",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp9.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "Qizilqum cement",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp10.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "НГМК",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp11.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "ETQ",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp12.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "Shortan",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp13.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "O`zbekiston Temir Yo`llari",
                textAlign: TextAlign.center,
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/incomp14.png'),
              SizedBox(
                height: 10,
              ),
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
      padding: EdgeInsets.only(top: 5, bottom: 5),
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 4 / 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 6,
      children: <Widget>[
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/leasingcomp1.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                "Premier Class Leasing",
                style: stylePartnersText(context),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset('assets/images/partners/leasingcomp2.png'),
              SizedBox(
                height: 10,
              ),
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
