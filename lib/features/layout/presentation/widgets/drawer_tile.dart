// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ott_platform/features/layout/presentation/pages/layout.dart'
    show NavigationItem;
import 'package:sizer/sizer.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.item,
    required this.accent,
    required this.currentIndex,
    required this.onItemTapped,
  });

  final NavigationItem item;
  final Color accent;
  final int currentIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isActive = item.index == currentIndex;
    final Color baseColor = Colors.white.withOpacity(0.72);

    return GestureDetector(
      onTap: () => onItemTapped(item.index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.2.h),
        decoration: BoxDecoration(
          color: isActive ? accent.withOpacity(0.12) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border:
              isActive
                  ? Border.all(color: accent.withOpacity(0.25))
                  : Border.all(color: Colors.transparent),
        ),
        child: Row(
          children: [
            SvgPicture.asset(item.icon, color: isActive ? accent : baseColor),
            SizedBox(width: 15),
            Text(
              item.label,
              style: theme.textTheme.titleSmall?.copyWith(
                color: isActive ? Colors.white : baseColor,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
