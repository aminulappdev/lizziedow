import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.label,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.focusNode,
    this.textInputAction,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.validator,
    this.maxLines,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.borderSide,
    this.enabledBorderSide,
    this.focusedBorderSide,
    this.borderRadius,
  });

  final TextEditingController controller;
  final String? label;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool readOnly;
  final BorderSide? borderSide;
  final BorderSide? enabledBorderSide;
  final BorderSide? focusedBorderSide;
  final double? borderRadius;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.obscureText != widget.obscureText) {
      _isObscured = widget.obscureText;
    }
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(
      widget.borderRadius ?? 10.r(context),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: _isObscured,
          focusNode: widget.focusNode,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          onTap: widget.onTap,
          validator: widget.validator,
          maxLines: widget.maxLines ?? 1,
          readOnly: widget.readOnly,
          style: MyFonts.dmSans.copyWith(
            color: const Color(0xFF403731),
            fontSize: 13.sp(context),
            fontWeight: FontWeight.w500,
          ),
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
            suffixIcon: Padding(
              padding: EdgeInsets.all(18.w(context)),
              child: widget.suffixIcon,
            ),
            prefixIcon: widget.prefixIcon,
            border: OutlineInputBorder(
              borderRadius: radius,
              borderSide: widget.borderSide ?? BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide: widget.enabledBorderSide ?? BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: radius,
              borderSide:
                  widget.focusedBorderSide ??
                  const BorderSide(color: Color(0xFF8B735F)),
            ),
          ),
        ),
      ],
    );
  }
}
