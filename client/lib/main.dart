import 'package:client/auth/signup/bloc/signup_bloc.dart';
import 'package:client/auth/signup/ui/account_preview.dart';
import 'package:client/auth/signup/ui/intro_view.dart';
import 'package:client/auth/signup/ui/personal_details_form_view.dart';
import 'package:client/home/ui/home_view.dart';
import 'package:client/splash/ui/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
        routes: {
          "/home": (context) => const HomeView(),
          "/intro": (context) => const IntroView(),
          "/signup": (context) => const PersonalDetailsFormView(),
          "/account-preview": (context) => const AccountPreview()
        },
      ),
    );
  }
}
