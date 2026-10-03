import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/custom_dropdown_field.dart';
import 'package:lizziedow/core/widgets/custom_text_field.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';
import 'package:lizziedow/features/planner/bloc/planner_bloc.dart';
import 'package:lizziedow/features/planner/bloc/planner_event.dart';
import 'package:lizziedow/features/planner/bloc/planner_state.dart';
import 'package:lizziedow/features/planner/view/widgets/cost_already_paid_checkbox.dart';
import 'package:lizziedow/features/planner/view/widgets/cost_info_tile.dart';
import 'package:lizziedow/features/planner/view/widgets/cost_total_card.dart';

class CostSection extends StatefulWidget {
  const CostSection({super.key, required this.state});

  final PlannerState state;

  @override
  State<CostSection> createState() => _CostSectionState();
}

class _CostSectionState extends State<CostSection> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _dateController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.w(context),
        right: 18.w(context),
        top: 28.h(context),
      ),
      child: Column(
        children: [ 
          Text(
            'Cost Tracker',
            style: MyFonts.playfairDisplay.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 24.sp(context),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4.h(context)),
          Text(
            'Stay on top of all costs on your fertility journey',
            textAlign: TextAlign.center,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF8A7C72),
              fontSize: 10.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 24.h(context)),
          const CostTotalCard(amount: '\u00A349,996'),
          SizedBox(height: 10.h(context)),
          Row(
            children: [
              const Expanded(
                child: CostInfoTile(
                  icon: Icons.payments_outlined,
                  title: 'Consultation',
                  amount: '\u00A349,996',
                ),
              ),
              SizedBox(width: 8.w(context)),
              const Expanded(
                child: CostInfoTile(
                  icon: Icons.credit_card_outlined,
                  title: 'Recent Expenses',
                  amount: '\u00A34,000',
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h(context)),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  hintText: 'Enter amount',
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 10.w(context)),
              Expanded(
                child: CustomTextField(
                  hintText: 'Enter date',
                  controller: _dateController,
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
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h(context)),
          CostAlreadyPaidCheckbox(
            value: widget.state.isCostAlreadyPaid,
            onChanged: (value) {
              context.read<PlannerBloc>().add(
                PlannerCostAlreadyPaidChangedEvent(value),
              );
            },
          ),
          SizedBox(height: 12.h(context)),
          Row(
            children: [
              const Expanded(
                child: CustomDropdownField(
                  hintText: 'IVF Round',
                  items: [
                    'IVF Round 1',
                    'IVF Round 2',
                    'IVF Round 3',
                    'IVF Round 4',
                    'IVF Round 5',
                    'IVF Round 6',
                    'IVF Round 7',
                    'IVF Round 8',
                    'IVF Round 9',
                    'IVF Round 10',
                  ],
                ),
              ),
              SizedBox(width: 10.w(context)),
              const Expanded(
                child: CustomDropdownField(
                  hintText: 'Type',
                  items: ['Consultation', 'Medication', 'Test', 'Procedure'],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h(context)),
          const CustomDropdownField(
            hintText: 'Category',
            items: ['Medical', 'Medication', 'Lab Test', 'Travel', 'Other'],
          ),
          SizedBox(height: 12.h(context)),
          CustomTextField(
            hintText: 'Write a description/notes.....',
            controller: _notesController,
            maxLines: 7,
          ),
          SizedBox(height: 20.h(context)),
          CustomButton(
            text: 'Add Expense',
            onPressed: () {},
            borderRadius: 8.r(context),
            height: 54.h(context),
            textStyle: MyFonts.dmSans.copyWith(
              fontSize: 13.sp(context),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
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
