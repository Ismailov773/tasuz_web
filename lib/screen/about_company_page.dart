import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/constants.dart';
import '../components/responsive.dart';

class AboutCompanyPage extends StatefulWidget {
  const AboutCompanyPage({Key? key}) : super(key: key);

  @override
  State<AboutCompanyPage> createState() => _AboutCompanyPageState();
}

class _AboutCompanyPageState extends State<AboutCompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Builder(
              builder: (context) {
                final double height = MediaQuery.of(context).size.height;
                final double width = MediaQuery.of(context).size.width;
                return Image.network(
                  "assets/images/bg2.jpeg",
                  fit: BoxFit.fill,
                  height: height,
                  width: width,
                );
              },
            ),
             Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.black.withOpacity(0.55),
                padding:
                    const EdgeInsets.only(left: 40, right: 40, top: 100, bottom: 10),
                child: Padding(
                  padding: EdgeInsets.all(!isMobile(context) ? 40 : 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Stack(alignment: Alignment.center,
                        children: [
                         SvgPicture.asset(
                              "assets/images/tassvg.svg",
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          Text('О Компании', style: styleTitle2(context),),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                          '«TEXNIKA ADVANS SERVIS»',
                          textAlign: isMobile(context)
                              ? TextAlign.center
                              : TextAlign.center,
                          style: TextStyle(
                              fontSize: isMobile(context) ? 25 : 50,
                              fontWeight: FontWeight.w800,
                              color: kTextColor),
                        ),
                      const SizedBox(height: 30,),
                      Expanded(
                        child: Text(
                          'Компания «TEXNIKA ADVANS SERVIS» была основана в 2009 году и является одной из надежных компаний по осуществлению поставок спецтехники, оборудования и запчастей из KHP. \n Спецтехника, оборудование и запчасти, поставляемые нашей компанией, выполнены в экспортном варианте и соответствуют высоким стандартам качества. \n•  Более 20 000 поставок техники и оборудования. \n•  12 лет на рынке.\n• 12 месяцев  (гарантия 1 год или 2000 моточасов). \n На сегодняшний день компания TEXNIKA ADVANS SERVIS официально представляет на рынке Узбекистана такие мировые бренды как XCMG, SHACMAN, SHANTUI, которые производят весь спектр строительной, дорожной, карьерной спецтехники и заводов по производству бетона и асфальта на уровне мировых стандартов.',
                          textAlign: isMobile(context)
                              ? TextAlign.center
                              : TextAlign.center,
                          style: TextStyle(
                              fontSize: isMobile(context) ? 13 : 19,
                              fontWeight: FontWeight.w400,
                              color: kTextColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          height: isMobile(context) ? MediaQuery.of(context).size.height / 1.5 : MediaQuery.of(context).size.height / 1.3,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                      "assets/images/bg3.png",
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width,
                    ),

                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Официальный представитель мировых брендов',
                        textAlign: isMobile(context)
                            ? TextAlign.center
                            : TextAlign.center,
                        style: TextStyle(
                            fontSize: isMobile(context) ? 18 : 25,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 30
                      ),
                      Text(
                          'Мы сотрудничаем с компаниями, которые производят весь спектр строительной, дорожной, карьерной спецтехники и заводов по производству бетона и асфальта на уровне высших мировых стандартов.',
                          textAlign: isMobile(context)
                              ? TextAlign.center
                              : TextAlign.center,
                          style: TextStyle(
                              fontSize: isMobile(context) ? 15 : 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.8)),
                        ),

                      const SizedBox(height: 30),
                      Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  "assets/images/logo_producer/xcmg_logo.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Image.asset(
                                  "assets/images/logo_producer/shantui_logo.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),

                      Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  "assets/images/logo_producer/weichai_logo.png",
                                  fit: BoxFit.fill,
                                  alignment: Alignment.center,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Image.asset(
                                  "assets/images/logo_producer/shackman_logo.png",
                                  fit: BoxFit.fill,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          height: isMobile(context) ? MediaQuery.of(context).size.height / 1 : MediaQuery.of(context).size.height / 1.3,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Преимущества авторизованного сервисного центра:',
                        textAlign: isMobile(context)
                            ? TextAlign.center
                            : TextAlign.center,
                        style: TextStyle(
                            fontSize: isMobile(context) ? 18 : 25,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 40),
                      Text(
                          '•  Диагностическое оборудование и официальное программное обеспечение '
                              'для эффективной диагностики различных систем двигателей.'
                              '\n•  Постоянное присутствие технических специалистов на базе сервисного центра '
                              ' и совместная работа по устранению возникающих технических проблем во время эксплуатации техники.'
                              '\nСервисный центр TAS — это высокая техническая база '
                              'с современным оборудованием для качественного обслуживания '
                              'и выполнения всех видов ремонта.',
                        textAlign: isMobile(context)
                            ? TextAlign.center
                            : TextAlign.center,
                        style: TextStyle(
                            fontSize: isMobile(context) ? 15 : 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/bg4.jpeg",
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width,
                  ),

                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
