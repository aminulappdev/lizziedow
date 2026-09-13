import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/results/bloc/results_state.dart';
import 'package:lizziedow/features/results/view/screen/notes_note_section.dart';
import 'package:lizziedow/features/results/view/screen/notes_question_section.dart';

class ResultsNotesContent extends StatefulWidget {
  const ResultsNotesContent({
    super.key,
    required this.state,
    required this.onFilterSelected,
  });

  final ResultsState state;
  final ValueChanged<int> onFilterSelected;

  @override
  State<ResultsNotesContent> createState() => _ResultsNotesContentState();
}

class _ResultsNotesContentState extends State<ResultsNotesContent> {
  final TextEditingController _questionController = TextEditingController();

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
          child: _NotesTabBar(
            labels: widget.state.noteFilters,
            selectedIndex: widget.state.selectedNoteFilterIndex,
            onSelected: widget.onFilterSelected,
          ),
        ),
        SizedBox(height: 22.h(context)),
        if (widget.state.selectedNoteFilterIndex == 0)
          NotesNoteSection(state: widget.state)
        else
          NotesQuestionSection(
            state: widget.state,
            controller: _questionController,
          ),
      ],
    );
  }
}

class _NotesTabBar extends StatelessWidget {
  const _NotesTabBar({
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(labels.length, (index) {
        final isSelected = index == selectedIndex;

        return Expanded(
          child: GestureDetector(
            onTap: () => onSelected(index),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 9.h(context)),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected
                        ? LightThemeColors.buttonColor
                        : const Color(0xFFE9DED4),
                    width: 1,
                  ),
                ),
              ),
              child: Text(
                labels[index],
                style: MyFonts.dmSans.copyWith(
                  color: isSelected
                      ? LightThemeColors.darkBrown
                      : const Color(0xFF8F837A),
                  fontSize: 11.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
