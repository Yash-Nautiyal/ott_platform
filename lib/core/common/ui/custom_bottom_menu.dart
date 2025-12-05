// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:ott_platform/core/common/constant/app_dimensions.dart';
import 'package:ott_platform/core/theme/app_pallete.dart';
import 'package:sizer/sizer.dart';

class CustomBottomMenu extends StatefulWidget {
  final double screenWidth;
  final int currentIndex;
  final Function(int) onIconPressed;

  const CustomBottomMenu({
    super.key,
    required this.screenWidth,
    required this.currentIndex,
    required this.onIconPressed,
  });

  @override
  State<CustomBottomMenu> createState() => _CustomBottomMenuState();
}

class _CustomBottomMenuState extends State<CustomBottomMenu> {
  final List<NavItem> _navItems = [
    NavItem(
      icon: 'assets/icons/nav/ic-mingcute-home.svg',
      label: 'Home',
      index: 0,
    ),
    NavItem(
      icon: 'assets/icons/nav/ic-mingcute-search.svg',
      label: 'Search',
      index: 1,
    ),
    NavItem(
      icon: 'assets/icons/nav/ic-mingcute-classify.svg',
      label: 'Categories',
      index: 2,
    ),
    NavItem(
      icon: 'assets/icons/nav/ic-mingcute-user.svg',
      label: 'User',
      index: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(
        bottom: AppDimensions.paddingL,
        left: AppDimensions.paddingXL,
        right: AppDimensions.paddingXL,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GlassContainer(
          borderRadius: BorderRadius.circular(50),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingM,
              vertical: AppDimensions.paddingM,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
                  _navItems.asMap().entries.map((entry) {
                    final item = entry.value;
                    final isSelected = widget.currentIndex == item.index;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _NavItemWidget(
                          item: item,
                          isSelected: isSelected,
                          onTap: () => widget.onIconPressed(item.index),
                          theme: theme,
                        ),
                        if (entry.key < _navItems.length - 1)
                          SizedBox(width: 8.sp),
                      ],
                    );
                  }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItemWidget extends StatelessWidget {
  final NavItem item;
  final bool isSelected;
  final VoidCallback onTap;
  final ThemeData theme;

  const _NavItemWidget({
    required this.item,
    required this.isSelected,
    required this.onTap,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal:
              isSelected ? AppDimensions.paddingM : AppDimensions.paddingS,
          vertical: AppDimensions.paddingS,
        ),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? AppPallete.primaryMain.withOpacity(0.65)
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              item.icon,
              color:
                  isSelected ? theme.colorScheme.tertiary : theme.disabledColor,
              width: 21.sp,
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isSelected ? 1.0 : 0.0,
                child: AnimatedSlide(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  offset: Offset(0, isSelected ? 0 : 0.3),
                  child:
                      isSelected
                          ? Padding(
                            padding: EdgeInsets.only(
                              left: AppDimensions.paddingS,
                            ),
                            child: Text(
                              item.label,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          )
                          : const SizedBox.shrink(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem {
  final String icon;
  final String label;
  final int index;

  const NavItem({required this.icon, required this.label, required this.index});
}
