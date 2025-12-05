import 'package:flutter/material.dart';
import 'package:ott_platform/core/data/sample_content.dart';
import 'package:ott_platform/core/common/constant/app_dimensions.dart';
import 'package:ott_platform/features/dashboard/presentation/widgets/trending_card.dart';
import 'package:ott_platform/features/dashboard/presentation/widgets/heading/header_slider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          HeaderSlider(content: SampleContent.trendingContent.take(6).toList()),
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.paddingL),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Trending Now',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 305,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(bottom: 8),
                    itemBuilder: (context, index) {
                      final content = SampleContent.trendingContent[index];
                      return TrendingCard(content: content, onTap: () {});
                    },
                    itemCount: SampleContent.trendingContent.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
