// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ott_platform/core/common/ui/custom_tags.dart';
import 'package:ott_platform/core/models/content_model.dart';
import 'package:ott_platform/features/dashboard/presentation/widgets/heading/heading_actions.dart';
import 'package:ott_platform/features/dashboard/presentation/widgets/heading/heading_date_time.dart';
import 'package:sizer/sizer.dart';

class HeaderSlider extends StatefulWidget {
  final List<ContentModel> content;
  final Duration autoSlideDuration;
  final Duration transitionDuration;

  const HeaderSlider({
    super.key,
    required this.content,
    this.autoSlideDuration = const Duration(seconds: 5),
    this.transitionDuration = const Duration(milliseconds: 350),
  });

  @override
  State<HeaderSlider> createState() => _HeaderSliderState();
}

class _HeaderSliderState extends State<HeaderSlider> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(widget.autoSlideDuration, (timer) {
      if (_pageController.hasClients) {
        final nextPage = (_currentPage + 1) % widget.content.length;
        _pageController.animateToPage(
          nextPage,
          duration: widget.transitionDuration,
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page % widget.content.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.scaffoldBackgroundColor;

    return SizedBox(
      height: 53.h,
      width: double.infinity,
      child: Stack(
        children: [
          // PageView for sliding images
          PageView.builder(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: widget.content.length * 1000, // Infinite scroll
            itemBuilder: (context, index) {
              final content = widget.content[index % widget.content.length];
              return Stack(
                fit: StackFit.expand,
                children: [
                  // Background Image
                  Hero(
                    tag: content.id,
                    child: Image.asset(content.imagePath, fit: BoxFit.cover),
                  ),
                  // Gradient Overlay
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.5, 0.77, 1],
                        colors: [
                          backgroundColor.withOpacity(0),
                          backgroundColor.withOpacity(0.65),
                          backgroundColor,
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          // Content Information Overlay
          Positioned(
            bottom: 30,
            left: 15,
            right: 15,
            child: AnimatedSwitcher(
              duration: widget.transitionDuration,
              child: _buildContentInfo(widget.content[_currentPage], theme),
            ),
          ),
          // Animated Dots Indicator
          Positioned(bottom: 0, left: 0, right: 0, child: _buildAnimatedDots()),
        ],
      ),
    );
  }

  Widget _buildContentInfo(ContentModel content, ThemeData theme) {
    return Column(
      key: ValueKey(content.id),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Type Tag (Movie/Series)
        Row(
          children: [
            CustomTags(
              borderColor: theme.primaryColor.withOpacity(0.5),
              backgroundColor: Colors.black.withOpacity(0.6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    content.isMovie
                        ? 'assets/icons/common/ic-round-local-movies.svg'
                        : 'assets/icons/nav/ic-mingcute-tv.svg',
                    color: theme.colorScheme.primary,
                    width: 22,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    content.type.displayName,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 15.5.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Title
        Text(
          content.title,
          style: theme.textTheme.displayLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        // Date and Duration
        HeadingDateTime(
          date: content.year.toString(),
          time:
              content.isSeries
                  ? (content.seriesInfo ?? '${content.durationMinutes} min')
                  : '${content.durationMinutes} min',
        ),
        const SizedBox(height: 12),
        // Genre Tags
        SizedBox(
          width: 80.w,
          child: Wrap(
            spacing: 7,
            runSpacing: 7,
            children:
                content.genres
                    .take(3)
                    .map((genre) => CustomTags(tag: genre.displayName))
                    .toList(),
          ),
        ),
        const SizedBox(height: 20),
        // Action Buttons
        HeadingActions(content: content),
      ],
    );
  }

  Widget _buildAnimatedDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.content.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: _currentPage == index ? 24 : 8,
          decoration: BoxDecoration(
            color:
                _currentPage == index
                    ? Theme.of(context).primaryColor
                    : Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
