import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components/auth_form_field.dart';
import '../../routes.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<bool> _login() async {
    String email = emailController.text;
    String password = passwordController.text;
    setState(() {
      _isLoading = true;
    });
    try {
      final signIn = _auth.signInWithEmailAndPassword;
      UserCredential userCredential = await signIn(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return true;
    } catch (e) {
      showSnackBar('Erro ao tentar fazer login: $e');
      setState(() {
        _isLoading = false;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem-vindo ao PetCare!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            AuthFormField(
              label: 'Email',
              controller: emailController,
              icon: const Icon(Icons.email),
              keyboardType: TextInputType.emailAddress,
            ),
            AuthFormField(
              label: 'Senha',
              controller: passwordController,
              icon: const Icon(Icons.lock),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      _login().then((value) {
                        if (value) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RoutePaths.home,
                            (route) => false,
                          );
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.register,
                );
              },
              child: const Text(
                'Não tem conta? Cadastre-se',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.forgetPassword,
                );
              },
              child: const Text(
                'Esqueceu a senha?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
