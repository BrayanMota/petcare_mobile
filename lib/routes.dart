import 'package:flutter/material.dart';
import 'package:petcare/views/disease/apresentations.dart';
import 'package:petcare/views/disease/detail.dart';
import 'package:petcare/views/disease/list.dart';
import 'package:petcare/views/home.dart';
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
  static const String listDisease = '/list_disease';
  static const String listPet = '/list_pet';
  static const String createPet = '/create_pet';
  static const String viewDisease = '/view_disease';
  static const String presentationDisease = '/presentation_disease';
  static const String viewPet = '/view_pet';
  static const String updatePet = '/update_pet';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forget_password';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomePage(),
      listDisease: (context) => const ListDiseasesPage(),
      listPet: (context) => const ListPetsPage(),
      createPet: (context) => const CreatePetPage(),
      viewDisease: (context) => const ViewDiseasePage(),
      presentationDisease: (context) => const PresentationDiseasePage(),
      viewPet: (context) => const ViewPetPage(),
      updatePet: (context) => const UpdatePetPage(),
      login: (context) => LoginPage(),
      register: (context) => const RegisterPage(),
      forgetPassword: (context) => const ForgetPasswordPage(),
      profile: (context) => const ProfilePage(),
    };
  }
}
