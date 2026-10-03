import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/custom_text_field.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';

class PlannerJournalBottomSheet extends StatefulWidget {
  const PlannerJournalBottomSheet({super.key});

  @override
  State<PlannerJournalBottomSheet> createState() =>
      _PlannerJournalBottomSheetState();
}

class _PlannerJournalBottomSheetState extends State<PlannerJournalBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

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
            bottom: 14.h(context),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add Journal',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 24.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 8.h(context)), 
              Text(
                'Capture your thoughts and feelings',
                textAlign: TextAlign.center,
                style: MyFonts.dmSans.copyWith(
                  color: const Color(0xFF8F837A),
                  fontSize: 10.sp(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 24.h(context)),
              CustomTextField(
                controller: _titleController,
                hintText: 'Enter Journal title',
                borderRadius: 8.r(context),
                borderSide: const BorderSide(color: Color(0xFFE8DED4)),
                enabledBorderSide: const BorderSide(color: Color(0xFFE8DED4)),
                focusedBorderSide: const BorderSide(color: Color(0xFFB9A99B)),
              ),
              SizedBox(height: 14.h(context)),
              CustomTextField(
                controller: _descriptionController,
                hintText: 'Write description here.....',
                maxLines: 7,
                borderRadius: 8.r(context),
                borderSide: const BorderSide(color: Color(0xFFE8DED4)),
                enabledBorderSide: const BorderSide(color: Color(0xFFE8DED4)),
                focusedBorderSide: const BorderSide(color: Color(0xFFB9A99B)),
              ),
              SizedBox(height: 18.h(context)),
              CustomButton(
                text: 'Add Journal',
                onPressed: () => Navigator.pop(context),
                borderRadius: 8.r(context),
                height: 54.h(context),
                textStyle: MyFonts.dmSans.copyWith(
                  fontSize: 13.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 18.h(context)),
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  foregroundColor: LightThemeColors.darkBrown,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Discard',
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
