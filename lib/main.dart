import 'package:flutter/material.dart';
import 'package:todoapprev/core/application_theme_manager.dart';
import 'package:todoapprev/core/page_route_name.dart';
import 'package:todoapprev/core/route_genetor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      theme: ApplicationThemeManager.themeDataLight,
      initialRoute: PageRouteNames.initial,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}
