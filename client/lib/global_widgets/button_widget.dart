import 'package:client/theme/my_theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Icon icon;
  final double width;
  final Function? onPressed;
  const ButtonWidget(
      {super.key,
      required this.text,
      required this.icon,
      required this.width,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onPressed!();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          height: 55,
          width: width,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: MyTheme.themeData.textTheme.bodySmall,
              ),
              const SizedBox(width: 5),
              icon
            ],
          ),
        ),
      ),
    );
  }
}
