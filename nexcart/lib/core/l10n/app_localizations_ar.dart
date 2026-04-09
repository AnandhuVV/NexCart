// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'NexCart';

  @override
  String get username => 'اسم المستخدم';

  @override
  String get password => 'كلمة المرور';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get enterYourUsername => 'أدخل اسم المستخدم';

  @override
  String get enterYourPassword => 'أدخل كلمة المرور';

  @override
  String get pleaseEnterYourUsername => 'يرجى إدخال اسم المستخدم';

  @override
  String get usernameMustBeAtLeast3Characters =>
      'يجب أن يتكون اسم المستخدم من 3 أحرف على الأقل';

  @override
  String get pleaseEnterYourPassword => 'يرجى إدخال كلمة المرور';

  @override
  String get passwordMustBeAtLeast6Characters =>
      'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل';

  @override
  String get backOnline => 'تم استعادة الاتصال!';

  @override
  String get home => 'الرئيسية';

  @override
  String get cart => 'السلة';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get noInternetConnection => 'لا يوجد اتصال بالإنترنت';

  @override
  String get offlineBannerMessage =>
      'لا يوجد اتصال بالإنترنت، يتم عرض البيانات غير المتصلة';

  @override
  String get networkError => 'لا يوجد اتصال بالإنترنت. يرجى التحقق من الشبكة.';

  @override
  String get unauthorizedError => 'غير مصرح للمستخدم بهذا الإجراء';

  @override
  String get rateLimitError => 'عدد المحاولات كبير جدًا. يرجى الانتظار قليلًا.';

  @override
  String get serverError => 'حدث خطأ ما. يرجى المحاولة مرة أخرى لاحقًا.';

  @override
  String get timeoutError => 'انتهت مهلة الطلب. يرجى المحاولة مرة أخرى.';

  @override
  String get unknownError => 'حدث خطأ غير متوقع.';

  @override
  String failedToSecurelyLogOut(String error) {
    return 'فشل تسجيل الخروج بشكل آمن: $error';
  }

  @override
  String get categories => 'الفئات';

  @override
  String get seeAll => 'عرض الكل';

  @override
  String get seeLess => 'عرض أقل';

  @override
  String get noCategoriesFound => 'لم يتم العثور على فئات';

  @override
  String get products => 'المنتجات';

  @override
  String get searchNexCart => 'ابحث في NexCart...';

  @override
  String get whatAreYouLookingForToday => 'ماذا تبحث عنه اليوم؟';

  @override
  String get noProductsFound => 'لم يتم العثور على منتجات';

  @override
  String get productDetails => 'تفاصيل المنتج';

  @override
  String get unavailable => 'غير متاح';

  @override
  String get cartUnavailable => 'السلة غير متاحة';

  @override
  String get removeFromCart => 'إزالة من السلة';

  @override
  String get addToCart => 'أضف إلى السلة';

  @override
  String availabilityStatusWithStock(String availabilityStatus, int stock) {
    return '$availabilityStatus • $stock متبقٍ';
  }

  @override
  String get description => 'الوصف';

  @override
  String get yourCartIsEmpty => 'سلتك فارغة!';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get logoutConfirmation => 'هل أنت متأكد أنك تريد تسجيل الخروج؟';

  @override
  String get cancel => 'إلغاء';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get phone => 'الهاتف';

  @override
  String get gender => 'الجنس';

  @override
  String get birthDate => 'تاريخ الميلاد';

  @override
  String get address => 'العنوان';
}
