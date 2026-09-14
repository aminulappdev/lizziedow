import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/custom_text_field.dart';
import 'package:lizziedow/features/results/bloc/results_bloc.dart';
import 'package:lizziedow/features/results/bloc/results_event.dart';
import 'package:lizziedow/features/results/model/results_model.dart';

class QuestionInput extends StatelessWidget {
  const QuestionInput({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            controller: controller,
            hintText: 'Type your question here...',
          ),
        ),
        SizedBox(width: 10.w(context)),
        SizedBox(
          width: 70.w(context),
          height: 54.h(context),
          child: ElevatedButton(
            onPressed: () => _addQuestion(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: LightThemeColors.buttonColor,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r(context)),
              ),
            ),
            child: Text(
              '+ Add',
              style: MyFonts.dmSans.copyWith(
                fontSize: 11.sp(context),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _addQuestion(BuildContext context) {
    final title = controller.text.trim();

    if (title.isEmpty) {
      return;
    }

    context.read<ResultsBloc>().add(
      ResultQuestionAddedEvent(
        ResultQuestionData(title: title, date: 'Dec 4, 2019 21:42'),
      ),
    );
    controller.clear();
  }
}
