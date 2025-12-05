import 'package:flutter/material.dart';
import 'package:ott_platform/core/common/constant/app_dimensions.dart';
import 'package:ott_platform/core/models/content_model.dart';
import 'package:ott_platform/features/layout/presentation/widgets/appbar.dart';
import 'package:sizer/sizer.dart';

class DetailView extends StatefulWidget {
  final ContentModel content;
  const DetailView({super.key, required this.content});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String _getAgeRating() {
    if (widget.content.rating >= 8.5) {
      return '18+';
    } else if (widget.content.rating >= 7.0) {
      return '16+';
    } else if (widget.content.rating >= 5.0) {
      return '13+';
    }
    return 'PG';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image with Play Button Overlay
            SizedBox(
              height: screenHeight * 0.4,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: widget.content.id,
                    child: Image.asset(
                      widget.content.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Gradient overlay
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            theme.scaffoldBackgroundColor.withOpacity(0.5),
                            theme.scaffoldBackgroundColor,
                          ],
                          stops: const [0.0, 0.5, 0.8, 1.0],
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),

            // Content Section
            Padding(
              padding: EdgeInsets.all(AppDimensions.paddingL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    widget.content.title,
                    style: theme.textTheme.displayLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(height: 1.5.h),

                  // Metadata Row
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      // Age Rating
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[700]!),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _getAgeRating(),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                      // Duration
                      Text(
                        widget.content.durationFormatted,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 13.sp,
                        ),
                      ),
                      // Dot separator
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      // Genre
                      Text(
                        widget.content.genres.isNotEmpty
                            ? widget.content.genres.first.displayName
                            : '',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 13.sp,
                        ),
                      ),
                      // Dot separator
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      // Year
                      Text(
                        widget.content.year.toString(),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),

                  // Action Buttons Row
                  Row(
                    children: [
                      // Download Button
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[900]!.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.download_outlined,
                              color: Colors.white,
                              size: 24,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Download',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.white,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 2.w),
                      // Play Now Button
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Handle play now
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: theme.primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Play now',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.5.h),

                  // Synopsis
                  Text(
                    widget.content.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[300],
                      fontSize: 13.sp,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 3.h),

                  // Cast and Crew Section Header
                  Row(
                    children: [
                      TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        indicatorColor: theme.primaryColor,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.grey[500],
                        indicatorSize: TabBarIndicatorSize.label,
                        dividerColor: Colors.transparent,
                        labelStyle: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        unselectedLabelStyle: theme.textTheme.titleMedium
                            ?.copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                        tabs: const [
                          Tab(text: 'Cast'),
                          Tab(text: 'Director & crew'),
                        ],
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          // Handle see all
                        },
                        child: Text(
                          'See all',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.primaryColor,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),

                  // Cast List
                  SizedBox(
                    height: 130,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Cast Tab
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.content.cast.length,
                          itemBuilder: (context, index) {
                            final actor = widget.content.cast[index];
                            return Container(
                              width: 85,
                              margin: EdgeInsets.only(
                                right: AppDimensions.paddingM,
                              ),
                              child: Column(
                                children: [
                                  // Actor Avatar
                                  Container(
                                    width: 85,
                                    height: 85,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[800],
                                      image: DecorationImage(
                                        image: AssetImage(
                                          widget.content.imagePath,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 0.8.h),
                                  Text(
                                    actor,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: Colors.white,
                                      fontSize: 11.sp,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        // Director & Crew Tab
                        widget.content.director != null
                            ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 85,
                                  margin: EdgeInsets.only(
                                    right: AppDimensions.paddingM,
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 85,
                                        height: 85,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[800],
                                          image: DecorationImage(
                                            image: AssetImage(
                                              widget.content.imagePath,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 0.8.h),
                                      Text(
                                        widget.content.director!,
                                        style: theme.textTheme.bodySmall
                                            ?.copyWith(
                                              color: Colors.white,
                                              fontSize: 11.sp,
                                            ),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                            : Center(
                              child: Text(
                                'No director information available',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
