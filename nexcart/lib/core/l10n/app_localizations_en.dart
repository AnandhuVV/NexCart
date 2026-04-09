// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'NexCart';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get signIn => 'Sign In';

  @override
  String get enterYourUsername => 'Enter your Username';

  @override
  String get enterYourPassword => 'Enter your Password';

  @override
  String get pleaseEnterYourUsername => 'Please enter your username';

  @override
  String get usernameMustBeAtLeast3Characters =>
      'Username must be at least 3 characters';

  @override
  String get pleaseEnterYourPassword => 'Please enter your password';

  @override
  String get passwordMustBeAtLeast6Characters =>
      'Password must be at least 6 characters';

  @override
  String get backOnline => 'Back online!';

  @override
  String get home => 'Home';

  @override
  String get cart => 'Cart';

  @override
  String get profile => 'Profile';

  @override
  String get retry => 'Retry';

  @override
  String get noInternetConnection => 'No internet connection';

  @override
  String get offlineBannerMessage =>
      'No internet connection, viewing offline data';

  @override
  String get networkError =>
      'No internet connection. Please check your network.';

  @override
  String get unauthorizedError => 'User not authorized for this action';

  @override
  String get rateLimitError => 'Too many attempts. Please wait a moment.';

  @override
  String get serverError => 'Something went wrong. Please try again later.';

  @override
  String get timeoutError => 'Request timed out. Please try again.';

  @override
  String get unknownError => 'An unexpected error occurred.';

  @override
  String failedToSecurelyLogOut(String error) {
    return 'Failed to securely log out: $error';
  }

  @override
  String get categories => 'Categories';

  @override
  String get seeAll => 'See All';

  @override
  String get seeLess => 'See Less';

  @override
  String get noCategoriesFound => 'No categories found';

  @override
  String get products => 'Products';

  @override
  String get searchNexCart => 'Search NexCart...';

  @override
  String get whatAreYouLookingForToday => 'What are you looking for today?';

  @override
  String get noProductsFound => 'No products found';

  @override
  String get productDetails => 'Product Details';

  @override
  String get unavailable => 'Unavailable';

  @override
  String get cartUnavailable => 'Cart Unavailable';

  @override
  String get removeFromCart => 'Remove from Cart';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String availabilityStatusWithStock(String availabilityStatus, int stock) {
    return '$availabilityStatus • $stock left';
  }

  @override
  String get description => 'Description';

  @override
  String get yourCartIsEmpty => 'Your cart is empty!';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirmation => 'Are you sure you want to logout?';

  @override
  String get cancel => 'Cancel';

  @override
  String get email => 'Email';

  @override
  String get phone => 'Phone';

  @override
  String get gender => 'Gender';

  @override
  String get birthDate => 'Birth Date';

  @override
  String get address => 'Address';
}
