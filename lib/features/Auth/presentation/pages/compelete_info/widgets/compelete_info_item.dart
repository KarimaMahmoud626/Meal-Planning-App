import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/widgets/custom_text_field.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';

class CompeleteInfoItem extends StatelessWidget {
  const CompeleteInfoItem({
    super.key,
    required this.text,
    this.keyboardType,
    this.maxLines,
  });

  final String text;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0C0B0B),
          ),
          textAlign: TextAlign.left,
        ),
        VerticalSpace(1.5),
        CustomTextField(keyboardType: keyboardType, maxLines: maxLines),
      ],
    );
  }
}
