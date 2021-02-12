import "package:estructura_practica_1/colors.dart";
import 'package:flutter/material.dart';

ThemeData buildAppTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    primaryColor: c_dark_blue,
    primaryColorDark: c_darker_blue,
    accentColor: c_orange,
    unselectedWidgetColor: c_brown_light,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: c_brown_light,
      height: 60,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      colorScheme: base.colorScheme.copyWith(
        secondary: c_brown_light,
      ),
    ),
    buttonBarTheme: base.buttonBarTheme.copyWith(
      buttonTextTheme: ButtonTextTheme.accent,
    ),
    scaffoldBackgroundColor: c_white,
    cardColor: c_orange_light,
    textTheme: _buildAppTextTheme(base.textTheme),
    primaryTextTheme: _buildAppTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildAppTextTheme(base.accentTextTheme),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
    ),
  );
}

TextTheme _buildAppTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline1: base.headline1.copyWith(
          fontSize: 34,
          fontWeight: FontWeight.w200,
          fontFamily: 'Open Sans',
          color: c_black,
          letterSpacing: 1.5,
        ),
        headline2: base.headline2.copyWith(
          fontSize: 34,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w200,
          color: c_black,
        ),
        headline3: base.headline3.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w100,
          fontFamily: 'Open Sans',
          color: Color(0xFFE4E1DD),
        ),
        headline4: base.headline4.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: 'Open Sans',
          color: c_black,
        ),
        headline5: base.headline5.copyWith(
          fontSize: 22,
          fontFamily: 'Open Sans',
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6.copyWith(fontSize: 22.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontSize: 14.0,
          fontFamily: 'Open Sans',
        ),
        bodyText1: base.bodyText1.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
        bodyText2: base.bodyText2.copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
          fontSize: 16.0,
        ),
      )
      .apply(fontFamily: 'Akzidenz-Grotesk');
}
