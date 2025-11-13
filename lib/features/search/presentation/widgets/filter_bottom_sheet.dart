import 'package:flutter/material.dart';
import 'package:ott_platform/core/theme/app_pallete.dart';
import 'package:ott_platform/core/models/content_model.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedGenre = 'All Genres';
  String selectedContentType = 'All Types';
  String selectedSortBy = 'Newest';

  // Get genres from the Genre enum
  List<String> get genres {
    final genreList = ['All Genres'];
    genreList.addAll(Genre.values.map((genre) => genre.displayName));
    return genreList;
  }

  // Get content types from the ContentType enum
  List<String> get contentTypes {
    final typeList = ['All Types'];
    typeList.addAll(ContentType.values.map((type) => type.displayName));
    return typeList;
  }

  final List<Map<String, dynamic>> sortOptions = [
    {'label': 'Newest', 'icon': Icons.access_time_rounded},
    {'label': 'Trending', 'icon': Icons.trending_up_rounded},
    {'label': 'Top Rated', 'icon': Icons.star_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D29),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppPallete.grey600,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filters',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: AppPallete.white),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedGenre = 'All Genres';
                      selectedContentType = 'All Types';
                      selectedSortBy = 'Newest';
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.redAccent),
                    side: WidgetStateProperty.all(
                      BorderSide(color: Colors.redAccent),
                    ),
                  ),

                  child: Text(
                    'Reset',
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(color: AppPallete.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Content
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Genre Section
                  _buildSectionTitle('GENRE'),
                  const SizedBox(height: 12),
                  _buildChipGroup(
                    items: genres,
                    selectedItem: selectedGenre,
                    onSelected: (value) {
                      setState(() {
                        selectedGenre = value;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  // Content Type Section
                  _buildSectionTitle('CONTENT TYPE'),
                  const SizedBox(height: 12),
                  _buildChipGroup(
                    items: contentTypes,
                    selectedItem: selectedContentType,
                    onSelected: (value) {
                      setState(() {
                        selectedContentType = value;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  // Sort By Section
                  _buildSectionTitle('SORT BY'),
                  const SizedBox(height: 12),
                  _buildSortByOptions(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          // Apply Button
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Apply filters and close
                  Navigator.pop(context, {
                    'genre': selectedGenre,
                    'contentType': selectedContentType,
                    'sortBy': selectedSortBy,
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: AppPallete.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Apply Filters',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppPallete.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: AppPallete.grey400,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildChipGroup({
    required List<String> items,
    required String selectedItem,
    required Function(String) onSelected,
  }) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children:
          items.map((item) {
            final isSelected = item == selectedItem;
            return GestureDetector(
              onTap: () => onSelected(item),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? const Color(0xFFFF6B81).withOpacity(0.15)
                          : AppPallete.grey700.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color:
                        isSelected
                            ? const Color(0xFFFF6B81)
                            : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Text(
                  item,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        isSelected ? const Color(0xFFFF6B81) : AppPallete.white,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildSortByOptions() {
    return Column(
      children:
          sortOptions.map((option) {
            final isSelected = option['label'] == selectedSortBy;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedSortBy = option['label'] as String;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? const Color(0xFFFF6B81).withOpacity(0.15)
                          : AppPallete.grey700.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color:
                        isSelected
                            ? const Color(0xFFFF6B81)
                            : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      option['icon'] as IconData,
                      color:
                          isSelected
                              ? const Color(0xFFFF6B81)
                              : AppPallete.grey400,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      option['label'] as String,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color:
                            isSelected
                                ? const Color(0xFFFF6B81)
                                : AppPallete.white,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    if (isSelected)
                      const Icon(
                        Icons.check_circle_rounded,
                        color: Color(0xFFFF6B81),
                        size: 20,
                      ),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }
}
