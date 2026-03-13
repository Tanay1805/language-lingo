import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContinueLearningPage extends StatefulWidget {
  const ContinueLearningPage({super.key});

  @override
  State<ContinueLearningPage> createState() => _ContinueLearningPageState();
}

class _ContinueLearningPageState extends State<ContinueLearningPage> {
  final List<String> _languages = [
    "Spanish",
    "French",
    "German",
    "Japanese",
    "Italian",
  ];

  int _selectedIndex = 0;

  final Map<String, Map<String, List<Map<String, String>>>> _languageData = {
    "Spanish": {
      "Often Spoken Expressions": [
        {"native": "¡Hola! ¿Qué tal?", "translation": "Hello! How's it going?"},
        {"native": "Mucho gusto", "translation": "Nice to meet you"},
        {"native": "Por favor / Gracias", "translation": "Please / Thank you"},
        {"native": "¿Dónde está el baño?", "translation": "Where is the bathroom?"},
      ],
      "Grammar Quick Bites": [
        {
          "native": "Nouns have gender (Masculine/Feminine).",
          "translation": "Use 'El' for masculine (El libro) and 'La' for feminine (La mesa)."
        },
        {
          "native": "Adjectives often come AFTER the noun.",
          "translation": "Example: 'El gato negro' (The black cat)."
        },
      ],
      "Cultural Context": [
        {
          "native": "Informal vs Formal 'You'",
          "translation": "Use 'tú' with friends and family, and 'usted' for respect/strangers."
        },
      ]
    },
    "French": {
      "Often Spoken Expressions": [
        {"native": "Bonjour", "translation": "Good morning / Hello"},
        {"native": "S'il vous plaît", "translation": "Please (formal)"},
        {"native": "Merci beaucoup", "translation": "Thank you very much"},
        {"native": "Je ne comprends pas", "translation": "I don't understand"},
      ],
      "Grammar Quick Bites": [
        {
          "native": "Gendered Nouns (Le/La).",
          "translation": "'Le' is masculine, 'La' is feminine, 'Les' is plural."
        },
        {
          "native": "Silent Letters.",
          "translation": "Many ending consonants like 's', 't', 'd', 'p', 'x' are usually silent."
        },
      ],
      "Cultural Context": [
        {
          "native": "Greeting Custom (La Bise)",
          "translation": "It's common to greet friends and family with a kiss on both cheeks."
        },
      ]
    },
    "German": {
      "Often Spoken Expressions": [
        {"native": "Guten Tag!", "translation": "Good day / Hello"},
        {"native": "Wie geht es Ihnen?", "translation": "How are you? (formal)"},
        {"native": "Bitte / Danke", "translation": "Please / Thank you"},
        {"native": "Entschuldigung", "translation": "Excuse me / Sorry"},
      ],
      "Grammar Quick Bites": [
        {
          "native": "Three Noun Genders.",
          "translation": "Masculine (der), Feminine (die), and Neuter (das)."
        },
        {
          "native": "Capitalizing Nouns.",
          "translation": "In German, ALL nouns are capitalized, not just proper nouns."
        },
      ],
      "Cultural Context": [
        {
          "native": "Punctuality is key.",
          "translation": "Being casually late is considered impolite in German culture."
        },
      ]
    },
    "Japanese": {
      "Often Spoken Expressions": [
        {"native": "こんにちは (Konnichiwa)", "translation": "Hello / Good afternoon"},
        {"native": "ありがとうございます (Arigatou gozaimasu)", "translation": "Thank you (formal)"},
        {"native": "すみません (Sumimasen)", "translation": "Excuse me / I'm sorry"},
        {"native": "よろしくお願いします (Yoroshiku onegaishimasu)", "translation": "Please take care of me (used when meeting)"},
      ],
      "Grammar Quick Bites": [
        {
          "native": "Sentence Structure (SOV).",
          "translation": "Subject - Object - Verb. Example: 'I apple eat' instead of 'I eat apple'."
        },
        {
          "native": "Honorifics.",
          "translation": "Adding '-san' to the end of a name is a standard form of respect."
        },
      ],
      "Cultural Context": [
        {
          "native": "Bowing (Ojigi).",
          "translation": "Bowing is a fundamental part of Japanese etiquette for greetings and apologies."
        },
      ]
    },
    "Italian": {
      "Often Spoken Expressions": [
        {"native": "Ciao!", "translation": "Hello / Goodbye (informal)"},
        {"native": "Come stai?", "translation": "How are you?"},
        {"native": "Per favore / Grazie", "translation": "Please / Thank you"},
        {"native": "Prego", "translation": "You're welcome / Please go ahead"},
      ],
      "Grammar Quick Bites": [
        {
          "native": "Dropping Subject Pronouns.",
          "translation": "You don't always need to say 'I' or 'You' because the verb ending tells you who is acting."
        },
        {
          "native": "Gender (Il/La, Lo/L').",
          "translation": "Nouns are masculine or feminine, and plural endings usually change (e.g., -o to -i, -a to -e)."
        },
      ],
      "Cultural Context": [
        {
          "native": "Hand Gestures.",
          "translation": "Italians often talk with their hands; gestures are a rich part of the communication."
        },
      ]
    },
  };

  @override
  Widget build(BuildContext context) {
    final selectedLanguage = _languages[_selectedIndex];
    final currentData = _languageData[selectedLanguage]!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Language Explorer",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Language Tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: List.generate(_languages.length, (index) {
                final isSelected = _selectedIndex == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.black : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: isSelected ? Colors.black : Colors.grey.shade300,
                      ),
                    ),
                    child: Text(
                      _languages[index],
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.grey.shade700,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Discover $selectedLanguage",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Select a topic below to explore common phrases, grammar bites, and cultural tips.",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Dynamically render the content sections for the selected language
                  ...currentData.keys.map((title) {
                    return _buildSection(title: title, items: currentData[title]!);
                  }).toList(),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required List<Map<String, String>> items}) {
    IconData sectionIcon;
    Color sectionColor;

    if (title.contains("Expressions")) {
      sectionIcon = Icons.chat_bubble_outline;
      sectionColor = const Color(0xFF2D81FF); // Blue
    } else if (title.contains("Grammar")) {
      sectionIcon = Icons.menu_book;
      sectionColor = const Color(0xFF26D390); // Green
    } else {
      sectionIcon = Icons.public;
      sectionColor = const Color(0xFFFF9800); // Orange
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: sectionColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(sectionIcon, color: sectionColor, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...items.map((item) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.arrow_right_alt, color: Colors.grey, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["native"]!,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item["translation"]!,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        const SizedBox(height: 24),
      ],
    );
  }
}
