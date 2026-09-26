import 'package:flutter/material.dart';
import 'package:lizziedow/app/theme/light_theme_colors.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';
import 'package:lizziedow/features/profile/model/profile_model.dart';
import 'package:lizziedow/features/profile/view/widgets/profile_menu_tile.dart';

class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard({
    super.key,
    required this.items,
    required this.onSelected,
  });

  final List<ProfileMenuItemData> items;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: LightThemeColors.cardBg,
        borderRadius: BorderRadius.circular(12.r(context)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: List.generate(items.length, (index) {
          return ProfileMenuTile(
            item: items[index],
            showDivider: index != items.length - 1,
            onTap: () => onSelected(index),
          );
        }),
      ),
    );
  }
}
