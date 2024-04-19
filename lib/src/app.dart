import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mono/src/constants/routes.dart';
import 'package:mono/src/constants/theme.dart';
import 'package:mono/src/core/extensions/localization_extensions.dart';

class MonoApp extends StatelessWidget {
  const MonoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      onGenerateTitle: (context) => context.locales.appTitle,
      routes: AppRoutes.routes,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: appTheme,
    );
  }
}
