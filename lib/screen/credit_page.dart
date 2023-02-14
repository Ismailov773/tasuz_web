import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../components/responsive.dart';
import '../controller/controller.dart';

class CreditPage extends StatefulWidget {
  const CreditPage({Key? key}) : super(key: key);

  @override
  State<CreditPage> createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
  final Controller controller = Get.find();
  var numberFormat = NumberFormat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.changeLocal.isFalse
            ? "Kredit kalkulyatori: "
            : "Кредитный калькулятор: ")),
        centerTitle: true,
        actions: [
          InkWell(
            radius: 20,
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              setState(() {
                controller.changeLocale();
              });
            },
            child: Center(
              child: Obx(() => Text(
                    controller.changeLocal.isFalse ? 'UZ' : 'RU',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  )),
            ),
          ),
          const SizedBox(
            width: 40,
          )
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://admin.tascom.uz:8083/api/download/model/${controller.modelSet!.imagepath}',
                    width: isMobile(context)
                        ? MediaQuery.of(context).size.width / 2
                        : MediaQuery.of(context).size.width / 4,
                    height: isMobile(context)
                        ? MediaQuery.of(context).size.height / 3
                        : MediaQuery.of(context).size.height / 4,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Obx(() => Text(
                            controller.changeLocal.isFalse
                                ? "${controller.modelSet!.section!.nameuz!} - ${controller.modelSet!.producername} :"
                                : "${controller.modelSet!.section!.name!} - ${controller.modelSet!.producername} :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: isDesktop(context) ? 20 : 10,
                                fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => Text(
                                controller.changeLocal.isFalse
                                    ? "model: "
                                    : "модель: ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: isDesktop(context) ? 17 : 12,
                                ),
                              )),
                          Text(
                            (controller.modelSet!.name).toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: isDesktop(context) ? 20 : 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => Text(
                                controller.changeLocal.isFalse
                                    ? "boshlang'ich narxi: "
                                    : "цены от: ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: isDesktop(context) ? 17 : 12,
                                    fontStyle: FontStyle.italic),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Obx(() => Text(
                                controller.changeLocal.isFalse
                                    ? "${numberFormat.format(controller.modelSet!.priceuzs)} so`m "
                                    : "${numberFormat.format(controller.modelSet!.priceuzs)} cум ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: isDesktop(context) ? 18 : 10,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic),
                              )),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.yellow.withOpacity(0.3),
              padding: const EdgeInsets.all(20),
              child: Column(),
            ),
          ),
        ],
      ),
    );
  }
}
