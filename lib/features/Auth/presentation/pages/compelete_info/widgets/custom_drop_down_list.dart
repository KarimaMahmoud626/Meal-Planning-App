import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';

class CustomDropDownList extends StatefulWidget {
  const CustomDropDownList({
    super.key,
    required this.text,
    this.keyboardType,
    this.maxLines,
    this.onChanged,
    this.onSaved,
    this.icon,
    this.validator,
    required this.hint,
    required this.items,
  });
  final String text;
  final TextInputType? keyboardType;
  final int? maxLines;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final IconData? icon;
  final String? Function(String?)? validator;
  final String hint;
  final List<DropdownMenuItem<String>>? items;
  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0C0B0B),
          ),
          textAlign: TextAlign.left,
        ),
        VerticalSpace(1.5),
        DropdownButtonFormField<String>(
          hint: Text(widget.hint),
          value: selectedValue,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          items: widget.items,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value!);
            }
          },
          onSaved: (value) {
            if (widget.onSaved != null) widget.onSaved!(selectedValue);
          },
          validator: widget.validator,
        ),
      ],
    );
  }
}
