import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreditPage extends StatefulWidget {
  const CreditPage({Key? key}) : super(key: key);

  @override
  State<CreditPage> createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
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
      ],
    );
  }
}
