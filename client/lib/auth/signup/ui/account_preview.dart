import 'package:client/auth/signup/bloc/signup_bloc.dart';
import 'package:client/theme/my_theme.dart';
import 'package:client/widgets/button_widget.dart';
import 'package:client/widgets/loading_widget.dart';
import 'package:client/widgets/userdataitem_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPreview extends StatefulWidget {
  const AccountPreview({super.key});

  @override
  State<AccountPreview> createState() => _AccountPreviewState();
}

class _AccountPreviewState extends State<AccountPreview> {
  @override
  Widget build(BuildContext context) {
    //getting the success state which holds the user data through context.watch,
    //researching if any other better method is there for the same

    //bloc consumer
    //here we are not creating a separate bloc instance instead we are providing a single signup bloc instance to the entire application
    return Scaffold(
      body: BlocConsumer<SignupBloc, SignupState>(
        //listener to perform actions
        listener: (context, state) {

          //if the signup process is successfully completed
          if (state is SignupSuccessState) {
            Navigator.pushReplacementNamed(
              context,
              "/home",
            );

            //show a snackbar with a relevant message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: MyTheme.themeData.textTheme.displaySmall,
                ),
                backgroundColor: Colors.grey[200],
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                ),
              ),
            );
          }


          //if the signup process fails 
          if (state is SignupFailureState) {
            Navigator.pushReplacementNamed(
              context,
              "/intro",
            );

            //show a snackbar with a relevant message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Failed to create your account",
                  style: MyTheme.themeData.textTheme.displaySmall,
                ),
                backgroundColor: Colors.grey[200],
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                ),
              ),
            );
          }

        },



        //builder to build the UI
        builder: (context, state) {
          if (state is SignupLoadingState) {
            return const LoadingWidget(
              main: "Creating Account",
              sub: " Be patient while we process your request",
            );
          }

          if (state is SignupFailureState) {}

          if (state is SignupFormValidationSuccessState) {
            return Scaffold(
              body: SafeArea(
                //padding from all sides
                child: Padding(
                  padding: const EdgeInsets.all(
                    35.0,
                  ),

                  //this column will hold all the entire screen content
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Account preview",
                        style: MyTheme.themeData.textTheme.displayLarge,
                      ),

                      const SizedBox(height: 6,),
                      Text(
                        "Check whether you are good to go or not",
                        style: MyTheme.themeData.textTheme.displaySmall,
                      ),

                      const SizedBox(
                        height: 40,
                      ),

                      //user data for the preview, to verfiy before user creates account
                      UserDataItem(
                        userData:
                            "${state.userModel.firstname} ${state.userModel.lastname}",
                        userDataIcon: const Icon(
                          CupertinoIcons.person_alt,
                          color: Colors.black87,
                          size: 18,
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      UserDataItem(
                        userData: state.userModel.mobile,
                        userDataIcon: const Icon(
                          CupertinoIcons.phone_fill,
                          color: Colors.black87,
                          size: 18,
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      UserDataItem(
                        userData: state.userModel.email,
                        userDataIcon: const Icon(
                          CupertinoIcons.mail_solid,
                          color: Colors.black87,
                          size: 18,
                        ),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      UserDataItem(
                        obscureText: true,
                        userData: state.userModel.password,
                        userDataIcon: const Icon(
                          CupertinoIcons.lock_fill,
                          color: Colors.black87,
                          size: 18,
                        ),
                      ),

                      const SizedBox(
                        height: 35,
                      ),

                      ButtonWidget(
                        onPressed: () {
                          context.read<SignupBloc>().add(
                                SignupFinishButtonClickedEvent(
                                  userModel: state.userModel,
                                ),
                              );
                        },
                        text: 'Finish',
                        icon: const Icon(
                          CupertinoIcons.arrow_right,
                          color: Colors.white,
                          size: 16,
                        ),
                        width: double.maxFinite,
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}