import 'package:flutter/material.dart';
import 'package:ott_platform/core/common/ui/custom_buttoms.dart';

class HeadingActions extends StatelessWidget {
  const HeadingActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButtoms(
          icon: 'assets/icons/common/ic-solar-play.svg',
          text: 'Watch Trailer',
          borderColor: const Color.fromARGB(255, 218, 56, 56),
          backgroundColor: const Color.fromARGB(255, 218, 56, 56),
          onPressed: () {},
        ),
        const SizedBox(width: 10),
        CustomButtoms(
          icon: 'assets/icons/common/ic-round-local-movies.svg',
          text: 'More Details',
          onPressed: () {},
        ),
      ],
    );
  }
}
