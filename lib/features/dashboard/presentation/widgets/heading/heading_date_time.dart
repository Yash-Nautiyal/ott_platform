import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeadingDateTime extends StatelessWidget {
  final String date;
  final String time;
  const HeadingDateTime({super.key, required this.date, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/common/ic-solar-calendar.svg',
              color: Colors.white,
              width: 17,
            ),
            const SizedBox(width: 5),
            Text(
              date,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ],
        ),
        const SizedBox(width: 15),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/common/ic-solar-clock-circle.svg',
              color: Colors.white,
              width: 17,
            ),
            const SizedBox(width: 5),
            Text(
              time,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
