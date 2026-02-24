// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get language => 'اللغه';

  @override
  String get language_type => 'العربية';

  @override
  String get appTitle => 'تطبيقي';

  @override
  String get welcomeMessage => 'أهلا بك!';

  @override
  String get chooseLanguage => 'اختر اللغة';

  @override
  String get arabic => 'العربية';

  @override
  String get english => 'الإنجليزية';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get signup => 'إنشاء حساب';

  @override
  String get logout => 'تسجيل الخروج';
}
