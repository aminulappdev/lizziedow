import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class ChecklistItemBottomSheet extends StatelessWidget {
  const ChecklistItemBottomSheet({super.key});

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
              'Add new item',
              style: MyFonts.dmSans.copyWith(
                color: LightThemeColors.darkBrown,
                fontSize: 24.sp(context),
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 8.h(context)),
            Text(
              'Add new item to your checklist category',
              style: MyFonts.dmSans.copyWith(
                color: const Color(0xFF9A8E86),
                fontSize: 11.sp(context),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 24.h(context)),
            const _SheetTextField(hintText: 'Enter Title'),
            SizedBox(height: 14.h(context)),
            Row(
              children: [
                const Expanded(
                  child: _SheetTextField(
                    hintText: 'Category',
                    suffixIcon: Icons.keyboard_arrow_down,
                  ),
                ),
                SizedBox(width: 12.w(context)),
                const Expanded(
                  child: _SheetTextField(
                    hintText: 'Enter date',
                    suffixIcon: Icons.calendar_today,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h(context)),
            const _SheetTextField(
              hintText: 'Write description here.....',
              maxLines: 8,
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
                  'Update Item',
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
                'Cancel Item',
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

class _SheetTextField extends StatelessWidget {
  const _SheetTextField({
    required this.hintText,
    this.suffixIcon,
    this.maxLines = 1,
  });

  final String hintText;
  final IconData? suffixIcon;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
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
