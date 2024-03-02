part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

//state for checking internet connection loading
class InternetConnectionCheckLoadingState extends SplashState {}

//state for internet connection success
class InternetConnectionCheckSuccessState extends SplashState {}

//state for internet connection failed
class InternetConnectionCheckFailedState extends SplashState {}
