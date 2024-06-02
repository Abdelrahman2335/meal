import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    String complexityLevel = meal.complexity.toString();
    if (complexityLevel == Complexity.simple.toString()) {
      complexityLevel = "Simple";
    } else if (complexityLevel == Complexity.challenging.toString()) {
      complexityLevel = "Challenging";
    } else if (complexityLevel == Complexity.hard.toString()) {
      complexityLevel = "Hard";
    } else {
      complexityLevel = "Unknown";
    }
    String affordability = meal.affordability.toString();
    if (affordability == Affordability.affordable.toString()) {
      affordability = "Affordable";
    } else if (affordability == Affordability.pricey.toString()) {
      affordability = "Pricey";
    } else if (affordability == Affordability.luxurious.toString()) {
      affordability = "Luxurious";
    } else {
      affordability = "Unknown";
    }
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      clipBehavior: Clip.hardEdge,

      /// the shape that you have done in the Card will not apply on the child,
      /// so we will use clipBehavior to control this child and apply the shape
      child: InkWell(
          onTap: () {},
          child: Stack(
            children: [
              /// FadeInImage is a widget that allow you to set a placeholder image while the real image loading
              FadeInImage(
                placeholder:

                    ///we used the transparentImage package so we can use it with MemoryImage,
                    /// simply it give you transparent image while the real image loading
                    MemoryImage(kTransparentImage),
                // const AssetImage("images/waiting.png"),
                image: NetworkImage(meal.imageUrl),
              ),

              /// Using Positioned you can now choose where to sit your widgets in the Container
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 30),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      ///this will make max lines 2 and if there is any overflow will write => ...
                      Text(
                        meal.title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.schedule),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  "${meal.duration} min",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.work_outline),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  complexityLevel,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.attach_money),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  affordability,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
