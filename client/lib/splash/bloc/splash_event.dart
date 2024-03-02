part of 'splash_bloc.dart';

@immutable
sealed class SplashEvent {}

//event that will be thrown direct right after the splash screen is built
class InternetConnectionCheckEvent extends SplashEvent {}
