import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/custom_dropdown_field.dart';
import 'package:lizziedow/core/widgets/custom_text_field.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class TrackerCycleSection extends StatefulWidget {
  const TrackerCycleSection({super.key});

  @override
  State<TrackerCycleSection> createState() => _TrackerCycleSectionState();
}

class _TrackerCycleSectionState extends State<TrackerCycleSection> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
      child: Column(
        children: [
          SizedBox(height: 10.h(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CrashSafeImage(
                Assets.images.calender02.path,
                width: 24.w(context),
                height: 24.h(context),
              ), 
              SizedBox(width: 8.w(context)),
              Text(
                'Cycle start',
                style: MyFonts.playfairDisplay.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 24.sp(context),
                  fontWeight: FontWeight.w600,
                ), 
              ),
            ],
          ),
          SizedBox(height: 14.h(context)),
          Text(
            "Set the day your current cycle began. The Dashboard's Cycle Day box updates daily from this date",
            textAlign: TextAlign.center,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF7D7169),
              fontSize: 11.sp(context),
              fontWeight: FontWeight.w700,
              height: 1.25,
            ),
          ),
          SizedBox(height: 24.h(context)),
          CustomTextField(
            fillColor: LightThemeColors.cardBg,
            hintText: 'Start date',
            controller: _startDateController,
            readOnly: true,
            onTap: _pickStartDate,
            suffixIcon: GestureDetector(
              onTap: _pickStartDate,
              child: CrashSafeImage(
                Assets.images.calender02.path,
                width: 12.w(context),
                height: 12.h(context),
              ),
            ),
          ),
          SizedBox(height: 16.h(context)),
          CustomTextField(
            fillColor: LightThemeColors.cardBg,
            hintText: 'End date',
            controller: _endDateController,
            readOnly: true,
            onTap: _pickEndDate,
            suffixIcon: GestureDetector(
              onTap: _pickEndDate,
              child: CrashSafeImage(
                Assets.images.calender02.path,
                width: 12.w(context),
                height: 12.h(context),
              ),
            ),
          ),
          SizedBox(height: 16.h(context)),
          const CustomDropdownField(
            
            hintText: 'Enter cycle length',
            items: ['21 days', '22 days', '23 days'],
          ),
          SizedBox(height: 100.h(context)),
          Text(
            'Today is Day 59 of cycle 1.',
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF7D7169),
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 14.h(context)),
          CustomButton(
            text: 'Update Cycle',
            onPressed: () {},
            borderRadius: 12.r(context),
          ),
        ],
      ),
    );
  }

  Future<void> _pickStartDate() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );

    if (pickedDate == null) {
      return;
    }

    if (!mounted) {
      return;
    }

    _startDateController.text = _formatDate(pickedDate);
  }

  Future<void> _pickEndDate() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );

    if (pickedDate == null) {
      return;
    }

    if (!mounted) {
      return;
    }

    _endDateController.text = _formatDate(pickedDate);
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }
}
