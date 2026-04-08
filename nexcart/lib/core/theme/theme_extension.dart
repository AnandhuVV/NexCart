import 'package:flutter/material.dart';

class NexColors extends ThemeExtension<NexColors> {
  // Actions
  final Color primaryAction; // main buttons background
  final Color secondaryAction; // outlined / subtle buttons background

  // Backgrounds
  final Color background; // app background (screen)
  final Color surface; // cards, containers
  final Color shimmerBase;
  final Color shimmerHighlight;

  // Text
  final Color textPrimary;
  final Color textSecondary;
  final Color onPrimary; // text on primary button
  final Color onSurface; // text on cards

  // Tint
  final Color
  surfaceTint; // intended for all tinted elements like placeholder texts, unselected button border etc.

  // States
  final Color success;
  final Color error;

  const NexColors({
    required this.shimmerBase,
    required this.shimmerHighlight,
    required this.primaryAction,
    required this.secondaryAction,
    required this.background,
    required this.surface,
    required this.surfaceTint,
    required this.textPrimary,
    required this.textSecondary,
    required this.onPrimary,
    required this.onSurface,
    required this.success,
    required this.error,
  });

  @override
  NexColors copyWith({
    Color? shimmerBase,
    Color? shimmerHighlight,
    Color? primaryAction,
    Color? secondaryAction,
    Color? background,
    Color? surface,
    Color? surfaceTint,
    Color? textPrimary,
    Color? textSecondary,
    Color? onPrimary,
    Color? onSurface,
    Color? border,
    Color? success,
    Color? warning,
    Color? error,
  }) {
    return NexColors(
      shimmerBase: shimmerBase ?? this.shimmerBase,
      shimmerHighlight: shimmerHighlight ?? this.shimmerHighlight,
      primaryAction: primaryAction ?? this.primaryAction,
      secondaryAction: secondaryAction ?? this.secondaryAction,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceTint: surfaceTint ?? this.surfaceTint,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      onPrimary: onPrimary ?? this.onPrimary,
      onSurface: onSurface ?? this.onSurface,
      success: success ?? this.success,
      error: error ?? this.error,
    );
  }

  @override
  NexColors lerp(ThemeExtension<NexColors>? other, double t) {
    if (other is! NexColors) {
      return this;
    }

    return NexColors(
      shimmerBase: Color.lerp(shimmerBase, other.shimmerBase, t)!,
      shimmerHighlight: Color.lerp(shimmerHighlight, other.shimmerHighlight, t)!,
      primaryAction: Color.lerp(primaryAction, other.primaryAction, t)!,
      secondaryAction: Color.lerp(secondaryAction, other.secondaryAction, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceTint: Color.lerp(surfaceTint, other.surfaceTint, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
    );
  }
}

class NexTextStyles extends ThemeExtension<NexTextStyles> {
  final TextStyle headingLarge;
  final TextStyle headingMedium;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySemibold;
  final TextStyle bodyNormal;
  final TextStyle bodyThin;

  final TextStyle buttonLabel;

  const NexTextStyles({
    required this.headingLarge,
    required this.headingMedium,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySemibold,
    required this.bodyNormal,
    required this.bodyThin,
    required this.buttonLabel,
  });

  @override
  NexTextStyles copyWith({
    TextStyle? headingLarge,
    TextStyle? headingMedium,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySemibold,
    TextStyle? bodyNormal,
    TextStyle? bodyThin,
    TextStyle? buttonLabel,
  }) {
    return NexTextStyles(
      headingLarge: headingLarge ?? this.headingLarge,
      headingMedium: headingMedium ?? this.headingMedium,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySemibold: bodySemibold ?? this.bodySemibold,
      bodyNormal: bodyNormal ?? this.bodyNormal,
      bodyThin: bodyThin ?? this.bodyThin,
      buttonLabel: buttonLabel ?? this.buttonLabel,
    );
  }

  @override
  NexTextStyles lerp(covariant ThemeExtension<NexTextStyles>? other, double t) {
    if (other is! NexTextStyles) return this;

    return NexTextStyles(
      headingLarge: TextStyle.lerp(headingLarge, other.headingLarge, t)!,
      headingMedium: TextStyle.lerp(headingMedium, other.headingMedium, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodySemibold: TextStyle.lerp(bodySemibold, other.bodySemibold, t)!,
      bodyNormal: TextStyle.lerp(bodyNormal, other.bodyNormal, t)!,
      bodyThin: TextStyle.lerp(bodyThin, other.bodyThin, t)!,
      buttonLabel: TextStyle.lerp(buttonLabel, other.buttonLabel, t)!,
    );
  }
}
