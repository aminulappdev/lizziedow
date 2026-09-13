import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/documents/bloc/documents_bloc.dart';
import 'package:lizziedow/features/documents/bloc/documents_state.dart';
import 'package:lizziedow/features/documents/view/widgets/document_form_bottom_sheet.dart';
import 'package:lizziedow/features/documents/view/widgets/document_tile.dart';
import 'package:lizziedow/features/documents/view/widgets/document_upload_card.dart';

class DocumentsContent extends StatelessWidget {
  const DocumentsContent({super.key, required this.state});

  final DocumentsState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
      child: Column(
        children: [
          Text(
            'Documents',
            style: MyFonts.instrumentSerif.copyWith(
              color: LightThemeColors.darkBrown,
              fontSize: 28.sp(context),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h(context)),
          Text(
            'Save test reports, scans & clinic paperwork in\none secure place',
            textAlign: TextAlign.center,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFF8F837A),
              fontSize: 11.sp(context),
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          SizedBox(height: 26.h(context)),
          DocumentUploadCard(
            onSelectFile: () {
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
                    value: context.read<DocumentsBloc>(),
                    child: const DocumentFormBottomSheet(),
                  );
                },
              );
            },
          ),
          SizedBox(height: 22.h(context)),
          Row(
            children: [
              Text(
                'All Documents',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 14.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              Text(
                '${state.totalDocumentCount} Total',
                style: MyFonts.dmSans.copyWith(
                  color: LightThemeColors.darkBrown,
                  fontSize: 10.sp(context),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(height: 7.h(context)),
          ...List.generate(state.documents.length, (index) {
            final document = state.documents[index];

            return Column(
              children: [
                DocumentTile(document: document),
                if (index != state.documents.length - 1)
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
