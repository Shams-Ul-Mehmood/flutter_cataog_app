import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Catalog_Themes
{
  static ThemeData catalogLightThemeData(BuildContext buildContext) => ThemeData(
      brightness: Brightness.light,

    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,
    buttonTheme: ButtonThemeData(
      buttonColor: darkBlueColor,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    textTheme: Theme.of(buildContext).textTheme.copyWith(headline6: buildContext.textTheme.headline6!.copyWith(color: Colors.black87)),
  );

  static ThemeData catalogDarkThemeData(BuildContext buildContext) => ThemeData(
    brightness: Brightness.dark,
    cardColor: Colors.black87,
    canvasColor: darkCreamColor,
    buttonTheme: ButtonThemeData(
      buttonColor: lightBlueColor,
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      centerTitle: true,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white,),
    ),
    textTheme: Theme.of(buildContext).textTheme.copyWith(headline6: buildContext.textTheme.headline6!.copyWith(color: Colors.white)),
  );

  // Colors.
static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
static Color darkBlueColor = Color(0xff403b58);
  static Color lightBlueColor = Vx.indigo700;
}