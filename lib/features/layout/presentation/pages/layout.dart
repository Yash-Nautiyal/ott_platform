import 'package:flutter/material.dart';
import 'package:ott_platform/core/common/ui/custom_bottom_menu.dart';
import 'package:ott_platform/features/index.dart';
import 'package:ott_platform/features/layout/presentation/widgets/appbar.dart';

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
      icon: 'assets/icons/nav/ic-mingcute-classify.svg',
      label: 'Categories',
      index: 2,
      widget: CategoriesView(),
    ),
    NavigationItem(
      icon: 'assets/icons/nav/ic-mingcute-user.svg',
      label: 'User',
      index: 3,
      widget: DashboardView(),
    ),
  ];

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (_currentIndex != index) {
      setState(() => _currentIndex = index);
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          // If we're not on the home page, navigate to home
          if (_currentIndex != 0) {
            _onItemTapped(0);
          }
          // If we're already on home, do nothing (prevent app from closing)
        }
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: theme.scaffoldBackgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(),
        bottomNavigationBar: CustomBottomMenu(
          screenWidth: MediaQuery.of(context).size.width,
          currentIndex: _currentIndex,
          onIconPressed: _onItemTapped,
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: Layout._navItems.map((item) => item.widget).toList(),
        ),
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
