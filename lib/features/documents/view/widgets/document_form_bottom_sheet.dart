import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/documents/bloc/documents_bloc.dart';
import 'package:lizziedow/features/documents/bloc/documents_event.dart';
import 'package:lizziedow/features/documents/model/documents_model.dart';

class DocumentFormBottomSheet extends StatefulWidget {
  const DocumentFormBottomSheet({super.key});

  @override
  State<DocumentFormBottomSheet> createState() =>
      _DocumentFormBottomSheetState();
}

class _DocumentFormBottomSheetState extends State<DocumentFormBottomSheet> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _notesController.dispose();
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
            bottom: 14.h(context),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Documents',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 24.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10.h(context)),
              Text(
                'Save test reports, scans, and clinic paperwork in\none secure place.',
                textAlign: TextAlign.center,
                style: MyFonts.dmSans.copyWith(
                  color: const Color(0xFF8F837A),
                  fontSize: 10.sp(context),
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 24.h(context)),
              _DocumentSheetTextField(
                controller: _dateController,
                hintText: 'Enter date',
                suffixIcon: Icons.calendar_today,
              ),
              SizedBox(height: 14.h(context)),
              _DocumentSheetTextField(
                controller: _notesController,
                hintText: 'Notes (optional)',
                maxLines: 8,
              ),
              SizedBox(height: 18.h(context)),
              SizedBox(
                width: double.infinity,
                height: 54.h(context),
                child: ElevatedButton(
                  onPressed: _uploadDocument,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LightThemeColors.buttonColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r(context)),
                    ),
                  ),
                  child: Text(
                    'Upload PDF or document',
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

  void _uploadDocument() {
    context.read<DocumentsBloc>().add(
      DocumentUploadedEvent(
        DocumentFileData(
          fileName: 'Doc name_T3.pdf',
          date: _dateController.text.trim().isEmpty
              ? '27 July 2026'
              : _dateController.text.trim(),
          fileSize: '2.5 MB',
        ),
      ),
    );
    Navigator.pop(context);
  }
}

class _DocumentSheetTextField extends StatelessWidget {
  const _DocumentSheetTextField({
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
