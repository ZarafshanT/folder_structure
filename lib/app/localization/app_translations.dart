import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {'hello': 'Hello', 'welcome': 'Welcome to My App'},
    'ur_PK': {'hello': 'ہیلو', 'welcome': 'میری ایپ میں خوش آمدید'},
  };
}
