import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
      // appBar: AppBar(
      //   title: Text("Кредитный калькулятор"),
      // ),
      body: Stack(
        children: [
          Builder(
            builder: (context) {
              final double height = MediaQuery.of(context).size.height;
              final double width = MediaQuery.of(context).size.width;
              return  Expanded(
                child: Container(
                  color: Colors.white,
                  child: SvgPicture.asset(
                    "assets/images/tassvg.svg",
                    fit: BoxFit.contain,
                    height: height,
                    width: width,
                    alignment: Alignment.center,
                    color: Colors.yellow.withOpacity(0.2),
                  ),
                ),
              );
            },
          ),
          SingleChildScrollView(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black.withOpacity(0.3),
                      padding: EdgeInsets.all(20),
                      // child: Column(
                      //   children: [
                      //     Text(
                      //       "${controller.modelSet!.section!.name!} - ${controller.modelSet!.producername} :",
                      //       textAlign: TextAlign.start,
                      //       style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: isDesktop(context) ? 20 : 10,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Row(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text(
                      //           "модель:",
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: isDesktop(context) ? 17 : 12,
                      //           ),
                      //         ),
                      //         Text(
                      //           "${(controller.modelSet!.name).toString()}",
                      //           style: TextStyle(
                      //               color: Colors.black,
                      //               fontSize: isDesktop(context) ? 20 : 10,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       ],
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Row(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Text(
                      //           "цены от: ",
                      //           style: TextStyle(
                      //               color: Colors.black54,
                      //               fontSize: isDesktop(context) ? 17 : 12,
                      //               fontStyle: FontStyle.italic),
                      //         ),
                      //         SizedBox(
                      //           width: 10,
                      //         ),
                      //         Text(
                      //           // "${(_listModelset[index].priceuzs).toString()}",
                      //           "${numberFormat.format(controller.modelSet!.priceuzs)} cум ",
                      //           textAlign: TextAlign.center,
                      //           style: TextStyle(
                      //               color: Colors.blue,
                      //               fontSize: isDesktop(context) ? 18 : 10,
                      //               fontWeight: FontWeight.w400,
                      //               fontStyle: FontStyle.italic),
                      //         ),
                      //       ],
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Image.network(
                      //       'https://admin.tascom.uz:8083/api/download/model/${controller.modelSet!.imagepath}',
                      //       width: isMobile(context)
                      //           ? MediaQuery.of(context).size.width / 2
                      //           : MediaQuery.of(context).size.width / 3,
                      //       height: isMobile(context)
                      //           ? MediaQuery.of(context).size.height / 3
                      //           : MediaQuery.of(context).size.height / 2,
                      //       fit: BoxFit.fill,
                      //     ),
                      //     Text(
                      //       "Описание: ",
                      //       textAlign: TextAlign.start,
                      //       style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: isDesktop(context) ? 20 : 10,
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //     SizedBox(
                      //       height: 20,
                      //     ),
                      //     Text(
                      //       "${(controller.modelSet!.description).toString()}",
                      //       textAlign: TextAlign.start,
                      //       style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: isDesktop(context) ? 17 : 10,
                      //           fontWeight: FontWeight.w500),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.yellow.withOpacity(0.3),
                        padding: EdgeInsets.all(20),
                        child: Column(
                        ),
                      )),
                ],
              ),
          ),

        ],
      ) ,
    );





  }
}
