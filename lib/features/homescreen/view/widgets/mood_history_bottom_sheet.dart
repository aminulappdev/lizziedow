import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/core/widgets/custom_text_field.dart';

class MoodHistoryBottomSheet extends StatefulWidget {
  const MoodHistoryBottomSheet({super.key});

  @override
  State<MoodHistoryBottomSheet> createState() => _MoodHistoryBottomSheetState();
}

class _MoodHistoryBottomSheetState extends State<MoodHistoryBottomSheet> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> _moods = const ['Neutral', 'Neutral', 'Neutral'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w(context),
            right: 20.w(context),
            top: 28.h(context),
            bottom: 22.h(context),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Mood History',
                  style: MyFonts.dmSans.copyWith(
                    color: LightThemeColors.darkBrown,
                    fontSize: 24.sp(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(height: 8.h(context)),
              Center(
                child: Text(
                  'View All of your mood logging',
                  style: MyFonts.dmSans.copyWith(
                    color: const Color(0xFF8F837A),
                    fontSize: 10.sp(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 28.h(context)),
              CustomTextField(
                controller: _searchController,
                hintText: 'Enter Doctor name or clinic',
                borderRadius: 8.r(context),
                borderSide: const BorderSide(color: Color(0xFFE8DED4)),
                enabledBorderSide: const BorderSide(color: Color(0xFFE8DED4)),
                focusedBorderSide: const BorderSide(color: Color(0xFFB9A99B)),
              ),
              SizedBox(height: 24.h(context)),
              Text(
                'All updates',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 14.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 12.h(context)),
              ...List.generate(_moods.length, (index) {
                return _MoodHistoryTile(
                  mood: _moods[index],
                  showDivider: index != _moods.length - 1,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _MoodHistoryTile extends StatelessWidget {
  const _MoodHistoryTile({
    required this.mood,
    required this.showDivider,
  });

  final String mood;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h(context)),
      decoration: BoxDecoration(
        border: showDivider
            ? const Border(
                bottom: BorderSide(color: Color(0xFFE8DED4)),
              )
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Aug 3, 2026  -  Monday',
              style: MyFonts.dmSans.copyWith(
                color: const Color(0xFF6B625B),
                fontSize: 11.sp(context),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            mood,
            style: MyFonts.dmSans.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 11.sp(context),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
