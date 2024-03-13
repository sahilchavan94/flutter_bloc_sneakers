import 'package:client/theme/my_theme.dart';
import 'package:flutter/material.dart';

class HomeProductTileWidget extends StatelessWidget {
  const HomeProductTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/shoe2.png",
            width: MediaQuery.of(context).size.width * .37,
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Air Jordan 1 Low",
                  style: MyTheme.themeData.textTheme.displayLarge!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                Text(
                  "Always in, always fresh. The Air Jordan 1 Low sets you up with a piece of Jordan history, heritage comfortable all day",
                  style: MyTheme.themeData.textTheme.displaySmall!.copyWith(
                    height: 1.1,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "3 Colours",
                  style: MyTheme.themeData.textTheme.displaySmall,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "\$ 14.985",
                  style: MyTheme.themeData.textTheme.displayMedium!.copyWith(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
