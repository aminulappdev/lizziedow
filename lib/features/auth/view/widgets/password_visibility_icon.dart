import 'package:flutter/material.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class PasswordVisibilityIcon extends StatelessWidget {
  const PasswordVisibilityIcon({
    super.key,
    required this.isVisible,
    required this.onTap,
  });

  final bool isVisible;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        isVisible
            ? Icons.visibility_off_outlined
            : Icons.remove_red_eye_outlined,
        size: 18.sp(context),
        color: const Color(0xFF6F6761),
      ),
    );
  }
}
