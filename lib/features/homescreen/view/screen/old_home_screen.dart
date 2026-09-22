import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/homescreen/bloc/home_bloc.dart';
import 'package:lizziedow/features/homescreen/bloc/home_event.dart';
import 'package:lizziedow/features/homescreen/bloc/home_state.dart';
import 'package:lizziedow/features/homescreen/view/screen/appoinment_section.dart';
import 'package:lizziedow/features/homescreen/view/screen/meditation_section.dart';
import 'package:lizziedow/features/homescreen/view/screen/symptom_log_section.dart';
import 'package:lizziedow/features/homescreen/view/widgets/home_filter_chip.dart';
import 'package:lizziedow/features/homescreen/view/widgets/quick_action_card.dart';

class OldHomeScreen extends StatefulWidget {
  const OldHomeScreen({super.key});

  @override
  State<OldHomeScreen> createState() => _OldHomeScreenState();
}

class _OldHomeScreenState extends State<OldHomeScreen> {
  late final PageController _quickCardController;

  @override
  void initState() {
    super.initState();
    _quickCardController = PageController(
      viewportFraction: 0.56,
      initialPage: 1,
    );
  }

  @override
  void dispose() {
    _quickCardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(const HomeStartedEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.only(bottom: 18.h(context)),
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: 32.h(context)),
              SizedBox(
                height: 128.h(context),
                child: PageView.builder(
                  controller: _quickCardController,
                  padEnds: false,
                  itemCount: state.quickCards.length,
                  itemBuilder: (context, index) {
                    final quickCard = state.quickCards[index];

                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 18.w(context) : 8.w(context),
                        right: 8.w(context),
                      ),
                      child: QuickActionCard(
                        title: quickCard.title,
                        description: quickCard.description,
                        icon: quickCard.icon,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 32.h(context)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(state.filters.length, (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            right: index == state.filters.length - 1
                                ? 0
                                : 12.w(context),
                          ),
                          child: HomeFilterChip(
                            label: state.filters[index],
                            isSelected: index == state.selectedFilterIndex,
                            onTap: () {
                              context.read<HomeBloc>().add(
                                HomeFilterChangedEvent(index),
                              );
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: state.selectedFilterIndex == 0
                    ? 20.h(context)
                    : 34.h(context),
              ),
              _buildSelectedContent(state),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSelectedContent(HomeState state) {
    if (state.selectedFilterIndex == 0) {
      return SymptomLogPanel(moods: state.moods, symptoms: state.symptoms);
    }

    if (state.selectedFilterIndex == 2) {
      return AppointmentsContent(appointments: state.appointments);
    }

    return MedicationsContent(medications: state.medications);
  }
}
