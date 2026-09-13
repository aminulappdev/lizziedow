import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class PhotoUploadCard extends StatelessWidget {
  const PhotoUploadCard({super.key, required this.onAddPhoto});

  final VoidCallback onAddPhoto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 18.w(context),
        vertical: 25.h(context),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r(context)),
      ),
      child: Column(
        children: [
          Icon(
            Icons.add_photo_alternate_outlined,
            color: LightThemeColors.darkBrown,
            size: 34.sp(context),
          ),
          SizedBox(height: 14.h(context)),
          Text(
            'Drag and drop your files',
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFFD9D0CA),
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h(context)),
          Text(
            'JPEG, PND, PDF, and MP4 formats, up to 50MB',
            textAlign: TextAlign.center,
            style: MyFonts.dmSans.copyWith(
              color: const Color(0xFFB1A59E),
              fontSize: 9.sp(context),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 12.h(context)),
          SizedBox(
            height: 31.h(context),
            child: ElevatedButton(
              onPressed: onAddPhoto,
              style: ElevatedButton.styleFrom(
                backgroundColor: LightThemeColors.buttonColor,
                foregroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 18.w(context)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r(context)),
                ),
              ),
              child: Text(
                'Add Photo',
                style: MyFonts.dmSans.copyWith(
                  fontSize: 9.sp(context),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
