import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    //handling the check internet event
    on<InternetConnectionCheckEvent>(_checkInternetConnection);
  }

  //method to handle the event
  FutureOr<void> _checkInternetConnection(
      InternetConnectionCheckEvent event, Emitter<SplashState> emit) async {
    emit(InternetConnectionCheckLoadingState());
    bool isConnected = await InternetConnection().hasInternetAccess;
    if (isConnected) {
      emit(InternetConnectionCheckSuccessState());
      return;
    }
    emit(InternetConnectionCheckFailedState());
  }
}
