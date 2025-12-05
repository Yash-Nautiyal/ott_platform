import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ott_platform/core/theme/app_pallete.dart';
import 'package:sizer/sizer.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Scale factor to match the container size
    final scaleX = size.width / 260.0;
    final scaleY = size.height / 250.0;

    // Node 1: Start at (146.77, 0) with next control (181.42, 0)
    path.moveTo(146.77044829537317 * scaleX, 0);

    // Node 2: (183.24, 66.63) with prev (157.77, 35.21) and next (218.87, 101.70)
    // Curve from node 1 to node 2: control1 = next of node1, control2 = prev of node2
    path.cubicTo(
      181.42099999999985 * scaleX,
      0,
      157.765 * scaleX,
      35.209 * scaleY,
      183.2414903903709 * scaleX,
      66.63035779083539 * scaleY,
    );

    // Node 3: (260, 114.50) with prev (260, 69.36) and next (260, 155.60)
    // Curve from node 2 to node 3: control1 = next of node2, control2 = prev of node3
    path.cubicTo(
      218.867 * scaleX,
      101.697 * scaleY,
      260 * scaleX,
      69.36399999999998 * scaleY,
      260 * scaleX,
      114.50055055828443 * scaleY,
    );

    // Node 4: (260, 225) with next (260, 231.42)
    // Line from node 3 to node 4 (straight line on right edge, no prev control on node 4)
    path.lineTo(259.99991275054987 * scaleX, 225.00000235798598 * scaleY);

    // Node 5: (252.81, 242.26) with prev (257.42, 237.61) and next (247.91, 247.20)
    // Curve from node 4 to node 5: control1 = next of node4, control2 = prev of node5
    path.cubicTo(
      260 * scaleX,
      231.4249251588353 * scaleY,
      257.42471956556096 * scaleX,
      237.6083901961651 * scaleY,
      252.81249601628292 * scaleX,
      242.25618385751102 * scaleY,
    );

    // Node 6: (234, 250) with prev (241.11, 250)
    // Curve from node 5 to node 6: control1 = next of node5, control2 = prev of node6
    path.cubicTo(
      247.90806687295313 * scaleX,
      247.2001657087742 * scaleY,
      241.10535246754574 * scaleX,
      250.00000261998446 * scaleY,
      233.99992147549483 * scaleX,
      250.00000261998446 * scaleY,
    );

    // Node 7: (26, 250) with next (18.89, 250)
    // Line from node 6 to node 7 (straight line along bottom)
    path.lineTo(25.999991275054985 * scaleX, 250.00000261998446 * scaleY);

    // Node 8: (7.19, 242.26) with prev (12.09, 247.20) and next (2.58, 237.61)
    // Curve from node 7 to node 8: control1 = next of node7, control2 = prev of node8
    path.cubicTo(
      18.894560283004058 * scaleX,
      250.00000261998446 * scaleY,
      12.091845877596722 * scaleX,
      247.2001657087742 * scaleY,
      7.187416734266898 * scaleX,
      242.25618385751102 * scaleY,
    );

    // Node 9: (0, 225) with prev (0, 231.42)
    // Curve from node 8 to node 9: control1 = next of node8, control2 = prev of node9
    path.cubicTo(
      2.575193184988871 * scaleX,
      237.6083901961651 * scaleY,
      0,
      231.4249251588353 * scaleY,
      0,
      225.00000235798598 * scaleY,
    );

    // Node 10: (0, 25) with next (0, 18.58)
    // Line from node 9 to node 10 (straight line on left edge)
    path.lineTo(0, 25.000000261998444 * scaleY);

    // Node 11: (7.19, 7.74) with prev (2.58, 12.39) and next (12.09, 2.80)
    // Curve from node 10 to node 11: control1 = next of node10, control2 = prev of node11
    path.cubicTo(
      0,
      18.57507746114917 * scaleY,
      2.575193184988871 * scaleX,
      12.391612423819371 * scaleY,
      7.187416734266898 * scaleX,
      7.74381876247342 * scaleY,
    );

    // Node 12: (26, 0) with prev (18.89, 0)
    // Curve from node 11 to node 12: control1 = next of node11, control2 = prev of node12
    path.cubicTo(
      12.091845877596722 * scaleX,
      2.799836911210248 * scaleY,
      18.894560283004058 * scaleX,
      0,
      25.999991275054985 * scaleX,
      0,
    );

    // Close the path back to start (node 1)
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

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
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipPath(
              clipper: CustomShapeClipper(),
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
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(
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
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Material(
                  elevation: 10,
                  color: Colors.transparent,
                  child: Container(
                    padding: EdgeInsets.all(13.sp),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: AppPallete.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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
