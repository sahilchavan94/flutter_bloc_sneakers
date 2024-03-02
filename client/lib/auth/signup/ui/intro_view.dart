import 'package:client/theme/my_theme.dart';
import 'package:client/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      //this container will hold the background image
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
                image: AssetImage("assets/intro.png"),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high)),

        //column to display the text and the button
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 40, bottom: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //large text to display
              Text(
                "Enhance your sneaker experience to the next level with Flutter Sneakers.",
                style: MyTheme.themeData.textTheme.headlineLarge,
              )
                  .animate()
                  .fadeIn(
                      duration: const Duration(milliseconds: 6500),
                      curve: Curves.fastLinearToSlowEaseIn)
                  .slideX(
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.fastLinearToSlowEaseIn),

              //sized box for spacing
              const SizedBox(
                height: 25,
              ),

              //small text for description
              Text(
                "Dive into a world where innovation meets style, where every step is cushioned with technology and every stride is performance and fashion.",
                style: MyTheme.themeData.textTheme.bodySmall,
              )
                  .animate(delay: const Duration(milliseconds: 200))
                  .fadeIn(
                      duration: const Duration(milliseconds: 6500),
                      curve: Curves.fastLinearToSlowEaseIn)
                  .slideX(
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.fastLinearToSlowEaseIn),

              //sizedbox for spacing
              const SizedBox(
                height: 25,
              ),

              //button widget for processing further
              ButtonWidget(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/signup");
                },
                text: "Get started",
                icon: const Icon(
                  CupertinoIcons.arrow_right,
                  size: 19,
                  color: Colors.white,
                ),
                width: double.maxFinite,
              )
                  .animate(delay: const Duration(milliseconds: 400))
                  .fadeIn(
                      duration: const Duration(milliseconds: 6500),
                      curve: Curves.fastLinearToSlowEaseIn)
                  .slideX(
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.fastLinearToSlowEaseIn)
            ],
          ),
        ),
      ),
    );
  }
}
