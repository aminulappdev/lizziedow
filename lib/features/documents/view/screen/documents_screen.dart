import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/documents/bloc/documents_bloc.dart';
import 'package:lizziedow/features/documents/bloc/documents_event.dart';
import 'package:lizziedow/features/documents/bloc/documents_state.dart';
import 'package:lizziedow/features/documents/view/widgets/documents_content.dart';
import 'package:lizziedow/features/documents/view/widgets/photos_content.dart';
import 'package:lizziedow/features/planner/view/widgets/planner_filter_chip_row.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DocumentsBloc()..add(const DocumentsStartedEvent()),
      child: BlocBuilder<DocumentsBloc, DocumentsState>(
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
                  context.read<DocumentsBloc>().add(
                    DocumentsTopFilterChangedEvent(index),
                  );
                },
              ),
              SizedBox(height: 24.h(context)),
              if (state.selectedTopFilterIndex == 0)
                DocumentsContent(state: state)
              else
                PhotosContent(state: state),
            ],
          );
        },
      ),
    );
  }
}
