import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/homescreen/model/quick_action_data_model.dart';
import 'package:lizziedow/features/homescreen/view/widgets/medication_tile.dart';
import 'package:lizziedow/features/homescreen/view/widgets/section_header.dart';

class MedicationsContent extends StatelessWidget {
  const MedicationsContent({super.key, required this.medications});

  final List<MedicationData> medications;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: "Today's Medications",
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add New',
                style: MyFonts.dmSans.copyWith(
                  fontSize: 12.sp(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 7.w(context)),
              Icon(Icons.add, size: 17.sp(context)),
            ],
          ),
          onTap: () {},
        ),
        SizedBox(height: 8.h(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
          child: Column(
            children: List.generate(medications.length, (index) {
              return MedicationTile(
                title: medications[index].title,
                detail: medications[index].detail,
                showDivider: index != medications.length - 1,
              );
            }),
          ),
        ),
      ],
    );
  }
}