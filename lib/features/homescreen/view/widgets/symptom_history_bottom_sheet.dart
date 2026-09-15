import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/custom_text_field.dart';

class SymptomHistoryBottomSheet extends StatefulWidget {
  const SymptomHistoryBottomSheet({super.key});

  @override
  State<SymptomHistoryBottomSheet> createState() =>
      _SymptomHistoryBottomSheetState();
}

class _SymptomHistoryBottomSheetState extends State<SymptomHistoryBottomSheet> {
  final TextEditingController _dateController = TextEditingController();

  final List<String> _symptoms = const [
    'Bloating',
    'Fatigue',
    'Breast tenderness',
  ];

  @override
  void dispose() {
    _dateController.dispose();
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
            bottom: 22.h(context),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Symptom History',
                  style: MyFonts.dmSans.copyWith(
                    color: LightThemeColors.darkBrown,
                    fontSize: 24.sp(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 8.h(context)),
              Center(
                child: Text(
                  'View all of your symptom history',
                  style: MyFonts.dmSans.copyWith(
                    color: const Color(0xFF8F837A),
                    fontSize: 10.sp(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 28.h(context)),
              CustomTextField(
                controller: _dateController,
                hintText: 'Enter date',
                readOnly: true,
                onTap: _pickDate,
                suffixIcon: GestureDetector(
                  onTap: _pickDate,
                  child: Icon(
                    Icons.calendar_month,
                    color: LightThemeColors.darkBrown,
                    size: 16.sp(context),
                  ),
                ),
                borderRadius: 8.r(context),
                borderSide: const BorderSide(color: Color(0xFFE8DED4)),
                enabledBorderSide: const BorderSide(color: Color(0xFFE8DED4)),
                focusedBorderSide: const BorderSide(color: Color(0xFFB9A99B)),
              ),
              SizedBox(height: 24.h(context)),
              Text(
                'All updates',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 14.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 12.h(context)),
              ...List.generate(_symptoms.length, (index) {
                return _SymptomHistoryTile(
                  symptom: _symptoms[index],
                  showDivider: index != _symptoms.length - 1,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
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

    _dateController.text = _formatDate(pickedDate);
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month/${date.year}';
  }
}

class _SymptomHistoryTile extends StatelessWidget {
  const _SymptomHistoryTile({
    required this.symptom,
    required this.showDivider,
  });

  final String symptom;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h(context)),
      decoration: BoxDecoration(
        border: showDivider
            ? const Border(
                bottom: BorderSide(color: Color(0xFFE8DED4)),
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  symptom,
                  style: MyFonts.dmSans.copyWith(
                    color: LightThemeColors.darkBrown,
                    fontSize: 13.sp(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Text(
                'Aug 3, 2026  -  Monday',
                style: MyFonts.dmSans.copyWith(
                  color: const Color(0xFF6B625B),
                  fontSize: 10.sp(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h(context)),
          Text(
            'I consent to receive personalised communications, including app updates, wellbeing tips and relevant information from Fertility Sisterhood.',
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF8F837A),
              fontSize: 11.sp(context),
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
