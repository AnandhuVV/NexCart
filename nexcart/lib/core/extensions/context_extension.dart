import 'package:flutter/material.dart';
import 'package:nexcart/core/theme/theme_extension.dart';

extension NexTheme on BuildContext {
  NexColors get colors => Theme.of(this).extension<NexColors>()!;
  NexTextStyles get textStyle => Theme.of(this).extension<NexTextStyles>()!;
}