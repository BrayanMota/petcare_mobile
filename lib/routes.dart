import 'package:flutter/material.dart';
import 'views/auth/forget_password.dart';
import 'views/auth/login.dart';
import 'views/auth/register.dart';
import 'views/pet/list.dart';
import 'views/pet/create.dart';
import 'views/pet/view.dart';
import 'views/pet/update.dart';
import 'views/user/profile.dart';

class RoutePaths {
  static const String home = '/';
  static const String createPet = '/create_pet';
  static const String viewPet = '/view_pet';
  static const String updatePet = '/update_pet';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forget_password';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => ListPetsPage(),
      createPet: (context) => const CreatePetPage(),
      viewPet: (context) => const ViewPetPage(),
      updatePet: (context) => const UpdatePetPage(),
      login: (context) => LoginPage(),
      register: (context) => const RegisterPage(),
      forgetPassword: (context) => const ForgetPasswordPage(),
      profile: (context) => const ProfilePage(),
    };
  }
}
