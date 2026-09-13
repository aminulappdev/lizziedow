import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class EmptyNoteCard extends StatelessWidget {
  const EmptyNoteCard({super.key, required this.onNewEntry});

  final VoidCallback onNewEntry;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 26.w(context),
        vertical: 28.h(context),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r(context)),
      ),
      child: Column(
        children: [
          Icon(
            Icons.event_note_outlined,
            color: LightThemeColors.darkBrown,
            size: 32.sp(context),
          ),
          SizedBox(height: 12.h(context)),
          Text(
            'No Entries Yet',
            style: MyFonts.dmSans.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 13.sp(context),
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 7.h(context)),
          Text(
            'record your notes to capture your thoughts and\nfeelings throughout your Fertility journey',
            textAlign: TextAlign.center,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFFB0A49D),
              fontSize: 8.5.sp(context),
              fontWeight: FontWeight.w700,
              height: 1.25,
            ),
          ),
          SizedBox(height: 13.h(context)),
          SizedBox(
            height: 30.h(context),
            child: ElevatedButton(
              onPressed: onNewEntry,
              style: ElevatedButton.styleFrom(
                backgroundColor: LightThemeColors.buttonColor,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 17.w(context)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.r(context)),
                ),
              ),
              child: Text(
                'New Entry',
                style: MyFonts.dmSans.copyWith(
                  fontSize: 9.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
