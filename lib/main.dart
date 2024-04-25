import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mono/firebase_options.dart';
import 'package:mono/src/app.dart';
import 'package:mono/src/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initHiveForFlutter();

  setupDependecies();
  runApp(const MonoApp());
}
