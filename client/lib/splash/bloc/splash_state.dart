part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

//state for checking internet connection loading
class SplashInternetConnectionCheckLoadingState extends SplashState {}

//state for internet connection success but the user is signed out
class SplashInternetConnectionCheckSuccessUserSignedOutState extends SplashState {}

//state for internet connection success and the user is signed in
class SplashInternetConnectionCheckSuccessUserSignedInState extends SplashState {}

//state for internet connection failed
class SplashInternetConnectionCheckFailedState extends SplashState {}
