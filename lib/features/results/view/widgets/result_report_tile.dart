import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/circle_widgets.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class ResultReportTile extends StatelessWidget {
  const ResultReportTile({
    super.key,
    required this.fileName,
    required this.fileSize,
    required this.status,
  });

  final String fileName;
  final String fileSize;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 11.h(context)),
      child: Row(
        children: [
          CircleIconWidgets(
            iconPath: Assets.images.fileIcon.keyName,
            iconRadius: 22.w(context),
            padding: 4,
          ),
          SizedBox(width: 9.w(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyFonts.dmSans.copyWith(
                    color: LightThemeColors.darkBrown,
                    fontSize: 12.sp(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 2.h(context)),
                Text(
                  '$fileSize  -  $status',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyFonts.dmSans.copyWith(
                    color: const Color(0xFF9A8E86),
                    fontSize: 9.sp(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w(context)),
          Icon(
            Icons.remove_red_eye_outlined,
            color: const Color(0xFF8F837A),
            size: 17.sp(context),
          ),
        ],
      ),
    );
  }
}
