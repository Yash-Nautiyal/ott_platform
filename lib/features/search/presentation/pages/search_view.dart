import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ott_platform/core/theme/app_pallete.dart';
import 'package:ott_platform/core/data/demo_content.dart';
import 'package:ott_platform/features/search/presentation/widgets/movie_card.dart';
import 'package:ott_platform/features/search/presentation/widgets/recent_card.dart';
import 'package:ott_platform/features/search/presentation/widgets/filter_bottom_sheet.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: TextEditingController(),
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  hintText: 'Search for movies, series, actors...',
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppPallete.grey500),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Recent Searches',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppPallete.white),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 15),
              height: 140,
              child: Builder(
                builder: (context) {
                  // Get recent searches from demo data (mix of movies and series)
                  final recentSearches = [
                    DemoContent.getById('movie_1')!, // The Batman
                    DemoContent.getById('movie_2')!, // Joker
                    DemoContent.getById('series_1')!, // Breaking Bad
                    DemoContent.getById('movie_3')!, // Inception
                  ];

                  return ListView.separated(
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 12),
                    shrinkWrap: true,
                    itemCount: recentSearches.length,
                    padding: const EdgeInsets.only(right: 15),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final content = recentSearches[index];

                      return RecentSearchCard(
                        title: content.title,
                        imagePath: content.imagePath,
                        type: content.type.displayName,
                        onTap: () {
                          // Handle recent search tap
                          // You can navigate to content details page here
                        },
                        onRemove: () {
                          // Handle remove recent search
                          // You can implement remove functionality here
                        },
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    'Browse Content',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: AppPallete.white),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.9,
                        ),
                        builder: (context) => const FilterBottomSheet(),
                      ).then((filters) {
                        if (filters != null) {
                          // Handle applied filters
                          print('Applied filters: $filters');
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppPallete.grey700.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/common/ic-mingcute-filter.svg',
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                              AppPallete.grey400,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Filters',
                            style: Theme.of(context).textTheme.labelLarge
                                ?.copyWith(color: AppPallete.grey400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Builder(
                builder: (context) {
                  // Get all content (movies and series) from demo data
                  final allContent = DemoContent.allContent;

                  return GridView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: allContent.length,
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                        ),
                    itemBuilder: (context, index) {
                      final content = allContent[index];

                      return MovieCard(
                        title: content.title,
                        imagePath: content.imagePath,
                        year: content.year.toString(),
                        duration: content.durationFormatted,
                        rating: content.rating,
                        onTap: () {
                          // Handle content card tap
                          // You can navigate to content details page here
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
