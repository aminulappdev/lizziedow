import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/results/bloc/results_bloc.dart';
import 'package:lizziedow/features/results/bloc/results_event.dart';
import 'package:lizziedow/features/results/bloc/results_state.dart';
import 'package:lizziedow/features/results/model/results_model.dart';

class ResultFormBottomSheet extends StatefulWidget {
  const ResultFormBottomSheet({super.key});

  @override
  State<ResultFormBottomSheet> createState() => _ResultFormBottomSheetState();
}

class _ResultFormBottomSheetState extends State<ResultFormBottomSheet> {
  final TextEditingController _testNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _unitController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _testNameController.dispose();
    _dateController.dispose();
    _valueController.dispose();
    _unitController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BlocBuilder<ResultsBloc, ResultsState>(
        builder: (context, state) {
          return SingleChildScrollView(
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
                    'Test Results',
                    style: MyFonts.dmSans.copyWith(
                      color: LightThemeColors.darkBrown,
                      fontSize: 24.sp(context),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 10.h(context)),
                  Text(
                    'Track AMH, FSH, LH, Oestradiol and other hormone panels over time.',
                    textAlign: TextAlign.center,
                    style: MyFonts.dmSans.copyWith(
                      color: const Color(0xFF8F837A),
                      fontSize: 10.sp(context),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20.h(context)),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: 10.w(context),
                      runSpacing: 10.h(context),
                      children: List.generate(state.hormones.length, (index) {
                        return _HormoneChip(
                          label: state.hormones[index],
                          isSelected: index == state.selectedHormoneIndex,
                          onTap: () {
                            context.read<ResultsBloc>().add(
                              ResultsHormoneChangedEvent(index),
                            );
                          },
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 22.h(context)),
                  _ResultSheetTextField(
                    controller: _testNameController,
                    hintText: 'Enter Test name',
                  ),
                  SizedBox(height: 14.h(context)),
                  _ResultSheetTextField(
                    controller: _dateController,
                    hintText: 'Enter date',
                    suffixIcon: Icons.calendar_today,
                  ),
                  SizedBox(height: 14.h(context)),
                  Row(
                    children: [
                      Expanded(
                        child: _ResultSheetTextField(
                          controller: _valueController,
                          hintText: 'Test Value',
                        ),
                      ),
                      SizedBox(width: 10.w(context)),
                      Expanded(
                        child: _ResultSheetTextField(
                          controller: _unitController,
                          hintText: 'Test Unit',
                          suffixIcon: Icons.keyboard_arrow_down,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h(context)),
                  _ResultSheetTextField(
                    controller: _notesController,
                    hintText: 'Write test notes here.....',
                    maxLines: 8,
                  ),
                  SizedBox(height: 18.h(context)),
                  SizedBox(
                    width: double.infinity,
                    height: 54.h(context),
                    child: ElevatedButton(
                      onPressed: () => _saveResult(context, state),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: LightThemeColors.buttonColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r(context)),
                        ),
                      ),
                      child: Text(
                        'Save Result',
                        style: MyFonts.dmSans.copyWith(
                          fontSize: 13.sp(context),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
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
          );
        },
      ),
    );
  }

  void _saveResult(BuildContext context, ResultsState state) {
    final selectedHormone = state.hormones.isEmpty
        ? ''
        : state.hormones[state.selectedHormoneIndex];
    final testName = _testNameController.text.trim().isEmpty
        ? selectedHormone
        : _testNameController.text.trim();

    context.read<ResultsBloc>().add(
      ResultsSubmittedEvent(
        HormoneResultData(
          testName: testName,
          date: _dateController.text.trim(),
          value: _valueController.text.trim(),
          unit: _unitController.text.trim(),
          notes: _notesController.text.trim(),
        ),
      ),
    );
    Navigator.pop(context);
  }
}

class _HormoneChip extends StatelessWidget {
  const _HormoneChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 18.w(context),
          vertical: 13.h(context),
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? LightThemeColors.buttonColor
              : const Color(0xFFFCFAF8),
          borderRadius: BorderRadius.circular(100.r(context)),
          border: Border.all(color: const Color(0xFFF1EAE4)),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: MyFonts.dmSans.copyWith(
            color: isSelected ? Colors.white : const Color(0xFF6F6761),
            fontSize: 12.sp(context),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _ResultSheetTextField extends StatelessWidget {
  const _ResultSheetTextField({
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? suffixIcon;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
