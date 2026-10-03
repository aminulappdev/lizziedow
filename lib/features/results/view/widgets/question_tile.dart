import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/results/model/results_model.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class QuestionTile extends StatelessWidget {
  const QuestionTile({super.key, required this.question});

  final ResultQuestionData question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h(context)), 
      child: Row(
        children: [
         Container(
           decoration: BoxDecoration(
             color: LightThemeColors.cardBg,
             border: Border.all(color: LightThemeColors.cardBg, width: 1),
             shape: BoxShape.circle,
           ),
           child: Padding(
             padding:  EdgeInsets.all(6.0), 
             child: CrashSafeImage(
               Assets.images.fileQuestion.path,
               width: 20.w(context),
               height: 20.h(context),
             ),
           ),
         ),
          SizedBox(width: 8.w(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.title,
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
                  question.date,
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
          Text(
            'Mark as Resolved',
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFFB7ADA7),
              fontSize: 9.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
