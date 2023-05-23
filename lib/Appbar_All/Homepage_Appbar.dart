import 'package:flutter/material.dart';

class Homepage_Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final VoidCallback onPressed;

  const Homepage_Appbar(
      {super.key, required this.titleText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titleText,
        style: const TextStyle(fontSize: 25),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.logout),
              Text("logout"),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
