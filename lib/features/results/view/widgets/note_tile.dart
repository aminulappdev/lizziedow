import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/results/model/results_model.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key, required this.note});

  final ResultNoteData note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h(context)),
      child: Row(
        children: [
          Icon(
            Icons.note_alt_outlined,
            color: LightThemeColors.darkBrown,
            size: 17.sp(context),
          ),
          SizedBox(width: 8.w(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyFonts.dmSans.copyWith(
                    color: LightThemeColors.darkBrown,
                    fontSize: 11.sp(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 3.h(context)),
                Text(
                  note.date,
                  style: MyFonts.dmSans.copyWith(
                    color: const Color(0xFF9A8E86),
                    fontSize: 8.5.sp(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w(context)),
          Flexible(
            child: Text(
              note.tags,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: MyFonts.dmSans.copyWith(
                color: LightThemeColors.darkBrown,
                fontSize: 8.5.sp(context),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
