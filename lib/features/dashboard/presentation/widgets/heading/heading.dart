// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ott_platform/features/dashboard/presentation/widgets/heading/heading_actions.dart';
import 'package:ott_platform/features/dashboard/presentation/widgets/heading/heading_date_time.dart';
import 'package:ott_platform/core/common/ui/custom_tags.dart';
import 'package:sizer/sizer.dart';

class Heading extends StatelessWidget {
  const Heading({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 15,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomTags(
                borderColor: Colors.redAccent.withOpacity(0.5),
                backgroundColor: Colors.black.withOpacity(0.6),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/common/ic-round-local-movies.svg',
                      color: Colors.redAccent,
                      width: 22,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      'Movie',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            'Joker',
            style: Theme.of(
              context,
            ).textTheme.displayLarge?.copyWith(color: Colors.white),
          ),
          const HeadingDateTime(date: '2019', time: '120 min'),
          const SizedBox(height: 20),
          SizedBox(
            width: 80.w,
            child: Wrap(
              spacing: 7,
              runSpacing: 7,
              children: [
                const CustomTags(tag: 'Psychological Drama'),
                const CustomTags(tag: 'Tragedy'),
                const CustomTags(tag: 'Crime'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const HeadingActions(),
        ],
      ),
    );
  }
}
