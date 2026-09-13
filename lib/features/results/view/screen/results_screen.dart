import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/planner/view/widgets/planner_filter_chip_row.dart';
import 'package:lizziedow/features/results/bloc/results_bloc.dart';
import 'package:lizziedow/features/results/bloc/results_event.dart';
import 'package:lizziedow/features/results/bloc/results_state.dart';
import 'package:lizziedow/features/results/view/widgets/result_content.dart';
import 'package:lizziedow/features/results/view/widgets/results_notes_content.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
   Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ResultsBloc()..add(const ResultsStartedEvent()),
      child: BlocBuilder<ResultsBloc, ResultsState>(
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.only(bottom: 18.h(context)),
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: 28.h(context)),
              PlannerFilterChipRow(
                labels: state.topFilters,
                selectedIndex: state.selectedTopFilterIndex,
                onSelected: (index) {
                  context.read<ResultsBloc>().add(
                    ResultsTopFilterChangedEvent(index),
                  );
                },
              ),
              SizedBox(height: 24.h(context)),
              if (state.selectedTopFilterIndex == 0)
                ResultsContent(state: state)
              else
                ResultsNotesContent(
                  state: state,
                  onFilterSelected: (index) {
                    context.read<ResultsBloc>().add(
                      ResultsNoteFilterChangedEvent(index),
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}


 
