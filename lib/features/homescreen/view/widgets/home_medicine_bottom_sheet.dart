import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/custom_dropdown_field.dart';
import 'package:lizziedow/core/widgets/custom_text_field.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';

class HomeMedicineBottomSheet extends StatefulWidget {
  const HomeMedicineBottomSheet({super.key});

  @override
  State<HomeMedicineBottomSheet> createState() =>
      _HomeMedicineBottomSheetState();
}

class _HomeMedicineBottomSheetState extends State<HomeMedicineBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _doseController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _doseController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
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
              CustomTextField(
                controller: _nameController,
                hintText: 'Enter Name',
                borderRadius: 8.r(context),
                borderSide: const BorderSide(color: Color(0xFFE8DED4)),
                enabledBorderSide: const BorderSide(color: Color(0xFFE8DED4)),
                focusedBorderSide: const BorderSide(color: Color(0xFFB9A99B)),
              ),
              SizedBox(height: 14.h(context)),
              CustomTextField(
                controller: _doseController,
                hintText: 'Enter Dose',
                borderRadius: 8.r(context),
                borderSide: const BorderSide(color: Color(0xFFE8DED4)),
                enabledBorderSide: const BorderSide(color: Color(0xFFE8DED4)),
                focusedBorderSide: const BorderSide(color: Color(0xFFB9A99B)),
              ),
              SizedBox(height: 14.h(context)),
              Row(
                children: [
                  const Expanded(
                    child: CustomDropdownField(
                      hintText: 'Frequency',
                      items: ['Daily', 'Weekly', 'Monthly', 'As needed'],
                    ),
                  ),
                  SizedBox(width: 12.w(context)),
                  const Expanded(
                    child: CustomDropdownField(
                      hintText: 'Type',
                      items: ['Tablet', 'Capsule', 'Injection', 'Syrup'],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.h(context)),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _startDateController,
                      hintText: 'Start date',
                      readOnly: true,
                      onTap: () => _pickDate(_startDateController),
                      suffixIcon: GestureDetector(
                        onTap: () => _pickDate(_startDateController),
                        child: Icon(
                          Icons.calendar_month,
                          color: LightThemeColors.darkBrown,
                          size: 16.sp(context),
                        ),
                      ),
                      borderRadius: 8.r(context),
                      borderSide: const BorderSide(color: Color(0xFFE8DED4)),
                      enabledBorderSide: const BorderSide(
                        color: Color(0xFFE8DED4),
                      ),
                      focusedBorderSide: const BorderSide(
                        color: Color(0xFFB9A99B),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w(context)),
                  Expanded(
                    child: CustomTextField(
                      controller: _endDateController,
                      hintText: 'End date',
                      readOnly: true,
                      onTap: () => _pickDate(_endDateController),
                      suffixIcon: GestureDetector(
                        onTap: () => _pickDate(_endDateController),
                        child: Icon(
                          Icons.calendar_month,
                          color: LightThemeColors.darkBrown,
                          size: 16.sp(context),
                        ),
                      ),
                      borderRadius: 8.r(context),
                      borderSide: const BorderSide(color: Color(0xFFE8DED4)),
                      enabledBorderSide: const BorderSide(
                        color: Color(0xFFE8DED4),
                      ),
                      focusedBorderSide: const BorderSide(
                        color: Color(0xFFB9A99B),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h(context)),
              CustomButton(
                text: 'Update Medicine',
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

  Future<void> _pickDate(TextEditingController controller) async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );

    if (pickedDate == null || !mounted) {
      return;
    }

    controller.text = _formatDate(pickedDate);
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }
}
