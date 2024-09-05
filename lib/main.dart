import 'package:flutter/material.dart';
import 'package:petcare/utils/custom_theme.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veterinary App',
      theme: CustomThemeData().themeData(),
      initialRoute: RoutePaths.home,
      routes: RoutePaths.getRoutes(),
    );
  }
}
