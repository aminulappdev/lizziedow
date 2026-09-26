import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/custom_text_field.dart';

class TrackerSymptomsSection extends StatefulWidget {
  const TrackerSymptomsSection({
    super.key,
    required this.moods,
    required this.symptoms,
  });

  final List<String> moods;
  final List<String> symptoms;

  @override
  State<TrackerSymptomsSection> createState() => _TrackerSymptomsSectionState();
}

class _TrackerSymptomsSectionState extends State<TrackerSymptomsSection> {
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TrackerOptionCard( 
            icon: Icons.favorite_border,
            title: "How's your mood today?",
            subtitle: 'Take a moment to check in with yourself.',
            options: widget.moods,
          ),
          SizedBox(height: 14.h(context)),
          _TrackerOptionCard(
            icon: Icons.calendar_month_outlined,
            title: 'Symptoms',
            subtitle: 'How are you feeling?',
            options: widget.symptoms,
          ),
          SizedBox(height: 22.h(context)),
          Row(
            children: [
              Text(
                'Notes',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 16.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(width: 5.w(context)),
              Icon(
                Icons.edit_outlined,
                color: LightThemeColors.darkBrown,
                size: 16.sp(context),
              ),
            ],
          ),
          SizedBox(height: 12.h(context)),

          CustomTextField(
            fillColor: LightThemeColors.cardBg,
            hintText: 'Write here in detail...',
            controller: TextEditingController(),
            maxLines: 5,
            label: '',
          ),
        ],
      ),
    );
  }
}

class _TrackerOptionCard extends StatelessWidget {
  const _TrackerOptionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.options,
  }); 

  final IconData icon;
  final String title;
  final String subtitle;
  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        16.w(context),
        16.h(context),
        16.w(context),
        18.h(context),
      ),
      decoration: BoxDecoration(
        color: LightThemeColors.cardBg,
        borderRadius: BorderRadius.circular(8.r(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 20.sp(context),
                color: LightThemeColors.darkBrown,
              ),
              SizedBox(width: 7.w(context)),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyFonts.dmSans.copyWith(
                    color: LightThemeColors.darkBrown,
                    fontSize: 16.sp(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h(context)),
          Text(
            subtitle,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF8E8278),
              fontSize: 11.sp(context),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 15.h(context)),
          Wrap(
            spacing: 10.w(context),
            runSpacing: 10.h(context),
            children: options.map((option) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 17.w(context),
                  vertical: 9.h(context),
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(100.r(context)),
                  border: Border.all(color: const Color(0xFFE8DED4)),
                ),
                child: Text(
                  option,
                  style: MyFonts.dmSans.copyWith(
                    color: const Color(0xFF4F4740),
                    fontSize: 9.5.sp(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
