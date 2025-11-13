/// Enum for content types
enum ContentType {
  movie,
  series;

  String get displayName {
    switch (this) {
      case ContentType.movie:
        return 'Movie';
      case ContentType.series:
        return 'Series';
    }
  }
}

/// Enum for genres
enum Genre {
  action,
  adventure,
  animation,
  comedy,
  crime,
  documentary,
  drama,
  fantasy,
  horror,
  mystery,
  romance,
  sciFi,
  thriller,
  western;

  String get displayName {
    switch (this) {
      case Genre.action:
        return 'Action';
      case Genre.adventure:
        return 'Adventure';
      case Genre.animation:
        return 'Animation';
      case Genre.comedy:
        return 'Comedy';
      case Genre.crime:
        return 'Crime';
      case Genre.documentary:
        return 'Documentary';
      case Genre.drama:
        return 'Drama';
      case Genre.fantasy:
        return 'Fantasy';
      case Genre.horror:
        return 'Horror';
      case Genre.mystery:
        return 'Mystery';
      case Genre.romance:
        return 'Romance';
      case Genre.sciFi:
        return 'Sci-Fi';
      case Genre.thriller:
        return 'Thriller';
      case Genre.western:
        return 'Western';
    }
  }
}

/// Model class for movies and TV shows
class ContentModel {
  final String id;
  final String title;
  final ContentType type;
  final String description;
  final String imagePath;
  final String? backdropPath;
  final int year;
  final int durationMinutes; // For movies or average episode length for series
  final double rating; // Out of 10
  final List<Genre> genres;
  final String? director;
  final List<String> cast;
  final int? seasons; // For series only
  final int? episodes; // For series only
  final bool isTrending;
  final bool isNewRelease;
  final DateTime? releaseDate;

  ContentModel({
    required this.id,
    required this.title,
    required this.type,
    required this.description,
    required this.imagePath,
    this.backdropPath,
    required this.year,
    required this.durationMinutes,
    required this.rating,
    required this.genres,
    this.director,
    required this.cast,
    this.seasons,
    this.episodes,
    this.isTrending = false,
    this.isNewRelease = false,
    this.releaseDate,
  });

  /// Get formatted duration string
  String get durationFormatted {
    final hours = durationMinutes ~/ 60;
    final minutes = durationMinutes % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m';
  }

  /// Get genres as comma-separated string
  String get genresString {
    return genres.map((g) => g.displayName).join(', ');
  }

  /// Get cast as comma-separated string
  String get castString {
    return cast.join(', ');
  }

  /// Check if content is a movie
  bool get isMovie => type == ContentType.movie;

  /// Check if content is a series
  bool get isSeries => type == ContentType.series;

  /// Get series info (seasons & episodes)
  String? get seriesInfo {
    if (isSeries && seasons != null && episodes != null) {
      return '$seasons Season${seasons! > 1 ? 's' : ''} • $episodes Episodes';
    }
    return null;
  }

  /// Copy with method for updating properties
  ContentModel copyWith({
    String? id,
    String? title,
    ContentType? type,
    String? description,
    String? imagePath,
    String? backdropPath,
    int? year,
    int? durationMinutes,
    double? rating,
    List<Genre>? genres,
    String? director,
    List<String>? cast,
    int? seasons,
    int? episodes,
    bool? isTrending,
    bool? isNewRelease,
    DateTime? releaseDate,
  }) {
    return ContentModel(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
      backdropPath: backdropPath ?? this.backdropPath,
      year: year ?? this.year,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      rating: rating ?? this.rating,
      genres: genres ?? this.genres,
      director: director ?? this.director,
      cast: cast ?? this.cast,
      seasons: seasons ?? this.seasons,
      episodes: episodes ?? this.episodes,
      isTrending: isTrending ?? this.isTrending,
      isNewRelease: isNewRelease ?? this.isNewRelease,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type.name,
      'description': description,
      'imagePath': imagePath,
      'backdropPath': backdropPath,
      'year': year,
      'durationMinutes': durationMinutes,
      'rating': rating,
      'genres': genres.map((g) => g.name).toList(),
      'director': director,
      'cast': cast,
      'seasons': seasons,
      'episodes': episodes,
      'isTrending': isTrending,
      'isNewRelease': isNewRelease,
      'releaseDate': releaseDate?.toIso8601String(),
    };
  }

  /// Create from JSON
  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      id: json['id'] as String,
      title: json['title'] as String,
      type: ContentType.values.firstWhere((e) => e.name == json['type']),
      description: json['description'] as String,
      imagePath: json['imagePath'] as String,
      backdropPath: json['backdropPath'] as String?,
      year: json['year'] as int,
      durationMinutes: json['durationMinutes'] as int,
      rating: (json['rating'] as num).toDouble(),
      genres:
          (json['genres'] as List)
              .map((g) => Genre.values.firstWhere((e) => e.name == g))
              .toList(),
      director: json['director'] as String?,
      cast: List<String>.from(json['cast'] as List),
      seasons: json['seasons'] as int?,
      episodes: json['episodes'] as int?,
      isTrending: json['isTrending'] as bool? ?? false,
      isNewRelease: json['isNewRelease'] as bool? ?? false,
      releaseDate:
          json['releaseDate'] != null
              ? DateTime.parse(json['releaseDate'] as String)
              : null,
    );
  }

  @override
  String toString() {
    return 'ContentModel(id: $id, title: $title, type: ${type.displayName}, year: $year, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContentModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
