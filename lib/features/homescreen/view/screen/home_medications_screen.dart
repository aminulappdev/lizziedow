import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/homescreen/repository/home_repository.dart';
import 'package:lizziedow/features/homescreen/view/screen/meditation_section.dart';

class HomeMedicationsScreen extends StatelessWidget {
  const HomeMedicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final medications = const HomeRepository().medications;

    return Scaffold(
      backgroundColor: LightThemeColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w(context),
                vertical: 16.h(context),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.chevron_left,
                      color: LightThemeColors.darkBrown,
                      size: 28.sp(context),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Medications',
                      textAlign: TextAlign.center,
                      style: MyFonts.instrumentSerif.copyWith(
                        color: const Color(0xFF1F1A17),
                        fontSize: 27.sp(context),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 48.w(context)),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 24.h(context)),
                child: MedicationsContent(medications: medications),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
