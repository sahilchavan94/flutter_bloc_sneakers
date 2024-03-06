import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    //handling the check internet event
    on<InternetConnectionCheckEvent>(_checkInternetConnection);
  }

  //method to handle the event for checking internet connection
  FutureOr<void> _checkInternetConnection(
      InternetConnectionCheckEvent event, Emitter<SplashState> emit) async {
    emit(SplashInternetConnectionCheckLoadingState());
    bool isConnected = await InternetConnection().hasInternetAccess;

    //if the user is not connected to the internet then show the snackbar
    if (!isConnected) {
      emit(SplashInternetConnectionCheckFailedState());
      return;
    }

    //if the internet connection is available, then check the user is signed in or not
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //if the user is signed in
    if (prefs.getString("authToken") != null) {
      emit(SplashInternetConnectionCheckSuccessUserSignedInState());
      return;
    }

    //if the user is signed out
    emit(SplashInternetConnectionCheckSuccessUserSignedInState());
  }
}
