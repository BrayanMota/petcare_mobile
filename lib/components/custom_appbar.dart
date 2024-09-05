import 'package:flutter/material.dart';
import 'package:petcare/utils/custom_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final colorTitle = Colors.white;
  final backgroundColor = CustomColors.primaryColor;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: colorTitle,
        ),
      ),
      backgroundColor: backgroundColor,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        color: Colors.white, // Define a cor do ícone
        onPressed: () {
          Scaffold.of(context).openDrawer(); // Abre o Drawer
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
