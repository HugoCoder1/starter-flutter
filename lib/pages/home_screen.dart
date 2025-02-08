import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Bienvenue sur la page home"),
          ),
          ElevatedButton(
              onPressed: () {
                context.go("/about");
              },
              child: Text("Appuiyer pour naviguer vers about"))
        ],
      ),
    );
  }
}
