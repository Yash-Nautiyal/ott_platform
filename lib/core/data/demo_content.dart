import 'package:ott_platform/core/models/content_model.dart';

/// Demo content data for the OTT platform
class DemoContent {
  static final List<ContentModel> allContent = [
    // Movies
    ContentModel(
      id: 'movie_1',
      title: 'The Batman',
      type: ContentType.movie,
      description:
          'When a sadistic serial killer begins murdering key political figures in Gotham, Batman is forced to investigate the city\'s hidden corruption and question his family\'s involvement.',
      imagePath: 'assets/images/the_batman.jpg',
      backdropPath: 'assets/images/the_batman.jpg',
      year: 2022,
      durationMinutes: 176,
      rating: 8.2,
      genres: [Genre.action, Genre.crime, Genre.drama],
      director: 'Matt Reeves',
      cast: ['Robert Pattinson', 'Zoë Kravitz', 'Paul Dano', 'Jeffrey Wright'],
      isTrending: true,
      isNewRelease: false,
      releaseDate: DateTime(2022, 3, 4),
    ),
    ContentModel(
      id: 'movie_2',
      title: 'Joker',
      type: ContentType.movie,
      description:
          'A mentally troubled stand-up comedian embarks on a downward spiral of social revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.',
      imagePath: 'assets/images/joker.jpg',
      backdropPath: 'assets/images/joker.jpg',
      year: 2019,
      durationMinutes: 122,
      rating: 8.4,
      genres: [Genre.crime, Genre.drama, Genre.thriller],
      director: 'Todd Phillips',
      cast: ['Joaquin Phoenix', 'Robert De Niro', 'Zazie Beetz'],
      isTrending: true,
      isNewRelease: false,
      releaseDate: DateTime(2019, 10, 4),
    ),
    ContentModel(
      id: 'movie_3',
      title: 'Inception',
      type: ContentType.movie,
      description:
          'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.',
      imagePath: 'assets/images/the_batman.jpg',
      backdropPath: 'assets/images/the_batman.jpg',
      year: 2010,
      durationMinutes: 148,
      rating: 8.8,
      genres: [Genre.action, Genre.sciFi, Genre.thriller],
      director: 'Christopher Nolan',
      cast: [
        'Leonardo DiCaprio',
        'Joseph Gordon-Levitt',
        'Elliot Page',
        'Tom Hardy',
      ],
      isTrending: false,
      isNewRelease: false,
      releaseDate: DateTime(2010, 7, 16),
    ),
    ContentModel(
      id: 'movie_4',
      title: 'The Dark Knight',
      type: ContentType.movie,
      description:
          'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
      imagePath: 'assets/images/joker.jpg',
      backdropPath: 'assets/images/joker.jpg',
      year: 2008,
      durationMinutes: 152,
      rating: 9.0,
      genres: [Genre.action, Genre.crime, Genre.drama],
      director: 'Christopher Nolan',
      cast: [
        'Christian Bale',
        'Heath Ledger',
        'Aaron Eckhart',
        'Michael Caine',
      ],
      isTrending: false,
      isNewRelease: false,
      releaseDate: DateTime(2008, 7, 18),
    ),
    ContentModel(
      id: 'movie_5',
      title: 'Interstellar',
      type: ContentType.movie,
      description:
          'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
      imagePath: 'assets/images/the_batman.jpg',
      backdropPath: 'assets/images/the_batman.jpg',
      year: 2014,
      durationMinutes: 169,
      rating: 8.7,
      genres: [Genre.adventure, Genre.drama, Genre.sciFi],
      director: 'Christopher Nolan',
      cast: [
        'Matthew McConaughey',
        'Anne Hathaway',
        'Jessica Chastain',
        'Michael Caine',
      ],
      isTrending: false,
      isNewRelease: false,
      releaseDate: DateTime(2014, 11, 7),
    ),
    ContentModel(
      id: 'movie_6',
      title: 'The Shawshank Redemption',
      type: ContentType.movie,
      description:
          'Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion.',
      imagePath: 'assets/images/joker.jpg',
      backdropPath: 'assets/images/joker.jpg',
      year: 1994,
      durationMinutes: 142,
      rating: 9.3,
      genres: [Genre.drama],
      director: 'Frank Darabont',
      cast: ['Tim Robbins', 'Morgan Freeman', 'Bob Gunton'],
      isTrending: false,
      isNewRelease: false,
      releaseDate: DateTime(1994, 9, 23),
    ),
    ContentModel(
      id: 'movie_7',
      title: 'Agent 327: Operation Barbershop',
      type: ContentType.movie,
      description:
          'Agent 327 is investigating a clue that leads him to a shady barbershop in Amsterdam. Little does he know that he is being tailed by mercenary Boris Kloris.',
      imagePath: 'assets/images/the_batman.jpg',
      backdropPath: 'assets/images/the_batman.jpg',
      year: 2017,
      durationMinutes: 10,
      rating: 7.5,
      genres: [Genre.animation, Genre.action, Genre.comedy],
      director: 'Hjalti Hjalmarsson',
      cast: ['Voice Cast'],
      isTrending: false,
      isNewRelease: false,
      releaseDate: DateTime(2017, 5, 15),
    ),
    ContentModel(
      id: 'movie_8',
      title: 'Dune',
      type: ContentType.movie,
      description:
          'A noble family becomes embroiled in a war for control over the galaxy\'s most valuable asset while its heir becomes troubled by visions of a dark future.',
      imagePath: 'assets/images/joker.jpg',
      backdropPath: 'assets/images/joker.jpg',
      year: 2021,
      durationMinutes: 155,
      rating: 8.0,
      genres: [Genre.action, Genre.adventure, Genre.drama, Genre.sciFi],
      director: 'Denis Villeneuve',
      cast: ['Timothée Chalamet', 'Rebecca Ferguson', 'Zendaya', 'Oscar Isaac'],
      isTrending: true,
      isNewRelease: false,
      releaseDate: DateTime(2021, 10, 22),
    ),
    ContentModel(
      id: 'movie_9',
      title: 'Oppenheimer',
      type: ContentType.movie,
      description:
          'The story of American scientist J. Robert Oppenheimer and his role in the development of the atomic bomb.',
      imagePath: 'assets/images/the_batman.jpg',
      backdropPath: 'assets/images/the_batman.jpg',
      year: 2023,
      durationMinutes: 180,
      rating: 8.5,
      genres: [Genre.drama, Genre.thriller],
      director: 'Christopher Nolan',
      cast: [
        'Cillian Murphy',
        'Emily Blunt',
        'Matt Damon',
        'Robert Downey Jr.',
      ],
      isTrending: true,
      isNewRelease: true,
      releaseDate: DateTime(2023, 7, 21),
    ),
    ContentModel(
      id: 'movie_10',
      title: 'Spider-Man: Across the Spider-Verse',
      type: ContentType.movie,
      description:
          'Miles Morales catapults across the Multiverse, where he encounters a team of Spider-People charged with protecting its very existence.',
      imagePath: 'assets/images/joker.jpg',
      backdropPath: 'assets/images/joker.jpg',
      year: 2023,
      durationMinutes: 140,
      rating: 8.7,
      genres: [Genre.animation, Genre.action, Genre.adventure],
      director: 'Joaquim Dos Santos',
      cast: ['Shameik Moore', 'Hailee Steinfeld', 'Oscar Isaac'],
      isTrending: true,
      isNewRelease: true,
      releaseDate: DateTime(2023, 6, 2),
    ),

    // TV Series
    ContentModel(
      id: 'series_1',
      title: 'Breaking Bad',
      type: ContentType.series,
      description:
          'A chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine with a former student in order to secure his family\'s future.',
      imagePath: 'assets/images/the_batman.jpg',
      backdropPath: 'assets/images/the_batman.jpg',
      year: 2008,
      durationMinutes: 47, // Average episode length
      rating: 9.5,
      genres: [Genre.crime, Genre.drama, Genre.thriller],
      director: 'Vince Gilligan',
      cast: ['Bryan Cranston', 'Aaron Paul', 'Anna Gunn', 'Dean Norris'],
      seasons: 5,
      episodes: 62,
      isTrending: false,
      isNewRelease: false,
      releaseDate: DateTime(2008, 1, 20),
    ),
    ContentModel(
      id: 'series_2',
      title: 'Stranger Things',
      type: ContentType.series,
      description:
          'When a young boy disappears, his mother, a police chief and his friends must confront terrifying supernatural forces in order to get him back.',
      imagePath: 'assets/images/joker.jpg',
      backdropPath: 'assets/images/joker.jpg',
      year: 2016,
      durationMinutes: 51,
      rating: 8.7,
      genres: [Genre.drama, Genre.fantasy, Genre.horror],
      director: 'The Duffer Brothers',
      cast: [
        'Millie Bobby Brown',
        'Finn Wolfhard',
        'Winona Ryder',
        'David Harbour',
      ],
      seasons: 4,
      episodes: 42,
      isTrending: true,
      isNewRelease: false,
      releaseDate: DateTime(2016, 7, 15),
    ),
    ContentModel(
      id: 'series_3',
      title: 'The Last of Us',
      type: ContentType.series,
      description:
          'After a global pandemic destroys civilization, a hardened survivor takes charge of a 14-year-old girl who may be humanity\'s last hope.',
      imagePath: 'assets/images/the_batman.jpg',
      backdropPath: 'assets/images/the_batman.jpg',
      year: 2023,
      durationMinutes: 53,
      rating: 8.8,
      genres: [Genre.action, Genre.adventure, Genre.drama],
      director: 'Craig Mazin',
      cast: ['Pedro Pascal', 'Bella Ramsey', 'Anna Torv', 'Nick Offerman'],
      seasons: 1,
      episodes: 9,
      isTrending: true,
      isNewRelease: true,
      releaseDate: DateTime(2023, 1, 15),
    ),
    ContentModel(
      id: 'series_4',
      title: 'Game of Thrones',
      type: ContentType.series,
      description:
          'Nine noble families fight for control over the lands of Westeros, while an ancient enemy returns after being dormant for a millennia.',
      imagePath: 'assets/images/joker.jpg',
      backdropPath: 'assets/images/joker.jpg',
      year: 2011,
      durationMinutes: 57,
      rating: 9.2,
      genres: [Genre.action, Genre.adventure, Genre.drama, Genre.fantasy],
      director: 'David Benioff',
      cast: ['Emilia Clarke', 'Peter Dinklage', 'Kit Harington', 'Lena Headey'],
      seasons: 8,
      episodes: 73,
      isTrending: false,
      isNewRelease: false,
      releaseDate: DateTime(2011, 4, 17),
    ),
    ContentModel(
      id: 'series_5',
      title: 'The Mandalorian',
      type: ContentType.series,
      description:
          'The travels of a lone bounty hunter in the outer reaches of the galaxy, far from the authority of the New Republic.',
      imagePath: 'assets/images/the_batman.jpg',
      backdropPath: 'assets/images/the_batman.jpg',
      year: 2019,
      durationMinutes: 40,
      rating: 8.6,
      genres: [Genre.action, Genre.adventure, Genre.sciFi],
      director: 'Jon Favreau',
      cast: ['Pedro Pascal', 'Giancarlo Esposito', 'Katee Sackhoff'],
      seasons: 3,
      episodes: 24,
      isTrending: true,
      isNewRelease: false,
      releaseDate: DateTime(2019, 11, 12),
    ),
    ContentModel(
      id: 'series_6',
      title: 'Wednesday',
      type: ContentType.series,
      description:
          'Follows Wednesday Addams\' years as a student, when she attempts to master her emerging psychic ability, thwart a killing spree, and solve the mystery that embroiled her parents.',
      imagePath: 'assets/images/joker.jpg',
      backdropPath: 'assets/images/joker.jpg',
      year: 2022,
      durationMinutes: 50,
      rating: 8.1,
      genres: [Genre.comedy, Genre.crime, Genre.fantasy, Genre.mystery],
      director: 'Alfred Gough',
      cast: [
        'Jenna Ortega',
        'Gwendoline Christie',
        'Emma Myers',
        'Catherine Zeta-Jones',
      ],
      seasons: 1,
      episodes: 8,
      isTrending: true,
      isNewRelease: false,
      releaseDate: DateTime(2022, 11, 23),
    ),
    ContentModel(
      id: 'series_7',
      title: 'The Witcher',
      type: ContentType.series,
      description:
          'Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world where people often prove more wicked than beasts.',
      imagePath: 'assets/images/the_batman.jpg',
      backdropPath: 'assets/images/the_batman.jpg',
      year: 2019,
      durationMinutes: 60,
      rating: 8.0,
      genres: [Genre.action, Genre.adventure, Genre.drama, Genre.fantasy],
      director: 'Lauren Schmidt Hissrich',
      cast: ['Henry Cavill', 'Anya Chalotra', 'Freya Allan'],
      seasons: 3,
      episodes: 24,
      isTrending: false,
      isNewRelease: false,
      releaseDate: DateTime(2019, 12, 20),
    ),
    ContentModel(
      id: 'series_8',
      title: 'House of the Dragon',
      type: ContentType.series,
      description:
          'An internal succession war within House Targaryen at the height of its power, 172 years before the birth of Daenerys Targaryen.',
      imagePath: 'assets/images/joker.jpg',
      backdropPath: 'assets/images/joker.jpg',
      year: 2022,
      durationMinutes: 63,
      rating: 8.4,
      genres: [Genre.action, Genre.adventure, Genre.drama, Genre.fantasy],
      director: 'Ryan Condal',
      cast: ['Matt Smith', 'Emma D\'Arcy', 'Olivia Cooke', 'Rhys Ifans'],
      seasons: 1,
      episodes: 10,
      isTrending: true,
      isNewRelease: false,
      releaseDate: DateTime(2022, 8, 21),
    ),
  ];

