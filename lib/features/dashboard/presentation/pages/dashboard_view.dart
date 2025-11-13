import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:ott_platform/features/dashboard/presentation/widgets/heading/heading.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = const Color.fromARGB(255, 15, 15, 15);

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 50.h,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset('assets/images/joker.jpg', fit: BoxFit.cover),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.5, 0.77, 1],
                      colors: [
                        backgroundColor.withOpacity(0),
                        backgroundColor.withOpacity(0.65),
                        backgroundColor,
                      ],
                    ),
                  ),
                ),
                const Heading(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
