import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/results/bloc/results_bloc.dart';
import 'package:lizziedow/features/results/bloc/results_event.dart';
import 'package:lizziedow/features/results/model/results_model.dart';

class NewNoteSheet extends StatefulWidget {
  const NewNoteSheet({super.key});

  @override
  State<NewNoteSheet> createState() => _NewNoteSheetState();
}

class _NewNoteSheetState extends State<NewNoteSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _tagsController.dispose();
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
                'New Entry',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 24.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 22.h(context)),
              _NoteSheetTextField(
                controller: _titleController,
                hintText: 'Write note title',
              ),
              SizedBox(height: 14.h(context)),
              _NoteSheetTextField(
                controller: _tagsController,
                hintText: 'Tags',
              ),
              SizedBox(height: 18.h(context)),
              SizedBox(
                width: double.infinity,
                height: 54.h(context),
                child: ElevatedButton(
                  onPressed: _saveNote,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LightThemeColors.buttonColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r(context)),
                    ),
                  ),
                  child: Text(
                    'Save Note',
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
      ),
    );
  }

  void _saveNote() {
    final title = _titleController.text.trim();

    if (title.isEmpty) {
      return;
    }

    context.read<ResultsBloc>().add(
      ResultNoteAddedEvent(
        ResultNoteData(
          title: title,
          date: 'Dec 4, 2019 21:42',
          tags: _tagsController.text.trim().isEmpty
              ? 'Stims, Ultrasound +3 more'
              : _tagsController.text.trim(),
        ),
      ),
    );
    Navigator.pop(context);
  }
}

class _NoteSheetTextField extends StatelessWidget {
  const _NoteSheetTextField({
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
