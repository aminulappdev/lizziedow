import 'package:crash_safe_image/crash_safe_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/dashboard/bloc/dashboard_bloc.dart';
import 'package:lizziedow/features/dashboard/bloc/dashboard_event.dart';
import 'package:lizziedow/features/dashboard/bloc/dashboard_state.dart';
import 'package:lizziedow/features/dashboard/view/widgets/nav_bar_item.dart';
import 'package:lizziedow/gen/assets.gen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardBloc()..add(const DashboardStartedEvent()),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: LightThemeColors.scaffoldBackgroundColor,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 22.w(context),
                      vertical: 18.h(context),
                    ),
                    child: Row( 
                      children: [
                        SizedBox(width: 28.w(context)),
                        Expanded(
                          child: Text(
                            'Fertility Sisterhood',
                            textAlign: TextAlign.center,
                            style: MyFonts.playfairDisplay.copyWith(
                              color: const Color(0xFF1F1A17),
                              fontSize: 25.sp(context),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        CrashSafeImage(
                          Assets.images.notofication.path,
                          width: 24.w(context),
                          height: 24.h(context),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.h(context),
                    thickness: 1,
                    color: Colors.transparent,
                  ),
                  Expanded(child: DashboardTabBody(index: state.currentIndex)),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 82.h(context),
              decoration: BoxDecoration(
                color: LightThemeColors.cardBg,
                border: Border(top: BorderSide(color: Color(0xFFF0E7DC))),
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  children: List.generate(state.navItems.length, (index) {
                    final item = state.navItems[index];
                    final isSelected = state.currentIndex == index;

                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.read<DashboardBloc>().add(
                            DashboardTabChangedEvent(index),
                          );
                        },
                        child: Container(
                          color: isSelected
                              ? LightThemeColors.buttonColor
                              : Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CrashSafeImage(
                                item.icon,
                                width: 28.w(context),
                                height: 28.h(context),
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFF403731),
                              ),
                              SizedBox(height: 5.h(context)),
                              Text(
                                item.label,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: MyFonts.dmSans.copyWith(
                                  color: isSelected
                                      ? Colors.white
                                      : const Color(0xFF403731),
                                  fontSize: 11.sp(context),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
