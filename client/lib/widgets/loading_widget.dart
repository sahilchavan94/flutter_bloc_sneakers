import 'package:client/theme/my_theme.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String main;
  final String sub;
  const LoadingWidget({
    super.key,
    required this.main,
    required this.sub,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        30,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(
          30,
        ),
      ),

      //content to be rendered in the loading widget
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            main,
            style: MyTheme.themeData.textTheme.displayLarge,
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            sub,
            style: MyTheme.themeData.textTheme.displaySmall,
          ),
          const SizedBox(
            height: 50,
          ),
          const CircularProgressIndicator(color: Colors.black87,strokeWidth: 1.5,),
        ],
      ),
    );
  }
}
