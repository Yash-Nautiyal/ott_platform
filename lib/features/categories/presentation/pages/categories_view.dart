import 'package:flutter/material.dart';
import 'package:ott_platform/core/common/constant/app_dimensions.dart';
import 'package:ott_platform/core/theme/app_pallete.dart';
import 'package:ott_platform/core/models/content_model.dart';
import 'package:ott_platform/core/data/demo_content.dart';
import 'package:ott_platform/features/categories/presentation/widget/category_card.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingL,
      ).copyWith(top: MediaQuery.of(context).padding.top),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          // Header
          Text(
            'Browse by Categories',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppPallete.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Explore content by genre',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppPallete.grey400),
          ),
          const SizedBox(height: 20),
          // Categories Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: Genre.values.length,
              itemBuilder: (context, index) {
                final genre = Genre.values[index];
                final genreContent = DemoContent.getByGenre(genre);

                // Get a sample image from the genre's content
                final imagePath =
                    genreContent.isNotEmpty
                        ? genreContent.first.imagePath
                        : null;

                return CategoryCard(
                  title: genre.displayName,
                  itemCount: genreContent.length,
                  imagePath: imagePath,
                  onTap: () {
                    // Handle category tap
                    // You can navigate to a filtered view here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Showing ${genre.displayName} content (${genreContent.length} items)',
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
