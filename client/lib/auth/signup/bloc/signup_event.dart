part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

//event to navigate from the intro screen to the signup screen
class SignupNavigateToIntroEvent extends SignupEvent {}

//event which will be thrown by the ui if the next button in the form is clicked
class SignupFormValidationEvent extends SignupEvent {
  final GlobalKey<FormState> formkey;
  final UserModel userModel;
  SignupFormValidationEvent({required this.userModel, required this.formkey});
}

//event which will be thrown when the user clicks on the finish button
class SignupFinishButtonClickedEvent extends SignupEvent {
  final UserModel userModel;

  SignupFinishButtonClickedEvent({
    required this.userModel,
  });
}
