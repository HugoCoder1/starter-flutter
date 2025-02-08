import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Bienvue sur la page About"),
          ),
          ElevatedButton(
              onPressed: () {
                context.go("/");
              },
              child: Text("Appuiyer pour naviguer vers home"))
        ],
      ),
    );
  }
}
