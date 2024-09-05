import 'package:flutter/material.dart';
import 'package:petcare/providers/pet_provider.dart';
import 'package:petcare/utils/custom_theme.dart';
import 'package:provider/provider.dart';
import 'routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PetProvider(),
      child: MaterialApp(
        title: 'PetCare',
        debugShowCheckedModeBanner: false,
        theme: CustomThemeData().themeData(),
        initialRoute: RoutePaths.login,
        routes: RoutePaths.getRoutes(),
      ),
    );
  }
}
