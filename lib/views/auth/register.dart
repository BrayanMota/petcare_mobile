import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petcare/routes.dart';

import '../../components/auth_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
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

    Future<bool> _register() async {
      String nome = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      setState(() {
        _isLoading = true;
      });
      try {
        final signUp = _auth.createUserWithEmailAndPassword;
        UserCredential userCredential = await signUp(
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

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cadastra-se no PetCare',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            AuthFormField(
              label: 'Nome',
              controller: nameController,
              icon: const Icon(Icons.person),
            ),
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
            ElevatedButton(
              onPressed: () {
                _register().then((value) {
                  if (value) {
                    Navigator.pop(context);
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                'Cadastrar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Já tem conta? Faça login',
                style: TextStyle(
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
