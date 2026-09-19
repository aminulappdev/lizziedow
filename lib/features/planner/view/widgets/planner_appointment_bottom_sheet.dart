import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/custom_text_field.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';

class PlannerAppointmentBottomSheet extends StatefulWidget {
  const PlannerAppointmentBottomSheet({super.key});

  @override
  State<PlannerAppointmentBottomSheet> createState() =>
      _PlannerAppointmentBottomSheetState();
}

class _PlannerAppointmentBottomSheetState
    extends State<PlannerAppointmentBottomSheet> {
  final TextEditingController _doctorController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _doctorController.dispose();
    _timeController.dispose();
    _dateController.dispose();
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
            top: 26.h(context),
            bottom: 14.h(context),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add Appointment',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 24.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 8.h(context)),
              Text(
                'Add new appointment',
                textAlign: TextAlign.center,
                style: MyFonts.dmSans.copyWith(
                  color: const Color(0xFF8F837A),
                  fontSize: 10.sp(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 24.h(context)),
              CustomTextField(
                controller: _doctorController,
                hintText: 'Enter Doctor name or clinic',
                borderRadius: 8.r(context),
                borderSide: const BorderSide(color: Color(0xFFE8DED4)),
                enabledBorderSide: const BorderSide(color: Color(0xFFE8DED4)),
                focusedBorderSide: const BorderSide(color: Color(0xFFB9A99B)),
              ),
              SizedBox(height: 14.h(context)),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _timeController,
                      hintText: 'Enter time',
                      readOnly: true,
                      onTap: _pickTime,
                      suffixIcon: GestureDetector(
                        onTap: _pickTime,
                        child: Icon(
                          Icons.schedule,
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
                      controller: _dateController,
                      hintText: 'Enter date',
                      readOnly: true,
                      onTap: () => _pickDate(_dateController),
                      suffixIcon: GestureDetector(
                        onTap: () => _pickDate(_dateController),
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
                text: 'Save Appointment',
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
                  'Cancel Appointment',
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

  Future<void> _pickTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime == null || !mounted) {
      return;
    }

    _timeController.text = pickedTime.format(context);
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }
}
