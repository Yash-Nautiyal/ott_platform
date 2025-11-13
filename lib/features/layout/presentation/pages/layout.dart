import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ott_platform/features/index.dart';
import 'package:ott_platform/features/layout/presentation/widgets/appbar.dart';
import 'package:ott_platform/features/layout/presentation/widgets/drawer.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  static const _navItems = <NavigationItem>[
    NavigationItem(
      icon: 'assets/icons/nav/ic-mingcute-home.svg',
      label: 'Home',
      index: 0,
      widget: DashboardView(),
    ),
    NavigationItem(
      icon: 'assets/icons/nav/ic-mingcute-search.svg',
      label: 'Search',
      index: 1,
      widget: SearchView(),
    ),
    NavigationItem(
      icon: 'assets/icons/nav/ic-mingcute-tv.svg',
      label: 'TV',
      index: 2,
      widget: DashboardView(),
    ),
    NavigationItem(
      icon: 'assets/icons/nav/ic-mingcute-video-camera.svg',
      label: 'Movies',
      index: 3,
      widget: DashboardView(),
    ),
    NavigationItem(
      icon: 'assets/icons/nav/ic-mingcute-trending-up.svg',
      label: 'Trending',
      index: 4,
      widget: DashboardView(),
    ),
    NavigationItem(
      icon: 'assets/icons/nav/ic-mingcute-lightning.svg',
      label: 'Sparks',
      index: 5,
      widget: DashboardView(),
    ),
    NavigationItem(
      icon: 'assets/icons/nav/ic-mingcute-classify.svg',
      label: 'Categories',
      index: 6,
      widget: CategoriesView(),
    ),
    NavigationItem(
      icon: 'assets/icons/nav/ic-mingcute-heart.svg',
      label: 'My List',
      index: 7,
      widget: DashboardView(),
    ),
    NavigationItem(
      icon: 'assets/icons/nav/ic-mingcute-user.svg',
      label: 'My Space',
      index: 8,
      widget: DashboardView(),
    ),
  ];

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  bool _isDrawerOpen = false;
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 15, 15, 15),
      drawerScrimColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      onDrawerChanged: (isOpened) {
        setState(() => _isDrawerOpen = isOpened);
      },
      appBar: CustomAppBar(isDrawerOpen: _isDrawerOpen),
      drawer: CustomDrawer(
        navItems: Layout._navItems,
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
      body: Stack(
        children: [
          Layout._navItems[_currentIndex].widget,
          Positioned.fill(
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: _isDrawerOpen ? 1 : 0),
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                if (value == 0) {
                  return const SizedBox.shrink();
                }

                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (_isDrawerOpen) {
                      Navigator.of(context).maybePop();
                    }
                  },
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 20 * value,
                        sigmaY: 20 * value,
                      ),
                      child: Container(
                        color: Colors.black.withOpacity(0.4 * value),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationItem {
  const NavigationItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.widget,
  });

  final String icon;
  final String label;
  final int index;
  final Widget widget;
}
