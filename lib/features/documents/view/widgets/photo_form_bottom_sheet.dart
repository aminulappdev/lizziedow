import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/documents/bloc/documents_bloc.dart';
import 'package:lizziedow/features/documents/bloc/documents_event.dart';
import 'package:lizziedow/features/documents/model/documents_model.dart';

class PhotoFormBottomSheet extends StatefulWidget {
  const PhotoFormBottomSheet({super.key});

  @override
  State<PhotoFormBottomSheet> createState() => _PhotoFormBottomSheetState();
}

class _PhotoFormBottomSheetState extends State<PhotoFormBottomSheet> {
  final TextEditingController _captionController = TextEditingController();
  final TextEditingController _milestoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _captionController.dispose();
    _milestoneController.dispose();
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
            bottom: 14.h(context),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Photo memories',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 24.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 10.h(context)),
              Text(
                'A private place to keep the milestones, ultrasounds,\nand small moments of your journey.',
                textAlign: TextAlign.center,
                style: MyFonts.dmSans.copyWith(
                  color: const Color(0xFF8F837A),
                  fontSize: 10.sp(context),
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 24.h(context)),
              _PhotoSheetTextField(
                controller: _captionController,
                hintText: 'Enter Caption',
              ),
              SizedBox(height: 14.h(context)),
              Row(
                children: [
                  Expanded(
                    child: _PhotoSheetTextField(
                      controller: _milestoneController,
                      hintText: 'Milestone',
                      suffixIcon: Icons.keyboard_arrow_down,
                    ),
                  ),
                  SizedBox(width: 10.w(context)),
                  Expanded(
                    child: _PhotoSheetTextField(
                      controller: _dateController,
                      hintText: 'Enter date',
                      suffixIcon: Icons.calendar_today,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h(context)),
              SizedBox(
                width: double.infinity,
                height: 54.h(context),
                child: ElevatedButton(
                  onPressed: _addPhoto,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LightThemeColors.buttonColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r(context)),
                    ),
                  ),
                  child: Text(
                    'Add Photo',
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

  void _addPhoto() {
    context.read<DocumentsBloc>().add(
      DocumentPhotoAddedEvent(
        DocumentPhotoData(
          fileName: 'Img name_T3.pdf',
          fileSize: '23.5MB',
          status: 'Uploaded Successfully',
          caption: _captionController.text.trim(),
          milestone: _milestoneController.text.trim(),
        ),
      ),
    );
    Navigator.pop(context);
  }
}

class _PhotoSheetTextField extends StatelessWidget {
  const _PhotoSheetTextField({
    required this.controller,
    required this.hintText,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? suffixIcon;

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
