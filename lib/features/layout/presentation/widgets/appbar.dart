import 'package:flutter/material.dart';
import 'package:ott_platform/core/common/settings/settings.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.isDrawerOpen});
  final bool isDrawerOpen;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();

  final Tween<double> turnsTween = Tween<double>(begin: 0, end: 1);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: Icon(
          Icons.menu,
          color: widget.isDrawerOpen ? Colors.transparent : Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: RotationTransition(
            turns: turnsTween.animate(_controller),
            child: Icon(Icons.settings, color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                opaque: false,
                barrierColor: Colors.black54,
                pageBuilder: (context, _, __) => const SettingsDialog(),
              ),
            );
          },
        ),
      ],
    );
  }
}
