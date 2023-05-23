import 'package:flutter/material.dart';

const primaryColor = Color.fromARGB(255, 45, 209, 214);
const secondaryColor = Color.fromARGB(255, 33, 228, 140);

const textColor = Color(0xFF2B2B2B);
const lightgrayColor = Color(0x44948282);
const whiteColor = Color(0xFFFFFFFF);
const blackColor = Color(0xFF2B2B2B);
const errorColor = Color(0xffEB001B);
const successColor = Color(0xff00FF00);

Color lightBackgroundColor = const Color(0xFFFFFFFF);

Color lightTextColor = const Color(0xFF403930);
Color lightIconColor = const Color(0xFF403930);
Color darkIconColor = const Color(0xFFF3F2FF);

Color darkBackgroundColor = const Color(0xFF2B2B2B);

Color darkTextColor = const Color(0xFFF3F2FF);

const pinkpurple = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color(0XFFaa367c), Color(0XFF4a2fbd)],
);

const grayBack = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0XFF2E2D36), Color(0XFF11101D)],
);
const grayWhite = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFFFFF), Color(0xFFF3F2FF)],
);

const buttonGradi = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0XFF7DE7EB), Color(0XFF33BBCF)],
);

const contactGradi = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0XFF2E2D36), Color(0XFF11101D)],
);

//
BoxShadow primaryColorShadow = BoxShadow(
  color: primaryColor.withAlpha(100),
  blurRadius: 12.0,
  offset: const Offset(0.0, 0.0),
);
BoxShadow blackColorShadow = BoxShadow(
  color: Colors.black.withAlpha(100),
  blurRadius: 12.0,
  offset: const Offset(0.0, 0.0),
);
