import 'package:flutter/material.dart';
import 'package:ott_platform/core/common/ui/custom_button.dart';
import 'package:ott_platform/core/models/content_model.dart';
import 'package:ott_platform/features/details/presentation/pages/detail_view.dart';

class HeadingActions extends StatelessWidget {
  final ContentModel content;
  const HeadingActions({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        CustomButtons(
          icon: 'assets/icons/common/ic-solar-play.svg',
          text: 'Watch Trailer',
          borderColor: theme.primaryColor,
          backgroundColor: theme.primaryColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailView(content: content),
              ),
            );
          },
        ),
        const SizedBox(width: 10),
        CustomButtons(
          icon: 'assets/icons/common/ic-round-local-movies.svg',
          text: 'More Details',
          onPressed: () {},
        ),
      ],
    );
  }
}
