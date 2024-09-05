import 'package:flutter/material.dart';
import 'package:petcare/utils/custom_theme.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetCare',
      debugShowCheckedModeBanner: false,
      theme: CustomThemeData().themeData(),
      initialRoute: RoutePaths.login,
      routes: RoutePaths.getRoutes(),
    );
  }
}
