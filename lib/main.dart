import 'package:delivery_app/app.dart';
import 'package:delivery_app/core/utils/local_database/local_database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:delivery_app/injector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:delivery_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initStore();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initInjector();
  await openStore();
  runApp(const App());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
