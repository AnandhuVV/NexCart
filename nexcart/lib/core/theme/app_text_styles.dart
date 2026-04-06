import 'package:flutter/painting.dart';
import 'package:nexcart/core/theme/app_colors.dart';
import 'package:nexcart/core/theme/theme_extension.dart';

final nexLightTextStyles = NexTextStyles(
  headingLarge: NexTextConstants.headingLarge.copyWith(color: nexLightColors.textPrimary),
  headingMedium: NexTextConstants.headingMedium.copyWith(color: nexLightColors.textPrimary),
  bodyLarge: NexTextConstants.bodyLarge.copyWith(color: nexLightColors.textPrimary),
  bodyMedium: NexTextConstants.bodyMedium.copyWith(color: nexLightColors.textPrimary),
  bodySemibold: NexTextConstants.bodySemibold.copyWith(color: nexLightColors.textPrimary),
  bodyNormal: NexTextConstants.bodyNormal.copyWith(color: nexLightColors.textPrimary),
  bodyThin: NexTextConstants.bodyThin.copyWith(color: nexLightColors.textPrimary),
);

final nexDarkTextStyles = NexTextStyles(
  headingLarge: NexTextConstants.headingLarge.copyWith(color: nexDarkColors.textPrimary),
  headingMedium: NexTextConstants.headingMedium.copyWith(color: nexDarkColors.textPrimary),
  bodyLarge: NexTextConstants.bodyLarge.copyWith(color: nexDarkColors.textPrimary),
  bodyMedium: NexTextConstants.bodyMedium.copyWith(color: nexDarkColors.textPrimary),
  bodySemibold: NexTextConstants.bodySemibold.copyWith(color: nexDarkColors.textPrimary),
  bodyNormal: NexTextConstants.bodyNormal.copyWith(color: nexDarkColors.textPrimary),
  bodyThin: NexTextConstants.bodyThin.copyWith(color: nexDarkColors.textPrimary),
);

class NexTextConstants {
  NexTextConstants._();

  static const headingLarge = TextStyle(fontSize: 32, fontWeight: FontWeight.w600);
  static const headingMedium = TextStyle(fontSize: 28, fontWeight: FontWeight.w600);
  static const bodyLarge = TextStyle(fontSize: 24, fontWeight: FontWeight.w600);
  static const bodyMedium = TextStyle(fontSize: 20, fontWeight: FontWeight.w400);
  static const bodySemibold = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  static const bodyNormal = TextStyle(fontSize: 20, fontWeight: FontWeight.w300);
  static const bodyThin = TextStyle(fontSize: 16, fontWeight: FontWeight.w200);
}