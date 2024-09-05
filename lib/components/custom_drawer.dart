import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petcare/routes.dart';
import 'package:petcare/utils/custom_colors.dart';

class DrawerListTile extends StatelessWidget {
  final String title;
  final Icon icon;
  final VoidCallback? onTap;

  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: icon,
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.black,
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final email = FirebaseAuth.instance.currentUser?.email ?? '';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Nome do Usuário'),
            accountEmail: Text(email),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: CustomColors.primaryColor,
              ),
            ),
            decoration: const BoxDecoration(
              color: CustomColors.primaryColor,
            ),
          ),
          DrawerListTile(
            title: 'Perfil',
            icon: const Icon(
              Icons.person,
            ),
            onTap: () {
              Navigator.pushNamed(context, RoutePaths.profile);
            },
          ),
          DrawerListTile(
            title: 'Sair',
            icon: const Icon(Icons.logout),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutePaths.login,
                (route) => false,
              );
            },
          ),
          const Spacer(), // Adiciona espaço no final do Drawer
        ],
      ),
    );
  }
}
