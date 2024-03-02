import 'package:client/auth/signup/ui/intro_view.dart';
import 'package:client/home/ui/home_view.dart';
import 'package:client/splash/ui/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return  MaterialApp(
      debugShowCheckedModeBanner: false,
        home: const SplashView(),
        routes: {
          "/home":(context) => const HomeView(),
          "/intro":(context) => const IntroView(),
        },
     );
  }
}



