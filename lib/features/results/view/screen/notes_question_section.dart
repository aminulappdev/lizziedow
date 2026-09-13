import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/results/bloc/results_state.dart';
import 'package:lizziedow/features/results/view/widgets/notes_list_header.dart';
import 'package:lizziedow/features/results/view/widgets/notes_separated_item.dart';
import 'package:lizziedow/features/results/view/widgets/question_input.dart';
import 'package:lizziedow/features/results/view/widgets/question_tile.dart';

class NotesQuestionSection extends StatelessWidget {
  const NotesQuestionSection({
    super.key,
    required this.state,
    required this.controller,
  });

  final ResultsState state;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
      child: Column(
        children: [
          Text(
            'Questions For Next\nAppointments',
            textAlign: TextAlign.center,
            style: MyFonts.dmSans.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 22.sp(context),
              fontWeight: FontWeight.w800,
              height: 1.05,
            ),
          ),
          SizedBox(height: 8.h(context)),
          Text(
            'Jot down anything you want to ask at your next clinic visit.',
            textAlign: TextAlign.center,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF8F837A),
              fontSize: 9.5.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 22.h(context)),
          QuestionInput(controller: controller),
          SizedBox(height: 22.h(context)),
          NotesListHeader(title: 'Questions', count: state.totalQuestionsCount),
          SizedBox(height: 7.h(context)),
          ...List.generate(state.questions.length, (index) {
            final question = state.questions[index];

            return NotesSeparatedItem(
              isLast: index == state.questions.length - 1,
              child: QuestionTile(question: question),
            );
          }),
        ],
      ),
    );
  }
}
