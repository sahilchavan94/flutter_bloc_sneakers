import 'package:client/auth/validators/validators.dart';
import 'package:client/theme/my_theme.dart';
import 'package:client/widgets/button_widget.dart';
import 'package:client/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Column(
              children: [
                //padding
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Icon(
                      CupertinoIcons.person_crop_circle_badge_checkmark,
                      size: 40,
                      color: Colors.grey[900]!),
                ),
    
                Text(
                  "Create your account to explore the diversity of distinct styles 🎉",
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
                            },
                            text: 'Next',
                            icon: const Icon(
                              CupertinoIcons.arrow_right,
                              size: 17,
                              color: Colors.white,
                            ),
                            width: double.maxFinite)
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
