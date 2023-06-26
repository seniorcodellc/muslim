import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app_localization.dart';

class LocalizationConfiguration extends StatelessWidget {
  final Widget child;
  const LocalizationConfiguration({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      path: AppLocalization.translationPath,
      fallbackLocale: const Locale('ar', 'EG'),

      child: child,
    );
  }
}
