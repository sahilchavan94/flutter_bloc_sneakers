import 'package:client/auth/signup/bloc/signup_bloc.dart';
import 'package:client/auth/signup/models/user_model.dart';
import 'package:client/auth/validators/validators.dart';
import 'package:client/theme/my_theme.dart';
import 'package:client/global_widgets/button_widget.dart';
import 'package:client/global_widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalDetailsFormView extends StatelessWidget {
  const PersonalDetailsFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstnameController = TextEditingController();
    final TextEditingController lastnameController = TextEditingController();
    final TextEditingController mobileController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    //creating a form key
    final formKey = GlobalKey<FormState>();

    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupFormValidationFailedState) {
          //showing the snackbar if the validation fails
          //show a snackbar with a relevant message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Check your credentials",
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
        //navigate to the next page if the validation is succeeded
        if (state is SignupFormValidationSuccessState) {
          Navigator.pushReplacementNamed(context, "/account-preview");
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                children: [
                  //padding
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Icon(
                      CupertinoIcons.shopping_cart,
                      size: 35,
                      color: Colors.grey[900]!,
                    ),
                  ),

                  Text(
                    "Create your account to explore the diversity of distinct styles",
                    style: MyTheme.themeData.textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),

                  //const sized box
                  const SizedBox(height: 18),

                  //form which will include all the input fields
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        //first name input field
                        TextfieldWidget(
                          textEditingController: firstnameController,
                          validator: Validator.validateNames,
                          labelText: 'First name',
                          icon: const Icon(
                            CupertinoIcons.person_crop_circle_fill,
                            color: Colors.black54,
                            size: 20,
                          ),
                          inputType: TextInputType.text,
                        ),

                        //last name input field
                        TextfieldWidget(
                          validator: Validator.validateNames,
                          labelText: 'Last name',
                          icon: const Icon(
                            CupertinoIcons.person_crop_circle_fill,
                            color: Colors.black54,
                            size: 18,
                          ),
                          inputType: TextInputType.text,
                          textEditingController: lastnameController,
                        ),

                        //mobile number input
                        TextfieldWidget(
                          validator: Validator.validatePhone,
                          labelText: 'Mobile',
                          icon: const Icon(
                            CupertinoIcons.phone_fill,
                            color: Colors.black54,
                            size: 20,
                          ),
                          inputType: TextInputType.phone,
                          textEditingController: mobileController,
                        ),

                        //email input field
                        TextfieldWidget(
                          validator: Validator.validateEmail,
                          labelText: 'Email',
                          icon: const Icon(
                            CupertinoIcons.mail_solid,
                            color: Colors.black54,
                            size: 20,
                          ),
                          inputType: TextInputType.emailAddress,
                          textEditingController: emailController,
                        ),

                        //password input field
                        TextfieldWidget(
                          obscureText: true,
                          validator: Validator.validatePassword,
                          labelText: 'Password',
                          icon: const Icon(
                            CupertinoIcons.lock_fill,
                            color: Colors.black54,
                            size: 20,
                          ),
                          inputType: TextInputType.text,
                          textEditingController: passwordController,
                        ),

                        //confirm password input field
                        TextfieldWidget(
                          obscureText: true,
                          validator: () {
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              return "Passwords doesn't match";
                            }
                            return null;
                          },
                          labelText: 'Confirm password',
                          icon: const Icon(
                            CupertinoIcons.lock_open_fill,
                            color: Colors.black54,
                            size: 20,
                          ),
                          inputType: TextInputType.text,
                          textEditingController: confirmPasswordController,
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        //button widget
                        ButtonWidget(
                          onPressed: () {
                            //dispatching an event to validate the form
                            context.read<SignupBloc>().add(
                                  SignupFormValidationEvent(
                                    formkey: formKey,
                                    userModel: UserModel(
                                      firstname:
                                          firstnameController.text.trim(),
                                      lastname: lastnameController.text.trim(),
                                      mobile: mobileController.text.trim(),
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ),
                                  ),
                                );
                          },
                          text: 'Next',
                          icon: const Icon(
                            CupertinoIcons.arrow_right,
                            size: 17,
                            color: Colors.white,
                          ),
                          width: double.maxFinite,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account",
                        style: MyTheme.themeData.textTheme.displaySmall,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      const Text("Signin"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
