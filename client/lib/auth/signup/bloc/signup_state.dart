part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

//state for navigating to the signup page 
class SignupNavigateToIntroState extends SignupState {}

//state to be emitted when the validation is succedded it takes the user model
class SignupFormValidationSuccessState extends SignupState {
  final UserModel userModel;
  SignupFormValidationSuccessState({required this.userModel});
}

//state to be emitted when the validation is failed
class SignupFormValidationFailedState extends SignupState {}

//state to be emitted when the sign up process in in loading state 
class SignupLoadingState extends SignupState {}

//state to be emitted when the signup succeeds 
class SignupSuccessState extends SignupState {
  final String message;
  SignupSuccessState({required this.message});
}

//state to be emitted when the signup fails 
class SignupFailureState extends SignupState {}


