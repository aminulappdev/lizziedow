import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class TrackerMedicineTile extends StatelessWidget {
  const TrackerMedicineTile({
    super.key,
    required this.title,
    required this.detail,
    required this.isTakenToday,
    required this.showDivider,
  }); 
 
  final String title;
  final String detail;
  final bool isTakenToday;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: showDivider ? const Color(0xFFDCCFC3) : Colors.transparent,
            width: 1,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 13.h(context)),
      child: Row(
        children: [
          Container(
            width: 34.w(context),
            height: 34.w(context),
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.fromBorderSide(
                BorderSide(
                  color: LightThemeColors.cardBg,
                  width: 1,
                ),
              ),
            ),
            child: Center(
              child: CrashSafeImage(
                Assets.images.medichine.keyName,
                width: 18.w(context),
                height: 18.h(context),
                color: LightThemeColors.darkBrown,
              ),
            ),
          ),
          SizedBox(width: 12.w(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyFonts.dmSans.copyWith(
                    color: LightThemeColors.darkBrown,
                    fontSize: 14.sp(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 2.h(context)),
                Text(
                  detail,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyFonts.dmSans.copyWith(
                    color: const Color(0xFF8E8278),
                    fontSize: 10.5.sp(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w(context)),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 10.w(context),
                height: 10.w(context),
                child: Transform.scale(
                  scale: 0.62,
                  child: Checkbox(
                    value: isTakenToday,
                    onChanged: (_) {},
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    side: const BorderSide(color: Color(0xFF6E625B)),
                    activeColor: LightThemeColors.buttonColor,
                  ),
                ),
              ),
              SizedBox(width: 6.w(context)),
              Text(
                'Taken Today',
                style: MyFonts.dmSans.copyWith(
                  color: const Color(0xFF6E625B),
                  fontSize: 10.5.sp(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(width: 10.w(context)),
          Icon(
            Icons.more_horiz,
            color: LightThemeColors.darkBrown,
            size: 24.sp(context),
          ),
        ],
      ),
    );
  }
}
