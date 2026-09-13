import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class TrackerMedicineBottomSheet extends StatelessWidget {
  const TrackerMedicineBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w(context),
            right: 20.w(context),
            top: 28.h(context),
            bottom: 16.h(context),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add new medicine',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 24.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 8.h(context)),
              Text(
                'Add new medicine to your tracker',
                style: MyFonts.dmSans.copyWith(
                  color: const Color(0xFF9A8E86),
                  fontSize: 11.sp(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 24.h(context)),
              const _MedicineField(hintText: 'Enter Name'),
              SizedBox(height: 14.h(context)),
              const _MedicineField(hintText: 'Enter Dose'),
              SizedBox(height: 14.h(context)),
              Row(
                children: [
                  const Expanded(
                    child: _MedicineField(
                      hintText: 'Frequency',
                      suffixIcon: Icons.keyboard_arrow_down,
                    ),
                  ),
                  SizedBox(width: 12.w(context)),
                  const Expanded(
                    child: _MedicineField(
                      hintText: 'Type',
                      suffixIcon: Icons.keyboard_arrow_down,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.h(context)),
              Row(
                children: [
                  const Expanded(
                    child: _MedicineField(
                      hintText: 'Start date',
                      suffixIcon: Icons.calendar_today,
                    ),
                  ),
                  SizedBox(width: 12.w(context)),
                  const Expanded(
                    child: _MedicineField(
                      hintText: 'End date',
                      suffixIcon: Icons.calendar_today,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h(context)),
              SizedBox(
                width: double.infinity,
                height: 54.h(context),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LightThemeColors.buttonColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r(context)),
                    ),
                  ),
                  child: Text(
                    'Update Medicine',
                    style: MyFonts.dmSans.copyWith(
                      fontSize: 13.sp(context),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18.h(context)),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: LightThemeColors.darkBrown,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Cancel Medicine',
                  style: MyFonts.dmSans.copyWith(
                    fontSize: 13.sp(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MedicineField extends StatelessWidget {
  const _MedicineField({
    required this.hintText,
    this.suffixIcon,
  });

  final String hintText;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: MyFonts.dmSans.copyWith(
        color: LightThemeColors.darkBrown,
        fontSize: 12.sp(context),
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: MyFonts.dmSans.copyWith(
          color: const Color(0xFF9A8E86),
          fontSize: 12.sp(context),
          fontWeight: FontWeight.w600,
        ),
        suffixIcon: suffixIcon == null
            ? null
            : Icon(
                suffixIcon,
                color: LightThemeColors.darkBrown,
                size: 18.sp(context),
              ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w(context),
          vertical: 14.h(context),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r(context)),
          borderSide: const BorderSide(color: Color(0xFFE8DED4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r(context)),
          borderSide: const BorderSide(color: Color(0xFFE8DED4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r(context)),
          borderSide: const BorderSide(color: Color(0xFFB9A99B)),
        ),
      ),
    );
  }
}
