import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/theme/my_fonts.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class CostAlreadyPaidCheckbox extends StatelessWidget {
  const CostAlreadyPaidCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onChanged(!value),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 12.w(context),
              height: 12.h(context),
              child: Transform.scale(
                scale: 0.65,
                child: Checkbox(
                  value: value,
                  activeColor: LightThemeColors.buttonColor,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                  side: const BorderSide(color: Color(0xFF8A7C72)),
                  onChanged: (checked) => onChanged(checked ?? false),
                ),
              ),
            ),
            SizedBox(width: 8.w(context)),
            Text(
              'Already paid',
              style: MyFonts.dmSans.copyWith(
                color: const Color(0xFF8A7C72),
                fontSize: 10.sp(context),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
