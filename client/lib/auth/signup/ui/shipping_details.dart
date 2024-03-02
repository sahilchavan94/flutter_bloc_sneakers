import 'package:client/auth/validators/validators.dart';
import 'package:client/theme/my_theme.dart';
import 'package:client/widgets/button_widget.dart';
import 'package:client/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShippingDetailsFormView extends StatelessWidget {
  const ShippingDetailsFormView({super.key});

  @override
  Widget build(BuildContext context) {
    //create a signup bloc object

    final TextEditingController countryController = TextEditingController();
    final TextEditingController stateController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController pincodeController = TextEditingController();
    final TextEditingController landmarkController = TextEditingController();
    final TextEditingController streetaddressController =
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
                  child: Icon(Icons.local_shipping_rounded,
                      size: 40, color: Colors.grey[900]!),
                ),
    
                Text(
                  "Add your shipping address details",
                  style: MyTheme.themeData.textTheme.displayLarge,
                ),
    
                //const sized box
                const SizedBox(height: 18),
    
                //form which will include all the input fields
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        //country input field
                        TextfieldWidget(
                          textEditingController: countryController,
                          validator: Validator.validatePlace,
                          labelText: 'Country',
                          icon: const Icon(
                            CupertinoIcons.map_fill,
                            color: Colors.black54,
                            size: 20,
                          ),
                          inputType: TextInputType.text,
                        ),
    
                        //state input field
                        TextfieldWidget(
                          validator: Validator.validatePlace,
                          labelText: 'State',
                          icon: const Icon(
                            Icons.location_city_rounded,
                            color: Colors.black54,
                            size: 18,
                          ),
                          inputType: TextInputType.text,
                          textEditingController: stateController,
                        ),
    
                        //city input
                        TextfieldWidget(
                          validator: Validator.validatePlace,
                          labelText: 'City',
                          icon: const Icon(
                            Icons.home_filled,
                            color: Colors.black54,
                            size: 20,
                          ),
                          inputType: TextInputType.phone,
                          textEditingController: cityController,
                        ),
    
                        //pincode field
                        TextfieldWidget(
                          validator: Validator.validatePincode,
                          labelText: 'Pincode',
                          icon: const Icon(
                            CupertinoIcons.pin_fill,
                            color: Colors.black54,
                            size: 20,
                          ),
                          inputType: TextInputType.emailAddress,
                          textEditingController: pincodeController,
                        ),
    
                        //landmark input field
                        TextfieldWidget(
                          validator: Validator.validatePlace,
                          labelText: 'Landmark',
                          icon: const Icon(
                            CupertinoIcons.location_solid,
                            color: Colors.black54,
                            size: 20,
                          ),
                          inputType: TextInputType.text,
                          textEditingController: landmarkController,
                        ),
    
                        //confirm password input field
                        TextfieldWidget(
                          validator: Validator.validateStreetAddress,
                          labelText: 'Street address',
                          icon: const Icon(
                            Icons.streetview,
                            color: Colors.black54,
                            size: 20,
                          ),
                          inputType: TextInputType.text,
                          textEditingController: streetaddressController,
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
                            width: double.maxFinite),
    
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account",
                              style:
                                  MyTheme.themeData.textTheme.displaySmall,
                            ),
                            const SizedBox(width: 3),
                            Text("Signin",
                                style:
                                    MyTheme.themeData.textTheme.labelSmall),
                          ],
                        )
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
