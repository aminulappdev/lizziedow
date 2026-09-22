import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/homescreen/view/screen/home_appointments_screen.dart';
import 'package:lizziedow/features/homescreen/view/screen/home_medications_screen.dart';
import 'package:lizziedow/features/homescreen/view/widgets/home_agenda_tile.dart';
import 'package:lizziedow/features/homescreen/view/widgets/home_cycle_status.dart';
import 'package:lizziedow/features/homescreen/view/widgets/home_mood_button.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color _textColor = Color(0xFF332A25);
  static const Color _mutedColor = Color(0xFF776B62);

  final List<HomeMoodItem> _moods = [
    HomeMoodItem(label: 'Happy', icon: Assets.images.moodHappy.keyName),
    HomeMoodItem(label: 'Calm', icon: Assets.images.moodClam.keyName),
    HomeMoodItem(label: 'Neutral', icon: Assets.images.moodNeutral.keyName),
    HomeMoodItem(label: 'Sad', icon: Assets.images.moodSad.keyName),
    HomeMoodItem(
      label: 'Anxious',
      icon: Assets.images.moodAnxious.keyName,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(
        20.w(context),
        10.h(context),
        20.w(context),
        22.h(context),
      ),
      physics: const BouncingScrollPhysics(),
      children: [
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Good Morning, Jane',
                style: MyFonts.instrumentSerif.copyWith(
                  color: _textColor,
                  fontSize: 26.sp(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 10.h(context)),
              CrashSafeImage(
                Assets.images.heart02.keyName,
                width: 30.w(context),
                height: 30.h(context),
              ),
            ],
          ),
        ),

        SizedBox(height: 16.h(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
          child: Text(
            '"Believe In The Power Of Your Body, The Wisdom Of Your Heart,\nAnd The Resilience Of Your Spirit."',
            textAlign: TextAlign.center,
            style: MyFonts.instrumentSerif.copyWith(
              color: const Color(0xFF5D514B),
              fontSize: 15.sp(context),
              fontWeight: FontWeight.w500,
              height: 1.18,
            ),
          ),
        ),
        SizedBox(height: 36.h(context)),
        const HomeCycleStatus(),
        SizedBox(height: 38.h(context)),
        Row(
          children: [
            Expanded(
              child: Text(
                'How Are You Feeling Today?',
                style: MyFonts.instrumentSerif.copyWith(
                  color: _textColor,
                  fontSize: 17.sp(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              'Log mood',
              style: MyFonts.dmSans.copyWith(
                color: _mutedColor,
                fontSize: 12.sp(context),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 8.w(context)),
            Icon(Icons.add, color: _textColor, size: 15.sp(context)),
          ],
        ),
        SizedBox(height: 18.h(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _moods
              .map((mood) => HomeMoodButton(mood: mood))
              .toList(growable: false),
        ),
        SizedBox(height: 30.h(context)),
        HomeAgendaTile(
          icon: Assets.images.calender02.keyName,
          title: 'Next appointment',
          subtitle: 'Blood test',
          details: const [
            HomeAgendaDetail(Icons.calendar_month_outlined, 'Friday 19 August'),
            HomeAgendaDetail(Icons.schedule, '8:30 AM'),
            HomeAgendaDetail(Icons.location_on_outlined, 'Fertility Clinic'),
          ],
          onViewAll: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const HomeAppointmentsScreen(),
              ),
            );
          },
        ),
        SizedBox(height: 24.h(context)),
        HomeAgendaTile(
          icon: Assets.images.medichine.keyName,
          title: 'Next medication',
          subtitle: 'Vitamin D3 + K2',
          details: const [HomeAgendaDetail(Icons.schedule, 'Today - 8:00 AM')],
          onViewAll: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const HomeMedicationsScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
