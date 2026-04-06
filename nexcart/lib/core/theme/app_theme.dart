import 'package:flutter/material.dart';
import 'package:nexcart/core/theme/app_colors.dart';
import 'package:nexcart/core/theme/app_text_styles.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: nexLightColors.background,
  fontFamily: 'Poppins',
  extensions: [nexLightColors, nexLightTextStyles],
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: nexDarkColors.background,
  fontFamily: 'Poppins',
  extensions: [nexDarkColors, nexDarkTextStyles],
);