  /// Get all movies
  static List<ContentModel> get movies =>
      allContent.where((content) => content.isMovie).toList();

  /// Get all series
  static List<ContentModel> get series =>
      allContent.where((content) => content.isSeries).toList();

  /// Get trending content
  static List<ContentModel> get trending =>
      allContent.where((content) => content.isTrending).toList();

  /// Get new releases
  static List<ContentModel> get newReleases =>
      allContent.where((content) => content.isNewRelease).toList();

  /// Get content by genre
  static List<ContentModel> getByGenre(Genre genre) {
    return allContent
        .where((content) => content.genres.contains(genre))
        .toList();
  }

  /// Get content by year
  static List<ContentModel> getByYear(int year) {
    return allContent.where((content) => content.year == year).toList();
  }

  /// Get content by rating (minimum rating)
  static List<ContentModel> getByMinRating(double minRating) {
    return allContent.where((content) => content.rating >= minRating).toList();
  }

  /// Search content by title
  static List<ContentModel> search(String query) {
    final lowerQuery = query.toLowerCase();
    return allContent
        .where((content) => content.title.toLowerCase().contains(lowerQuery))
        .toList();
  }

  /// Get content by ID
  static ContentModel? getById(String id) {
    try {
      return allContent.firstWhere((content) => content.id == id);
    } catch (e) {
      return null;
    }
  }
}
