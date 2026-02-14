import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';

class TextRow extends StatelessWidget {
  const TextRow({super.key, this.headText = '', this.valueText = ''});
  final String? headText;
  final String? valueText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 4,
      width: SizeConfig.screenWidth! * 0.95,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              headText!,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 0,
            child: Text(
              valueText!,
              style: TextStyle(
                color: kMainColor,
                fontSize: 16,
                fontWeight: FontWeight.w200,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
