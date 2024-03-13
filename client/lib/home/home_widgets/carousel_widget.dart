import 'package:carousel_slider/carousel_slider.dart';
import 'package:client/home/data/data_values.dart';
import 'package:client/theme/my_theme.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final buttonCarouselController = CarouselController();
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          //controller
          carouselController: buttonCarouselController,

          //options
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * .24,
            viewportFraction: .92,
            initialPage: currentIndex,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(
              seconds: 3,
            ),
            autoPlayAnimationDuration: const Duration(
              milliseconds: 800,
            ),
            autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),

          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(alignment: Alignment.bottomLeft, children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/carousel_images/c$i.png",
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.darken,
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      taglines[i - 1],
                      style: MyTheme.themeData.textTheme.headlineLarge!
                          .copyWith(fontSize: 35, letterSpacing: .6),
                    ),
                  ),
                ]);
              },
            );
          }).toList(),
        ),

        //controller buttons
        SizedBox(
          height: 15,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  buttonCarouselController.animateToPage(
                    index,
                    duration: const Duration(
                      milliseconds: 800,
                    ),
                    curve: Curves.fastEaseInToSlowEaseOut,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Icon(
                    Icons.circle,
                    size: 10,
                    color:
                        currentIndex == index ? Colors.black : Colors.grey[400],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
