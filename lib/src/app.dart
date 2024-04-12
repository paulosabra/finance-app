import 'package:flutter/material.dart';
import 'package:mono/src/constants/routes.dart';
import 'package:mono/src/constants/theme.dart';

class MonoApp extends StatelessWidget {
  const MonoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
      theme: appTheme,
    );
  }
}
