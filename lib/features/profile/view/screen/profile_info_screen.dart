import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({
    super.key,
    required this.header,
    required this.data,
  });

  final String header;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18.w(context),
                vertical: 18.h(context),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.chevron_left,
                      color: const Color(0xFF7E6E63),
                      size: 28.sp(context),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Fertility Sisterhood',
                      textAlign: TextAlign.center,
                      style: MyFonts.instrumentSerif.copyWith(
                        color: const Color(0xFF1F1A17),
                        fontSize: 27.sp(context),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.notifications_none_outlined,
                    color: const Color(0xFF7E6E63),
                    size: 28.sp(context),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1.h(context),
              thickness: 1,
              color: Colors.white.withValues(alpha: 0.55),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.w(context),
                  vertical: 24.h(context),
                ),
                physics: const BouncingScrollPhysics(),
                children: [
                  Text(
                    header,
                    style: MyFonts.instrumentSerif.copyWith(
                      color: LightThemeColors.darkBrown,
                      fontSize: 24.sp(context),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 12.h(context)),
                  Text(
                    data,
                    style: MyFonts.dmSans.copyWith(
                      color: const Color(0xFF6F6761),
                      fontSize: 12.sp(context),
                      fontWeight: FontWeight.w600,
                      height: 1.55,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
