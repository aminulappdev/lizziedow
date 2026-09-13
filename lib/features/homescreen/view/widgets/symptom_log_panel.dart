import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/homescreen/view/widgets/option_card.dart';
import 'package:lizziedow/features/onboarding/view/widgets/custom_button.dart';

class SymptomLogPanel extends StatelessWidget {
  const SymptomLogPanel({
    super.key,
    required this.moods,
    required this.symptoms,
  });

  final List<String> moods;
  final List<String> symptoms; 
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
      child: Column(
        children: [
          OptionCard(
            icon: Icons.favorite_border,
            title: "Today's mood",
            options: moods,
          ),
          SizedBox(height: 14.h(context)),
          OptionCard(
            icon: Icons.calendar_today_outlined,
            title: 'Symptoms',
            options: symptoms,
          ),
          SizedBox(height: 14.h(context)),
          Container(
            height: 198.h(context),
            width: double.infinity,
            padding: EdgeInsets.all(18.r(context)),
            decoration: BoxDecoration(
              color: Color(0xFFF6F0EB),
              borderRadius: BorderRadius.circular(8.r(context)),
            ),
            alignment: Alignment.topLeft,
            child: Text(
              'write here in detail...',
              style: MyFonts.dmSans.copyWith(
                color: const Color(0xFF6B625B),
                fontSize: 12.sp(context),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 14.h(context)),
          CustomButton(text: 'Save', onPressed: () {}),
        ],
      ),
    );
  }
}


