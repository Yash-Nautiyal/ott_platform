import 'package:flutter/material.dart';
import 'package:ott_platform/core/models/content_model.dart';
import 'package:ott_platform/core/theme/app_pallete.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({super.key, required this.content, this.onTap});

  final ContentModel content;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 210,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppPallete.grey800,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      content.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                _getGenreColor(
                                  content.genres.firstOrNull,
                                ).withOpacity(0.6),
                                _getGenreColor(
                                  content.genres.firstOrNull,
                                ).withOpacity(0.3),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.movie_outlined,
                              size: 48,
                              color: AppPallete.white.withOpacity(0.5),
                            ),
                          ),
                        );
                      },
                    ),
                    // Rating badge (top right)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              content.rating.toStringAsFixed(1),
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                color: AppPallete.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Title
            Text(
              content.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppPallete.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 5),
            // Year and Duration
            Row(
              children: [
                Text(
                  '${content.year}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppPallete.grey400,
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(Icons.circle, size: 3, color: AppPallete.grey400),
                ),
                Icon(
                  Icons.access_time_rounded,
                  size: 13,
                  color: AppPallete.grey400,
                ),
                const SizedBox(width: 3),
                Flexible(
                  child: Text(
                    content.durationFormatted,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppPallete.grey400,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            // Genre Tags
            Wrap(
              spacing: 5,
              runSpacing: 5,
              children:
                  content.genres.take(2).map((genre) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppPallete.grey800,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppPallete.grey700, width: 1),
                      ),
                      child: Text(
                        genre.displayName,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppPallete.grey300,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Color _getGenreColor(Genre? genre) {
    if (genre == null) return const Color(0xFF6C757D);

    final colors = {
      Genre.action: const Color(0xFFFF6B6B),
      Genre.adventure: const Color(0xFF4ECDC4),
      Genre.animation: const Color(0xFFFFBE0B),
      Genre.comedy: const Color(0xFFFB5607),
      Genre.crime: const Color(0xFF8338EC),
      Genre.documentary: const Color(0xFF3A86FF),
      Genre.drama: const Color(0xFFE63946),
      Genre.fantasy: const Color(0xFFA855F7),
      Genre.horror: const Color(0xFF9D0208),
      Genre.mystery: const Color(0xFF5A189A),
      Genre.romance: const Color(0xFFFF006E),
      Genre.sciFi: const Color(0xFF06FFA5),
      Genre.thriller: const Color(0xFFD62828),
      Genre.western: const Color(0xFFD4A574),
    };

    return colors[genre] ?? const Color(0xFF6C757D);
  }
}
