import 'package:client/home/data/data_values.dart';
import 'package:client/home/home_widgets/carousel_widget.dart';
import 'package:client/home/home_widgets/product_tile_widget.dart';
import 'package:client/theme/my_theme.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: Text(
          "FlutterSneakers",
          style: MyTheme.themeData.textTheme.displayLarge,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.shopping_cart),
          )
        ],
      ),

      //drawer
      drawer: const Drawer(),

      //bottom navigation

      //body
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //container showing the offers and discount
            CarouselWidget(),

            const SizedBox(
              height: 20,
            ),

            //mapping the categories
            SizedBox(
              height: 40,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //mapping the produts
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const HomeProductTileWidget();
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
