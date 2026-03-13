import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Learning/audiobooks_page.dart';

class QuickLearningModulesWidget extends StatelessWidget {
  const QuickLearningModulesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hear and Learn",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          // Audiobooks
          _buildModuleRow(
            icon: CupertinoIcons.headphones,
            iconColor: const Color(0xFF2D81FF), // Zoom blue vibe from ref
            title: "Audiobooks",
            subtitle: "Listening Skills",
            stat: "5 hours",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AudiobooksPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          // Relaxing Animation
          const Expanded(
            child: Center(
              child: _AnimatedHeadphonesWidget(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildModuleRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String stat,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Row(
          children: [
            // Icon Container
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9FB),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
        const SizedBox(width: 16),
        // Texts
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
        // Stat text
        Text(
          stat,
          style: GoogleFonts.poppins(
             fontSize: 14,
             fontWeight: FontWeight.w500,
             color: Colors.black87,
          ),
        ),
      ],
        ),
      ),
    );
  }
}

class _AnimatedHeadphonesWidget extends StatefulWidget {
  const _AnimatedHeadphonesWidget();

  @override
  State<_AnimatedHeadphonesWidget> createState() => _AnimatedHeadphonesWidgetState();
}

class _AnimatedHeadphonesWidgetState extends State<_AnimatedHeadphonesWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    
    _fadeAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFF4F2FC),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF6B4FE8).withOpacity(0.15 * _fadeAnimation.value),
                          blurRadius: 15 * _scaleAnimation.value,
                          spreadRadius: 5 * _scaleAnimation.value,
                        )
                      ]
                    ),
                    child: const Icon(CupertinoIcons.headphones, size: 32, color: Color(0xFF6B4FE8)),
                  ),
                  Positioned(
                    top: -10,
                    right: -10,
                    child: Opacity(
                      opacity: _fadeAnimation.value,
                      child: const Icon(CupertinoIcons.music_note_2, size: 20, color: Color(0xFF6B4FE8)),
                    ),
                  ),
                  Positioned(
                    bottom: -5,
                    left: -15,
                    child: Opacity(
                      opacity: (1.3 - _fadeAnimation.value).clamp(0.0, 1.0),
                      child: const Icon(CupertinoIcons.music_note_2, size: 16, color: Color(0xFF6B4FE8)),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 4),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AudiobooksPage(),
              ),
            );
          },
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Text(
              "Ready to hear and learn",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );
  }
}

