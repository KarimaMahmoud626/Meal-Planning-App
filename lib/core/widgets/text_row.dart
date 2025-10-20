import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants.dart';

class TextRow extends StatelessWidget {
  const TextRow({super.key, this.title, this.onPressed});

  final String? title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            flex: 0,
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                'See all',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kMainColor,
                  decoration: TextDecoration.underline,
                  decorationColor: kMainColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
