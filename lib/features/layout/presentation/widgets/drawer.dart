import 'package:flutter/material.dart';
import 'package:ott_platform/features/layout/presentation/pages/layout.dart'
    show NavigationItem;
import 'package:ott_platform/features/layout/presentation/widgets/drawer_header.dart';
import 'package:ott_platform/features/layout/presentation/widgets/drawer_tile.dart';
import 'package:sizer/sizer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.navItems,
    required this.currentIndex,
    required this.onItemTapped,
  });

  final List<NavigationItem> navItems;
  final int currentIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    final Color accent = const Color(0xFFFF6B81);
    final double drawerWidth = (40.w).clamp(240.0, 360.0);

    return SizedBox(
      width: drawerWidth,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDrawerHeader(accent: accent),
              SizedBox(height: 4.h),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = navItems[index];
                    return DrawerTile(
                      item: item,
                      accent: accent,
                      currentIndex: currentIndex,
                      onItemTapped: onItemTapped,
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(height: 1.6.h),
                  itemCount: navItems.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
