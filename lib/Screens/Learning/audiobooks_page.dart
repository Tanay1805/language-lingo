import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AudiobooksPage extends StatelessWidget {
  const AudiobooksPage({super.key});

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      debugPrint('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Sample audiobooks data
    final List<Map<String, dynamic>> audiobooks = [
      {
        "title": "Hindi Audiobooks & Podcasts",
        "author": "Spotify Playlist",
        "duration": "Playlist",
        "url": "https://open.spotify.com/episode/3CheamB8vapteHvr0KFTMP",
        "language": "Hindi",
        "nativeInitial": "अ", // Native Hindi character
        "color": const Color(0xFFFF9800),
      },
      {
        "title": "French Audiobooks",
        "author": "Spotify Playlist",
        "duration": "Playlist",
        "url": "https://open.spotify.com/playlist/09DKBi7Q9ufwfVVdW0gobP",
        "language": "French",
        "nativeInitial": "œ", // French character
        "color": const Color(0xFFE91E63),
      },
      {
        "title": "Japanese Audiobooks",
        "author": "Spotify Playlist",
        "duration": "Playlist",
        "url": "https://open.spotify.com/playlist/7opVb1xHyWFIzSWSdi7TAa",
        "language": "Japanese",
        "nativeInitial": "あ", // Hiragana 'A'
        "color": const Color(0xFFF44336),
      },
      {
        "title": "Spanish Audiobooks",
        "author": "Spotify Playlist",
        "duration": "Playlist",
        "url": "https://open.spotify.com/playlist/6XNDFrwONN8ccxWu4ilyQd",
        "language": "Spanish",
        "nativeInitial": "ñ", // Spanish character
        "color": const Color(0xFF4CAF50),
      },
      {
        "title": "Italian Audiobooks",
        "author": "Spotify Playlist",
        "duration": "Playlist",
        "url": "https://open.spotify.com/playlist/4vh7KXuqHzUICg8uAr76ER",
        "language": "Italian",
        "nativeInitial": "è", // Italian character
        "color": const Color(0xFF9C27B0),
      },
      {
        "title": "German Audiobooks",
        "author": "Spotify Playlist",
        "duration": "Playlist",
        "url": "https://open.spotify.com/playlist/4r7ynEeLRGK7Dyd5P8jxSO",
        "language": "German",
        "nativeInitial": "ß", // German character
        "color": const Color(0xFF009688),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB), // App light background
      appBar: AppBar(
        title: Text(
          "Audiobooks",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        itemCount: audiobooks.length,
        itemBuilder: (context, index) {
          final book = audiobooks[index];
          return Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => _launchUrl(book['url']!),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      // Language Letter Container
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: (book['color'] as Color).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: (book['color'] as Color).withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              book['nativeInitial'] as String,
                              style: GoogleFonts.poppins(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: book['color'] as Color,
                                height: 1.1,
                              ),
                            ),
                            Text(
                              book['language'] as String,
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: book['color'] as Color,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book['title']!,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            book['author']!,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.access_time_rounded,
                                      size: 14,
                                      color: Colors.grey.shade600,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      book['duration']!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Play Button
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2D81FF).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Color(0xFF2D81FF),
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
