import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/app/utils/validator_services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppPinCodeField extends StatelessWidget {
  const AppPinCodeField({
    super.key,
    required this.controller,
    this.length = 6,
    this.validator,
    this.onChanged,
  });

  final TextEditingController controller;
  final int length;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFFCABEB4);

    return PinCodeTextField(
      appContext: context,
      length: length,
      obscureText: false,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      controller: controller,
      autoDisposeControllers: false,
      validator: validator ?? ValidatorService.validateSimpleField,
      animationDuration: const Duration(milliseconds: 300),
      onChanged: onChanged ?? (_) {},
      textStyle: MyFonts.dmSans.copyWith(
        color: const Color(0xFF403731),
        fontSize: 16.sp(context),
        fontWeight: FontWeight.w600,
      ),
      pinTheme: PinTheme(
        selectedColor: borderColor,
        activeColor: borderColor,
        inactiveColor: borderColor,
        disabledColor: borderColor,
        errorBorderColor: borderColor,
        borderWidth: 0.6,
        selectedBorderWidth: 0.6,
        activeBorderWidth: 0.6,
        inactiveBorderWidth: 0.6,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(24.r(context)),
        fieldHeight: 47.h(context),
        fieldWidth: 47.w(context),
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedFillColor: Colors.white,
      ),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
    );
  }
}
