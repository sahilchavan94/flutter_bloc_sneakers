import 'package:flutter/material.dart';

class TextfieldWidget extends StatefulWidget {
  //fields which we are going to take
  final String labelText;
  final dynamic validator;
  final Icon icon;
  final TextInputType inputType;
  final TextEditingController textEditingController;
  final bool obscureText;

  const TextfieldWidget(
      {super.key,
      required this.validator,
      required this.labelText,
      required this.icon,
      required this.inputType,
      required this.textEditingController, 
      this.obscureText = false});

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      height: 75,
      child: TextFormField(
        obscureText: widget.obscureText,
        controller: widget.textEditingController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (val) {
          if(widget.labelText == 'Confirm password') return widget.validator();
          return widget.validator(val);
        },
        keyboardType: widget.inputType,
        cursorColor: Colors.black26,
        cursorHeight: 15,
        cursorWidth: 1,
        decoration: InputDecoration(
          errorStyle: const TextStyle(
              fontSize: 13, letterSpacing: .1, fontWeight: FontWeight.w400),
          contentPadding: const EdgeInsets.all(14),
          label: Text(widget.labelText),
          labelStyle: const TextStyle(
              fontSize: 16,
              letterSpacing: .1,
              fontWeight: FontWeight.w300,
              color: Colors.black),
          prefixIcon: widget.icon,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
