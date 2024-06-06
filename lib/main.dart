import 'package:delivery_app/app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:delivery_app/injector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:delivery_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initInjector();
  runApp(DevicePreview(
      enabled: false,
      builder: (context) {
        return const App();
      }));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
