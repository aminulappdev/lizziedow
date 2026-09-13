import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/planner/view/widgets/tracker_shared_widgets.dart';

class TrackerSymptomsSection extends StatelessWidget {
  const TrackerSymptomsSection({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TrackerOptionCard(
            icon: Icons.favorite_border,
            title: "How's your mood today?",
            subtitle: 'Take a moment to check in with yourself.',
            options: moods,
          ),
          SizedBox(height: 14.h(context)),
          TrackerOptionCard(
            icon: Icons.list_alt_outlined,
            title: 'Symptoms',
            subtitle: 'How are you feeling?',
            options: symptoms,
          ),
          SizedBox(height: 18.h(context)),
          Row(
            children: [
              Text(
                'Notes',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 15.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(width: 4.w(context)),
              Icon(
                Icons.edit,
                color: LightThemeColors.darkBrown,
                size: 15.sp(context),
              ),
            ],
          ),
          SizedBox(height: 10.h(context)),
          const TrackerTextField(
            hintText: 'Select date',
            suffixIcon: Icons.calendar_today,
          ),
          SizedBox(height: 12.h(context)),
          const TrackerTextField(
            hintText: 'How are you feeling today?',
            maxLines: 7,
          ),
          SizedBox(height: 18.h(context)),
          TrackerPrimaryButton(label: 'Save Changes', onPressed: () {}),
        ],
      ),
    );
  }
}
