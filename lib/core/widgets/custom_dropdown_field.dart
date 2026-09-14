import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class CustomDropdownField extends StatefulWidget {
  const CustomDropdownField({
    super.key,
    required this.items,
    this.value,
    this.label,
    this.hintText,
    this.onChanged,
    this.validator,
  });

  final List<String> items;
  final String? value;
  final String? label;
  final String? hintText;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String>? validator;

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant CustomDropdownField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _selectedValue = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedValue,
      validator: widget.validator,
      isExpanded: true,
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: const Color(0xFF403731),
        size: 20.sp(context),
      ),
      style: MyFonts.dmSans.copyWith(
        color: const Color(0xFF403731),
        fontSize: 13.sp(context),
        fontWeight: FontWeight.w500,
      ),
      dropdownColor: Colors.white,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: MyFonts.dmSans.copyWith(
          color: const Color(0xFFAFA8A2),
          fontSize: 12.sp(context),
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Colors.white,
        constraints: BoxConstraints(minHeight: 48.h(context)),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 18.w(context),
          vertical: 14.h(context),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r(context)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r(context)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r(context)),
          borderSide: const BorderSide(color: Color(0xFF8B735F)),
        ),
      ),
      items: widget.items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedValue = value;
        });
        widget.onChanged?.call(value);
      },
    );
  }
}
