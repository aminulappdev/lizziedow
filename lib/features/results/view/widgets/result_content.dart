import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/results/bloc/results_bloc.dart';
import 'package:lizziedow/features/results/bloc/results_state.dart';
import 'package:lizziedow/features/results/view/widgets/result_form_bottom_sheet.dart';
import 'package:lizziedow/features/results/view/widgets/result_report_tile.dart';
import 'package:lizziedow/features/results/view/widgets/result_upload_card.dart';

class ResultsContent extends StatelessWidget {
  const ResultsContent({super.key, required this.state});

  final ResultsState state;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.science_outlined,
                color: LightThemeColors.darkBrown,
                size: 24.sp(context),
              ),
              SizedBox(width: 7.w(context)),
              Text(
                'Test Results',
                style: MyFonts.instrumentSerif.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 26.sp(context),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h(context)),
          Text(
            'Track AMH, FSH, LH, Oestradiol and other\nhormone panels over time',
            textAlign: TextAlign.center,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF8F837A),
              fontSize: 11.sp(context),
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          SizedBox(height: 28.h(context)),
          ResultUploadCard(
            onAddResult: () {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.white,
                barrierColor: Colors.black.withValues(alpha: 0.42),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8.r(context)),
                  ),
                ),
                builder: (_) {
                  return BlocProvider.value(
                    value: context.read<ResultsBloc>(),
                    child: const ResultFormBottomSheet(),
                  );
                },
              );
            },
          ),
          SizedBox(height: 22.h(context)),
          Row(
            children: [
              Text(
                'All Reports',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 14.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              Text(
                '${state.totalReportCount} Total',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 10.sp(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 7.h(context)),
          ...List.generate(state.reports.length, (index) {
            final report = state.reports[index];

            return Column(
              children: [
                ResultReportTile(
                  fileName: report.fileName,
                  fileSize: report.fileSize,
                  status: report.status,
                ),
                if (index != state.reports.length - 1)
                  Divider(
                    height: 1.h(context),
                    thickness: 1,
                    color: Colors.white.withValues(alpha: 0.55),
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }
}