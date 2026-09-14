import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/section_header.dart';
import 'package:lizziedow/features/results/bloc/results_bloc.dart';
import 'package:lizziedow/features/results/bloc/results_state.dart';
import 'package:lizziedow/features/results/view/widgets/new_note_sheet.dart';
import 'package:lizziedow/features/results/view/widgets/note_tile.dart';
import 'package:lizziedow/features/results/view/widgets/notes_separated_item.dart';
import 'package:lizziedow/features/results/view/widgets/result_upload_card.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class NotesNoteSection extends StatelessWidget {
  const NotesNoteSection({super.key, required this.state});

  final ResultsState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
      child: Column(
        children: [
          Text(
            'Notes',
            style: MyFonts.dmSans.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 24.sp(context),
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 4.h(context)),
          Text(
            'Capture your thoughts and feelings',
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF8F837A),
              fontSize: 10.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 20.h(context)),
          CustomUploadCard(
            iconPath: Assets.images.fileNoteEdit.path,
            title: "No Entries Yet",
            subtitle: "Add a note to capture your thoughts and feelings",
            onPressed: () {
              _showNewNoteSheet(context);
            },  
            buttonText: 'New Note',
          ),
          SizedBox(height: 22.h(context)),
          SectionHeader(
            horizontalPadding: 0.0,    
            title: 'Notes Added',
            trailing: Text(
              '${state.totalNotesCount} Total',
              style: MyFonts.dmSans.copyWith(
                color: LightThemeColors.darkBrown,
                fontSize: 10.sp(context),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),     
          SizedBox(height: 8.h(context)),
          ...List.generate(state.notes.length, (index) {
            final note = state.notes[index];

            return NotesSeparatedItem(
              isLast: index == state.notes.length - 1,
              child: NoteTile(note: note),
            );
          }),
        ],
      ),
    );
  }

  void _showNewNoteSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      barrierColor: Colors.black.withValues(alpha: 0.42),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.r(context))),
      ),
      builder: (_) {
        return BlocProvider.value(
          value: context.read<ResultsBloc>(),
          child: const NewNoteSheet(),
        );
      },
    );
  }
}
