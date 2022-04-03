class Music {
  final String coverImage;
  final String title;
  final String artist;

  Music({
    required this.coverImage,
    required this.title,
    required this.artist,
  });
}

List<Music> allMusic = [
  Music(
    coverImage: "lib/assets/images/01.jpg",
    title: "1 Day 2 Nights",
    artist: "HRVY",
  ),
  Music(
    coverImage: "lib/assets/images/02.png",
    title: "Bad Habits",
    artist: "Ed Sheeran",
  ),
  Music(
    coverImage: "lib/assets/images/03.png",
    title: "Bad",
    artist: "Michael Jackson",
  ),
  Music(
    coverImage: "lib/assets/images/04.png",
    title: "Justice",
    artist: "Justin Bieber",
  ),
  Music(
    coverImage: "lib/assets/images/05.jpg",
    title: "Blue",
    artist: "Jonas Blue",
  ),
  Music(
    coverImage: "lib/assets/images/06.png",
    title: "Alone",
    artist: "Alan Walker",
  ),
];
