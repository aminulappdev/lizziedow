import 'package:flutter/material.dart';
import 'package:lizziedow/app/utils/app_responsive.dart';

class NotesSeparatedItem extends StatelessWidget {
  const NotesSeparatedItem({
    super.key,
    required this.child,
    required this.isLast,
  });

  final Widget child;
  final bool isLast;

  @override
   Widget build(BuildContext context) {
    return Column(
      children: [
        child,
        if (!isLast)
          Divider(
            height: 1.h(context),
            thickness: 1,
            color: Colors.white.withValues(alpha: 0.55),
          ),
      ],
    );
  }
}
