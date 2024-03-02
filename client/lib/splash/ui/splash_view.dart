import 'package:client/splash/bloc/splash_bloc.dart';
import 'package:client/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  //create a new splash bloc instance 
  //the concept of dependency injection can be used here
  final SplashBloc _splashBloc = SplashBloc();

  @override
  void initState() {
    
    //on page load, throw the event to initialize the internet connection stablity
    _splashBloc.add(InternetConnectionCheckEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(

      
      bloc: _splashBloc,


      listener: (context, state) {

        //if the state is failed state then show the snackbar regarding the connection issue
        if (state is InternetConnectionCheckFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Check your internet connection",
                style: MyTheme.themeData.textTheme.displaySmall,
              ),
              backgroundColor: Colors.grey[200],
              padding: const EdgeInsets.only(top: 30, left: 30)));
          Navigator.pushReplacementNamed(context, '/intro');

        }

        //if it is success, then navigate to the home page
        if (state is InternetConnectionCheckSuccessState) {
          Navigator.pushReplacementNamed(context, '/intro');
        }
      },


      //we are not building anything here, so there is only one single scaffold with a circular progress indicator
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "FlutterSneakers",
                  style: MyTheme.themeData.textTheme.displayLarge,
                ),
                Text(
                  "True foot comfort with a solid build",
                  style: MyTheme.themeData.textTheme.displaySmall,
                ),
                const SizedBox(
                  height: 60,
                ),
                const CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 1.5,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
