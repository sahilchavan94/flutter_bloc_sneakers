import 'package:client/theme/my_theme.dart';
import 'package:flutter/material.dart';

class UserDataItem extends StatefulWidget {
  final String userData;
  final Icon userDataIcon;
  final bool obscureText;

  const UserDataItem({
    Key? key,
    required this.userData,
    required this.userDataIcon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _UserDataItemState createState() => _UserDataItemState();
}

class _UserDataItemState extends State<UserDataItem> {
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.userDataIcon,
              const SizedBox(width: 25),
              Text(
                isObscure ? "!@#\$%^&*" : widget.userData,
                style: MyTheme.themeData.textTheme.displayMedium,
              ),
            ],
          ),
          if (widget.obscureText)
            InkWell(
              onTap: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              child: Icon(
                isObscure ? Icons.visibility : Icons.visibility_off,
                size: 18,
              ),
            )
        ],
      ),
    );
  }
}