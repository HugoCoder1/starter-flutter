import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routingo/pages/about_screen.dart';
import 'package:routingo/pages/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return HomeScreenWrapper(); // Use the wrapper here
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'about',
            builder: (BuildContext context, GoRouterState state) {
              return AboutScreenWrapper(); // Use the wrapper here
            },
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _getCurrentIndex(context),
      onTap: (index) {
        if (index == 0) {
          context.go("/");
        } else if (index == 1) {
          context.go("/about");
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "About"),
      ],
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final String location =
        GoRouterState.of(context).uri.toString(); // Get the current location
    if (location == "/") {
      return 0;
    } else if (location == "/about") {
      return 1;
    }
    return 0;
  }
}

class HomeScreenWrapper extends StatelessWidget {
  const HomeScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: HomeScreen(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}

class AboutScreenWrapper extends StatelessWidget {
  const AboutScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: AboutScreen(),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
