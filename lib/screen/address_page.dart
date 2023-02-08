import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:tasuz_web/screen/googlemap.dart';

import '../components/responsive.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (!isMobile(context)) ? DesktopFooter() : MobileFooter();
  }
}

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.centerLeft,
      children: [
        Builder(
          builder: (context) {
            final double height = MediaQuery.of(context).size.height;
            final double width = MediaQuery.of(context).size.width;
            return Container(
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset(
                "assets/images/tassvg.svg",
                fit: BoxFit.contain,
                height: height,
                width: width,
                color: Colors.yellow.shade400.withOpacity(0.1),
              ),
            );
          },
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.transparent,
          padding: EdgeInsets.all(40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Контакты',
                          style: TextStyle(
                              fontSize: isDesktop(context) ? 18 : 14,
                              fontWeight: FontWeight.w800,
                              color: Colors.amberAccent)),
                      SizedBox(height: 55),
                      Text(
                        'Офис',
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 18 : 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Ташкент, 100084, Юнусабадский район, ул. А.Тимура 95А, «UzOman Tower»',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 18 : 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(height: 15),
                      Text(
                        '+998 78 147 00 80',
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 16 : 12,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '+998 78 147 00 90',
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 16 : 12,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      SizedBox(height: 40,),
                      Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        runAlignment: WrapAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.telegram_outlined,
                                size: 40,
                              ),
                              color: Colors.blue,
                              hoverColor: Colors.yellow,
                              style: ButtonStyle(
                                  shape: MaterialStateProperty
                                      .all<CircleBorder>(CircleBorder(
                                      side: BorderSide.none)))),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                FontAwesome.instagram,
                                size: 40,
                              ),
                              color: Colors.pinkAccent,
                              highlightColor: Colors.amberAccent,
                              hoverColor: Colors.yellow,
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(14),
                                          side: BorderSide.none))
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.facebook_outlined,
                                size: 40,
                              ),
                              color: Colors.blue,
                              highlightColor: Colors.amberAccent,
                              hoverColor: Colors.yellow,
                              style: ButtonStyle(
                                  shape: MaterialStateProperty
                                      .all<CircleBorder>(CircleBorder(
                                      side: BorderSide.none)))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // width: MediaQuery.of(context).size.width/1,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Сервис',
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 18 : 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Ташкент, 100146, Яшнабадский район, массив Панельный, ул. Уйсозлар 23А',
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 18 : 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(height: 15),
                      Text(
                        '+998 71 283 00 07',
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 16 : 12,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '+998 71 290 28 28',
                        style: TextStyle(
                            fontSize: isDesktop(context) ? 16 : 12,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      ),
                  // color: Colors.grey,
                  child: GoogleMap(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MobileFooter extends StatelessWidget {
  const MobileFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height / 1,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: <Widget>[
          Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.telegram_outlined,
                    size: 40,
                  ),
                  splashRadius: 2,
                  color: Colors.blue,
                  highlightColor: Colors.amberAccent,
                  hoverColor: Colors.yellow,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<CircleBorder>(
                          CircleBorder(side: BorderSide.none)))),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FontAwesome.instagram,
                    size: 40,
                  ),
                  splashRadius: 2,
                  color: Colors.pinkAccent,
                  highlightColor: Colors.amberAccent,
                  hoverColor: Colors.yellow,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                              side: BorderSide.none)))),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.facebook_outlined,
                    size: 40,
                  ),
                  splashRadius: 2,
                  color: Colors.blue,
                  highlightColor: Colors.amberAccent,
                  hoverColor: Colors.yellow,
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<CircleBorder>(
                          CircleBorder(side: BorderSide.none)))),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.transparent,
            child: (Expanded(
              child: Column(
                mainAxisAlignment: !isMobile(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.center,
                crossAxisAlignment: !isMobile(context)
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.start,
                children: [
                  Text('Контакты',
                      style: TextStyle(
                          fontSize: isDesktop(context) ? 15 : 10,
                          fontWeight: FontWeight.w800,
                          color: Colors.amberAccent)),
                  SizedBox(height: 20),
                  Text(
                    'Офис',
                    style: TextStyle(
                        fontSize: isDesktop(context) ? 15 : 10,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ташкент, 100084, Юнусабадский район, ул. А.Тимура 95А, «UzOman Tower»',
                    textAlign:
                    isMobile(context) ? TextAlign.start : TextAlign.start,
                    style: TextStyle(
                        fontSize: isDesktop(context) ? 15 : 10,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '+998 78 147 00 80',
                    style: TextStyle(
                        fontSize: isDesktop(context) ? 15 : 10,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '+ 998 78 147 00 90',
                    style: TextStyle(
                        fontSize: isDesktop(context) ? 15 : 10,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ],
              ),
            )),
          ),
          Container(
            color: Colors.transparent,
            child: (Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Text(
                  'Сервис',
                  style: TextStyle(
                      fontSize: isDesktop(context) ? 15 : 10,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Ташкент, 100146, Яшнабадский район, массив Панельный, ул. Уйсозлар 23А',
                  textAlign:
                  isMobile(context) ? TextAlign.start : TextAlign.start,
                  style: TextStyle(
                      fontSize: isDesktop(context) ? 15 : 10,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  '+998 71 283 00 07',
                  style: TextStyle(
                      fontSize: isDesktop(context) ? 15 : 10,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  '+ 998 71 290 28 28',
                  style: TextStyle(
                      fontSize: isDesktop(context) ? 15 : 10,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ],
            )
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Column(
                children: [
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}