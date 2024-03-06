import 'package:bloc/bloc.dart';
import 'package:client/auth/signup/models/user_model.dart';
import 'package:client/auth/signup/repositories/signup_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    //function to navigate from the intro screen to the sign up screen
    on<SignupNavigateToIntroEvent>((event, emit) {
      //simply emit the state for navigation
      emit(SignupNavigateToIntroState());
    });

    //function to handle the validation event
    on<SignupFormValidationEvent>((event, emit) {
      if (event.formkey.currentState!.validate()) {
        //if the validation is succedded then emit the success state
        emit(SignupFormValidationSuccessState(userModel: event.userModel));
        return;
      }
      //if the validation is failed emit the validation failed event
      emit(SignupFormValidationFailedState());
    });

    //function to handle the finish button clicked event
    on<SignupFinishButtonClickedEvent>((event, emit) async {
      //emit the loading state when the process begins
      emit(SignupLoadingState());
      //call the signup method
      try {
        final response = await SignupRepo.createUser(event.userModel);
        if (response["status"] == "success") {

          //store the auth-token within the local storage 
          final SharedPreferences prefs = await SharedPreferences.getInstance();

          //set the auth token with shared preferences
          await prefs.setString("authToken",response["authToken"]);

          //emit the success state
          emit(SignupSuccessState(message: response["message"]));
          return;
        }
        emit(SignupFailureState());
      } catch (e) {
        emit(SignupFailureState());
      }
    });
  }
}
