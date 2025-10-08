import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/widgets/favourite_icon_button.dart';

class SuggestedMealCard extends StatelessWidget {
  const SuggestedMealCard({super.key, this.mealName, this.imagePath});

  final String? mealName;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 20,
      width: SizeConfig.defaultSize! * 25,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            VerticalSpace(1),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: Image.asset(
                          imagePath!,
                          height: SizeConfig.defaultSize! * 13,
                          width: SizeConfig.defaultSize! * 22,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: SizeConfig.defaultSize! * 2,
                  right: SizeConfig.defaultSize! * 9,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: kMainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'BUY NOW',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // Positioned(
                //   bottom: SizeConfig.defaultSize! * 8.5,
                //   left: SizeConfig.defaultSize! * 18,
                //   child: FavouriteIconButton(
                //     isInitiallyLiked: false,
                //     itemId: '',
                //   ),
                // ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                mealName!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
