import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetTranslations extends Translations {
  static const Locale fallbackLocal = Locale('bn', 'BN');

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>
      const <String, Map<String, String>>{
        'bn_BN': <String, String>{
          'app.title': 'Bangla Flutter Api Learning'
        },
        'us_US': <String, String>{
          'app.title': 'Flutter Api Learning'
        },
      };
}
