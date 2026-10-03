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
    HomeMoodItem(label: 'Anxious', icon: Assets.images.moodAnxious.keyName),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(
        20.w(context),
        20.h(context),
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
                style: MyFonts.playfairDisplay.copyWith(
                  color: _textColor,
                  fontSize: 22.sp(context),
                  fontWeight: FontWeight.w600,
                ),
              ),
              // SizedBox(width: 10.h(context)),
              // CrashSafeImage(
              //   Assets.images.heart02.keyName,
              //   width: 30.w(context),
              //   height: 30.h(context),
              // ),
            ],
          ),
        ),

        SizedBox(height: 14.h(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
          child: Text(
            '"Believe in the power of your body, the wisdom of your heart,\nand the resilience of your spirit."',
            textAlign: TextAlign.center,
            style: MyFonts.playfairDisplay.copyWith(
              color: const Color(0xFF5D514B),
              fontSize: 10.5.sp(context),
              fontWeight: FontWeight.w500,
              height: 1.18,
            ),
          ),
        ),
        SizedBox(height: 60.h(context)),
        const HomeCycleStatus(),
        SizedBox(height: 38.h(context)),
        Row(
          children: [ 
            Expanded(
              child: Text(
                'How are you feeling today?',
                style: MyFonts.playfairDisplay.copyWith(
                  color: _textColor,
                  fontSize: 14.sp(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              'Log mood +',
              style: MyFonts.dmSans.copyWith(
                color: _mutedColor,
                fontSize: 13.sp(context),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(height: 18.h(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _moods
              .map((mood) => HomeMoodButton(mood: mood))
              .toList(growable: false),
        ),
        SizedBox(height: 50.h(context)),
        HomeAgendaTile(
          icon: Assets.images.calendarEmpty.keyName,
          title: 'Next appointment',
          subtitle: 'Blood test',
          details: const [
            HomeAgendaDetail(Icons.calendar_month_outlined, 'Friday 19 August'),
            HomeAgendaDetail(Icons.schedule, '8:30 AM'),
            HomeAgendaDetail(Icons.location_on_outlined, 'Fertility Clinic'),
          ],
          onViewAll: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const HomeAppointmentsScreen()),
            );
          },
        ),
        SizedBox(height: 12.h(context)),
        Container(
          height: 0.8,
          width: double.infinity,
          color: Color(0xFF7B6654).withValues(alpha: 0.1),
        ),
        SizedBox(height: 12.h(context)),
        HomeAgendaTile(
          icon: Assets.images.pill.keyName,
          title: 'Next medication',
          subtitle: 'Vitamin D3 + K2',
          details: const [HomeAgendaDetail(Icons.schedule, 'Today - 8:00 AM')],
          onViewAll: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const HomeMedicationsScreen()),
            );
          },
        ),
      ],
    );
  }
}
