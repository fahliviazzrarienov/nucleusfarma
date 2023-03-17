import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class PaletteLogin {
  static const Color palatinate_blue = Color(0xFF1968E6);
  static const Color yale_blue = Color(0xFF0D4795);
  static const Color white = Color(0xFFFFFFFF);

}

class PalleteDashboard{
  static const Color  notcontent = Color(0xFF625B71);
  static const Color  background = Color(0xFFE7E0EC);

  static const Color  smashed_pumpkin = Color(0xFFFA693B);
  static const Color  urobilin = Color(0xFFE6B41B);

  static const Color  turquoise = Color(0xFF4DF2C1);
  static const Color  emerald = Color(0xFF59D073);

  static const Color dark_pring_green = Color(0xFF1C663A);
  static const Color spanish_green = Color(0xFF009944);
  static const Color tufts_blue = Color(0xFF4499EE);
  static const Color midnight = Color(0xFF7E2778);
  static const Color flame = Color(0xFFEA541C);
  static const Color cornflower_blue = Color(0xFF273B91);
  static const Color red_pigment = Color(0xFFED1C24);
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    accentColor: Colors.purple[300],
    scaffoldBackgroundColor: PaletteLogin.palatinate_blue,
    colorScheme: ColorScheme.light(
      primary: PaletteLogin.palatinate_blue,
      secondary: PaletteLogin.yale_blue,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.green,
    accentColor: Colors.purple[300],
    colorScheme: ColorScheme.dark(
      primary: Colors.green,
      secondary: Colors.green,
    ),
  );
}
