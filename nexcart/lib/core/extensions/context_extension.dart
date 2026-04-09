import 'package:flutter/material.dart';
import 'package:nexcart/core/l10n/app_localizations.dart';
import 'package:nexcart/core/network/errors.dart';
import 'package:nexcart/core/theme/theme_extension.dart';

extension NexTheme on BuildContext {
  NexColors get colors => Theme.of(this).extension<NexColors>()!;
  NexTextStyles get textStyle => Theme.of(this).extension<NexTextStyles>()!;
  AppLocalizations get loc => AppLocalizations.of(this)!;

  String localizeError(Object error) {
    if (error is AppException) {
      return switch (error) {
        AppException.network => loc.networkError,
        AppException.unauthorised => loc.unauthorizedError,
        AppException.rateLimit => loc.rateLimitError,
        AppException.server => loc.serverError,
        AppException.timeout => loc.timeoutError,
        AppException.unknown => loc.unknownError,
      };
    }

    if (error is String) {
      if (error.startsWith('Failed to securely log out: ')) {
        final detail = error.replaceFirst('Failed to securely log out: ', '');
        return loc.failedToSecurelyLogOut(detail);
      }

      return switch (error) {
        'No internet connection. Please check your network.' => loc.networkError,
        'User not authorized for this action' => loc.unauthorizedError,
        'Too many attempts. Please wait a moment.' => loc.rateLimitError,
        'Something went wrong. Please try again later.' => loc.serverError,
        'Request timed out. Please try again.' => loc.timeoutError,
        'An unexpected error occurred.' => loc.unknownError,
        _ => error,
      };
    }

    return error.toString();
  }
}
