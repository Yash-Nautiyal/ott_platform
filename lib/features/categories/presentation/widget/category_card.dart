import 'package:flutter/material.dart';
import 'package:ott_platform/core/theme/app_pallete.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.itemCount,
    this.imagePath,
    this.onTap,
  });

  final String title;
  final int itemCount;
  final String? imagePath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background Image or Gradient
              if (imagePath != null)
                Image.asset(imagePath!, fit: BoxFit.cover)
              else
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        _getGradientColor(title).withOpacity(0.8),
                        _getGradientColor(title).withOpacity(0.4),
                      ],
                    ),
                  ),
                ),
              // Dark overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppPallete.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.8),
                            offset: const Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Hover effect indicator
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: AppPallete.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Get a color based on category name for gradient
  Color _getGradientColor(String category) {
    final colors = {
      'Action': const Color(0xFFFF6B6B),
      'Adventure': const Color(0xFF4ECDC4),
      'Animation': const Color(0xFFFFBE0B),
      'Comedy': const Color(0xFFFB5607),
      'Crime': const Color(0xFF8338EC),
      'Documentary': const Color(0xFF3A86FF),
      'Drama': const Color(0xFFE63946),
      'Fantasy': const Color(0xFFA855F7),
      'Horror': const Color(0xFF9D0208),
      'Mystery': const Color(0xFF5A189A),
      'Romance': const Color(0xFFFF006E),
      'Sci-Fi': const Color(0xFF06FFA5),
      'Thriller': const Color(0xFFD62828),
      'Western': const Color(0xFFD4A574),
    };

    return colors[category] ?? const Color(0xFF6C757D);
  }
}
