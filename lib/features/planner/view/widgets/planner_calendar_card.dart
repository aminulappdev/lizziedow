import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/planner/model/planner_model.dart';

class PlannerCalendarCard extends StatelessWidget {
  const PlannerCalendarCard({
    super.key,
    required this.days,
  });

  final List<PlannerCalendarDay> days;

  static const _weekDays = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

  @override 
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
          child: Container(
            padding: EdgeInsets.fromLTRB(
              24.w(context),
              24.h(context),
              24.w(context),
              22.h(context),
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFBF7F2),
              borderRadius: BorderRadius.circular(12.r(context)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 18.r(context),
                  offset: Offset(0, 8.h(context)),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.chevron_left,
                      color: const Color(0xFF8E948F),
                      size: 28.sp(context),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'December 2025',
                            textAlign: TextAlign.center,
                            style: MyFonts.dmSans.copyWith(
                              color: const Color(0xFF3D3936),
                              fontSize: 16.sp(context),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(width: 3.w(context)),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: const Color(0xFF7E7770),
                            size: 16.sp(context),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: const Color(0xFF8E948F),
                      size: 28.sp(context),
                    ),
                  ],
                ),
                SizedBox(height: 24.h(context)),
                Row(
                  children: _weekDays.map((day) {
                    return Expanded(
                      child: Text(
                        day,
                        textAlign: TextAlign.center,
                        style: MyFonts.dmSans.copyWith(
                          color: const Color(0xFF514C48),
                          fontSize: 10.sp(context),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10.h(context)),
                GridView.builder(
                  itemCount: days.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 5.w(context),
                    childAspectRatio: 1.05,
                  ),
                  itemBuilder: (context, index) {
                    return _CalendarDayCell(day: days[index]);
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _CalendarLegend(
              color: Color(0xFF1F1A17),
              label: 'Appointments',
            ),
            SizedBox(width: 28),
            _CalendarLegend(color: Color(0xFF7B6654), label: 'Cycle Day'),
          ],
        ),
      ],
    );
  }
}

class _CalendarDayCell extends StatelessWidget {
  const _CalendarDayCell({required this.day});

  final PlannerCalendarDay day;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 6.h(context),
          child: Text(
            day.cycleCode ?? '',
            textAlign: TextAlign.center,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFFB7AAA0),
              fontSize: 5.5.sp(context),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Container(
          width: 28.w(context),
          height: 28.w(context),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: day.isSelected
                ? LightThemeColors.darkBrown
                : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Text(
            '${day.day}',
            style: MyFonts.dmSans.copyWith(
              color: day.isSelected ? Colors.white : const Color(0xFF332D29),
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 3.h(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (day.hasAppointment) const _TinyDot(color: Color(0xFF1F1A17)),
              if (day.hasAppointment && day.hasCycleDay)
                SizedBox(width: 3.w(context)),
              if (day.hasCycleDay) const _TinyDot(color: Color(0xFF7B6654)),
            ],
          ),
        ),
      ],
    );
  }
}

class _CalendarLegend extends StatelessWidget {
  const _CalendarLegend({required this.color, required this.label});

  final Color color;
  final String label; 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _TinyDot(color: color),
        SizedBox(width: 6.w(context)),
        Text(
          label,
          style: MyFonts.dmSans.copyWith(
            color: const Color(0xFF4F4740),
            fontSize: 10.sp(context),
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _TinyDot extends StatelessWidget {
  const _TinyDot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6.w(context),
      height: 6.w(context),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
