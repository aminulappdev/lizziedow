import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/documents/model/documents_model.dart';

class PhotoTile extends StatelessWidget {
  const PhotoTile({super.key, required this.photo});

  final DocumentPhotoData photo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 11.h(context)),
      child: Row(
        children: [
          Icon(
            Icons.image_outlined,
            color: LightThemeColors.darkBrown,
            size: 19.sp(context),
          ),
          SizedBox(width: 9.w(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  photo.fileName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyFonts.dmSans.copyWith(
                    color: LightThemeColors.darkBrown,
                    fontSize: 12.sp(context),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 2.h(context)),
                Text(
                  '${photo.fileSize}  -  ${photo.status}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MyFonts.dmSans.copyWith(
                    color: const Color(0xFF9A8E86),
                    fontSize: 9.sp(context),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w(context)),
          Icon(
            Icons.remove_red_eye_outlined,
            color: const Color(0xFF8F837A),
            size: 17.sp(context),
          ),
        ],
      ),
    );
  }
}
