import 'package:flutter/material.dart';
import 'package:tasuz_web/components/responsive.dart';

const kPrimaryColor = Color(0XFF88C54D);
const kSecondaryColor = Color(0XFFFFC906);
const kTextColor = Colors.white;

styleTitle(BuildContext context) => TextStyle(
    fontSize: isDesktop(context) ? 64 : 32,
    fontWeight: FontWeight.w500,
    inherit: true,
    shadows: [
      Shadow(
          // bottomLeft
          offset: const Offset(-1.5, -1.5),
          color: Colors.black.withOpacity(0.5)),
      Shadow(
          // bottomRight
          offset: const Offset(5.5, -1.5),
          color: Colors.black.withOpacity(0.5)),
      Shadow(
          // topRight
          offset: const Offset(5.5, 1.5),
          color: Colors.black.withOpacity(0.5)),
      Shadow(
          // topLeft
          offset: const Offset(-1.5, 1.5),
          color: Colors.black.withOpacity(0.5)),
    ],
    color: Colors.yellow.shade400);

styleTitle2(BuildContext context) => TextStyle(
    fontSize: isDesktop(context) ? 64 : 32,
    fontWeight: FontWeight.w500,
    inherit: true,
    shadows: [
      Shadow(
        // bottomLeft
          offset: const Offset(-1.5, -1.5),
          color: Colors.black.withOpacity(0.3)),
      Shadow(
        // bottomRight
          offset: const Offset(5.5, -1.5),
          color: Colors.black.withOpacity(0.3)),
      Shadow(
        // topRight
          offset: const Offset(5.5, 1.5),
          color: Colors.black.withOpacity(0.3)),
      Shadow(
        // topLeft
          offset: const Offset(-1.5, 1.5),
          color: Colors.black.withOpacity(0.3)),
    ],
    color: Colors.white);

stylePageBackground(BuildContext context) => const BoxDecoration(
    gradient: LinearGradient(colors: [
      Colors.white,
      Colors.white,
    ],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.mirror,
    )
);


const primaryColor = Color(0xFF685BFF);
const canvasColor = Colors.orangeAccent;
const scaffoldBackgroundColor = Colors.white38;
const accentCanvasColor = Colors.amberAccent;
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);