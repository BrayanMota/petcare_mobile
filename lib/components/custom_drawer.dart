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
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Nome do Usuário'),
            accountEmail: Text('email@dominio.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: CustomColors.primaryColor,
              ),
            ),
            decoration: BoxDecoration(
              color: CustomColors.primaryColor,
            ),
          ),
          DrawerListTile(
            title: 'Perfil',
            icon: Icon(
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
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutePaths.login,
                (route) => false,
              );
            },
          ),
          Spacer(), // Adiciona espaço no final do Drawer
        ],
      ),
    );
  }
}
