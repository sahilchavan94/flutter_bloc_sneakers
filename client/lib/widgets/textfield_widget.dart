import 'package:flutter/material.dart';

class TextfieldWidget extends StatefulWidget {
  // Label text for the text field
  final String labelText;
  // Validator function for input validation
  final dynamic validator;
  // Icon to be displayed as a prefix in the text field
  final Icon icon;
  // Type of keyboard to be displayed
  final TextInputType inputType;
  // Controller for the text field to manage its state
  final TextEditingController textEditingController;
  // Flag to determine whether the text should be obscured (e.g., for passwords)
  final bool obscureText;

  const TextfieldWidget({
    Key? key,
    required this.validator,
    required this.labelText,
    required this.icon,
    required this.inputType,
    required this.textEditingController,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        // Whether the entered text should be obscured (e.g., for passwords)
        obscureText: widget.obscureText,

        // Controller for managing the text field's state
        controller: widget.textEditingController,

        // Validate the input based on the provided validator function
        autovalidateMode: AutovalidateMode.onUserInteraction,

        validator: (val) {
          // Special handling for Confirm Password field, if provided
          if (widget.labelText == 'Confirm password') return widget.validator();
          // Invoke the provided validator function to validate the input
          return widget.validator(val);
        },

        // Type of keyboard to be displayed for text input
        keyboardType: widget.inputType,

        // Styling for the cursor
        cursorColor: Colors.black26,
        cursorHeight: 15,
        cursorWidth: 1,

        // Decoration for the text field
        decoration: InputDecoration(
          // Styling for error messages
          errorStyle: const TextStyle(
            fontSize: 13,
            letterSpacing: .1,
            fontWeight: FontWeight.w400,
          ),

          // Padding around the input content
          contentPadding: const EdgeInsets.all(14),

          // Label text for the text field
          label: Text(widget.labelText),

          // Styling for the label text
          labelStyle: const TextStyle(
            fontSize: 16,
            letterSpacing: .1,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),

          // Prefix icon to be displayed before the input content
          prefixIcon: widget.icon,

          // Border when the input field is enabled
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),

          // Border when the input field is focused
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),

          // Border when the input field has an error
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),

          // Border when the input field is focused and has an error
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
