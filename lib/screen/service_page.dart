import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tasuz_web/components/constants.dart';
import '../components/onhover.dart';
import '../components/responsive.dart';
import '../controller/controller.dart';
import '../models/catalog_service_item.dart';



class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  CatalogServiceItem? catalogServiceItem;
  final Controller _controller = Get.find();

  @override
  void initState() {
    super.initState();
    // _controller.changeLocale();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // decoration: stylePageBackground(context),
      height: isMobile(context)
          ? MediaQuery.of(context).size.height * 2
          : MediaQuery.of(context).size.height * 2.1,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                SvgPicture.asset(
                  "assets/images/tassvg.svg",
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
               Obx(() =>  Text(_controller.changeLocal.isFalse? "Servis markazi" :'Сервисный центр', style: styleTitle(context))),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(() => Text(_controller.changeLocal.isFalse? "TAS ishning barcha jabhalarida yuqori sifatli xizmat ko'rsatishga intiladi. Bizning maqsadimiz - yuqori sifatli avto ta'mirlash, mijozlarga xizmat ko'rsatish va arzon narxlar orqali qiymat berishdir. TAS umumiy ta'mirlashdan tashqari keng qamrovli xizmatlarni taklif etadi. Biz o'rtacha narxda eng yaxshi xizmatni taklif qilamiz."
                "Mehnat odob-axloqidan biznes aloqalarigacha, bizning maqsadimiz doimo halol va tushunarli bo'lishdir. "
                "Biz mijozlar, hamjamiyat va yetkazib beruvchilar bilan uzoq muddatli munosabatlarimizni qadrlaymiz." :
            "TAS стремится к высочайшему качеству обслуживания во всех аспектах работы. Наша цель состоит в том, чтобы обеспечить ценность за счет высококачественного ремонта автомобилей, обслуживания клиентов и доступных цен. TAS предлагает комплексные услуги, выходящие за рамки общего ремонта. Мы предлагаем лучший сервис по разумной цене."
                " От рабочей этики до делового взаимодействия наша цель — всегда быть честными и понимающими. "
                "Мы ценим наши долгосрочные отношения с клиентами, сообществами, поставщиками и арендодателями.",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  color: Colors.black.withOpacity(0.6)),
              textAlign: TextAlign.center,
            )),
            const SizedBox(
              height: 50,
            ),
            getCatalog(),
          ],
        ),
      ),
    );
  }

  Future<void> showdialog() {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            insetPadding: const EdgeInsets.all(100),
            content: SizedBox(
              height: !isMobile(context)
                  ? MediaQuery.of(context).size.height / 1
                  : MediaQuery.of(context).size.height / 1,
              width: !isMobile(context)
                  ? MediaQuery.of(context).size.width / 1.5
                  : MediaQuery.of(context).size.width / 1,
              child: !isMobile(context)
                  ? Row(
                      children: [
                        catalogServiceItem!.imageDialog,
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: !isMobile(context)
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.center,
                              crossAxisAlignment: !isMobile(context)
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    catalogServiceItem!.icon,
                                    IconButton(
                                        onPressed: () =>
                                            Navigator.pop(context),
                                        icon: const Icon(
                                          Icons.cancel_outlined,
                                          size: 30,
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Text(_controller.changeLocal.isFalse? catalogServiceItem!.titleuz :
                                  catalogServiceItem!.title,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(_controller.changeLocal.isFalse ? catalogServiceItem!.descriptionuz :
                                  catalogServiceItem!.description,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(_controller.changeLocal.isFalse ? catalogServiceItem!.descriptionDialoguz :
                                  catalogServiceItem!.descriptionDialog,
                                  style: const TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        catalogServiceItem!.imageDialog,
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: !isMobile(context)
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.center,
                            crossAxisAlignment: !isMobile(context)
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  catalogServiceItem!.icon,
                                  IconButton(
                                      onPressed: () => Navigator.pop(context),
                                      icon: const Icon(
                                        Icons.cancel_outlined,
                                        size: 30,
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                _controller.changeLocal.isFalse? catalogServiceItem!.titleuz :
                                catalogServiceItem!.title,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                _controller.changeLocal.isFalse ? catalogServiceItem!.descriptionuz :
                                catalogServiceItem!.description,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                _controller.changeLocal.isFalse ? catalogServiceItem!.descriptionDialoguz :
                                catalogServiceItem!.descriptionDialog,
                                style: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          );
        });
  }

  Widget getCatalog() {
    if (isMobile(context)) assert(debugCheckHasMaterial(context));
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: !isMobile(context) ? 13 / 8 : 3 / 3,
        crossAxisCount: !isMobile(context) ? 3 : 2,
        crossAxisSpacing: !isMobile(context) ? 20 : 10,
        mainAxisSpacing: !isMobile(context) ? 20 : 10,
      ),
      itemCount: _controller.listCatalogServiceItem.length,
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () {
          switch (index) {
            case 0:
              {
                catalogServiceItem = _controller.listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 1:
              {
                catalogServiceItem = _controller.listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 2:
              {
                catalogServiceItem = _controller.listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 3:
              {
                catalogServiceItem = _controller.listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 4:
              {
                catalogServiceItem = _controller.listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 5:
              {
                catalogServiceItem = _controller.listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 6:
              {
                catalogServiceItem = _controller.listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 7:
              {
                catalogServiceItem = _controller.listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 8:
              {
                catalogServiceItem = _controller.listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 9:
              {
                catalogServiceItem = _controller.listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 10:
              {
                catalogServiceItem = _controller.listCatalogServiceItem[index];
                showdialog();
              }
              break;
            case 11:
              {
                catalogServiceItem = _controller.listCatalogServiceItem[index];
                showdialog();
              }
              break;
          }
        },
        child: OnHover(
          builder: (isHovered) {
            final color = isHovered
                ? Colors.yellow.shade400
                : const Color.fromRGBO(235, 235, 235, 95);
            return PhysicalModel(
              color: Colors.white60,
              shadowColor: Colors.lime,
              elevation: isHovered ? 10 : 0,
              child: Container(
                padding: const EdgeInsets.all(20),
                color: color,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ShaderMask(
                              blendMode: BlendMode.srcATop,
                              shaderCallback: (bounds) => const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.yellow, Colors.black])
                                  .createShader(bounds),
                              child: _controller
                                  .listCatalogServiceItem[index].icon,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: Obx(() => Text(_controller.changeLocal.isFalse ? _controller.listCatalogServiceItem[index].titleuz :
                                _controller.listCatalogServiceItem[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: isDesktop(context) ? 20 : 12,
                                    fontWeight: isHovered
                                        ? FontWeight.w900
                                        : FontWeight.bold,
                                  ),
                                )),
                            )
                          ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Obx(() => Text(_controller.changeLocal.isFalse ? _controller.listCatalogServiceItem[index].descriptionuz
                            .toString() :
                        _controller.listCatalogServiceItem[index].description
                            .toString(),
                          textAlign: isMobile(context)
                              ? TextAlign.center
                              : TextAlign.start,
                          style: TextStyle(
                            color: isHovered
                                ? Colors.lightBlueAccent
                                : Colors.black54,
                            fontSize: isDesktop(context) ? 17 : 9,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(_controller.changeLocal.isFalse ? "Davomini o`qish → " :
                        "Читать далее → ",
                        style: TextStyle(
                            color: isHovered ? Colors.black : Colors.black54,
                            fontSize: isDesktop(context) ? 17 : 10,
                            fontStyle: FontStyle.italic,
                            fontWeight: isHovered
                                ? FontWeight.w500
                                : FontWeight.normal),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

