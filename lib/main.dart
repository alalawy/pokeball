import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'service_locator.dart';
import 'utils/colors.dart';

import 'package:google_fonts/google_fonts.dart';

import 'utils/router.dart';

void main() async {
  setupLocator();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Color(0xFF000101),
        textTheme: TextTheme(),
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
