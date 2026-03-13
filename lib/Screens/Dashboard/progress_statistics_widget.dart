import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressStatisticsWidget extends StatefulWidget {
  const ProgressStatisticsWidget({super.key});

  @override
  State<ProgressStatisticsWidget> createState() => _ProgressStatisticsWidgetState();
}

class _ProgressStatisticsWidgetState extends State<ProgressStatisticsWidget> {
  int _currentProgress = 64;
  int _completedCourses = 12;
  bool _showLeaderboardRank = false;

  @override
  void initState() {
    super.initState();
    _loadProgressData();
  }

  Future<void> _loadProgressData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentProgress = prefs.getInt('current_progress') ?? 64;
      _completedCourses = prefs.getInt('completed_courses') ?? 12;
      _showLeaderboardRank = prefs.getBool('show_leaderboard_rank') ?? false;
    });
  }

  Future<void> _saveProgressData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('current_progress', _currentProgress);
    await prefs.setInt('completed_courses', _completedCourses);
    await prefs.setBool('show_leaderboard_rank', _showLeaderboardRank);
  }

  void _completeDemoLesson() {
    setState(() {
      if (_currentProgress < 100) {
        _currentProgress += 2;
      }
      _completedCourses += 1;
      _showLeaderboardRank = true;
    });
    _saveProgressData();
  }

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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Progress statistics",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              FilledButton.icon(
                onPressed: _showLeaderboardRank ? null : _completeDemoLesson,
                icon: const Icon(CupertinoIcons.checkmark_alt_circle, size: 14),
                label: Text("Finish Next Lesson", style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w600)),
                style: FilledButton.styleFrom(
                  backgroundColor: _showLeaderboardRank ? Colors.grey.shade400 : const Color(0xFF26D390),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  minimumSize: const Size(0, 28),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_showLeaderboardRank) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber.shade200),
              ),
              child: Row(
                children: [
                  const Icon(CupertinoIcons.star_circle_fill, color: Colors.amber, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Awesome! You are now in the top 5% of learners on the app! Keep up your streak!",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.amber.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "$_currentProgress%",
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "activity",
                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          // Progress Bars
          Row(
             children: [
               Expanded(
                 flex: 24,
                 child: _buildSegmentedBar(const Color(0xFF6B4FE8), "24%"), // Purple
               ),
               const SizedBox(width: 4),
               Expanded(
                 flex: _currentProgress > 64 ? 37 : 35,
                 child: _buildSegmentedBar(const Color(0xFF26D390), "${_currentProgress > 64 ? 37 : 35}%"), // Green
               ),
               const SizedBox(width: 4),
               Expanded(
                 flex: _currentProgress > 64 ? 39 : 41,
                 child: _buildSegmentedBar(const Color(0xFFFF9421), "${_currentProgress > 64 ? 39 : 41}%"), // Orange
               ),
              ],
           ),
           const SizedBox(height: 24),
           // Stats row
           Container(
             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
             decoration: BoxDecoration(
               color: const Color(0xFFF9F9FB),
               borderRadius: BorderRadius.circular(16),
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 _buildStatItem(CupertinoIcons.book, const Color(0xFF6B4FE8), "8", "In progress"),
                 Container(width: 1, height: 30, color: Colors.grey.shade200),
                 _buildStatItem(CupertinoIcons.check_mark_circled, const Color(0xFF26D390), "$_completedCourses", "Completed"),
                 Container(width: 1, height: 30, color: Colors.grey.shade200),
                 _buildStatItem(CupertinoIcons.clock, const Color(0xFFFF9421), "14", "Upcoming"),
               ],
             ),
           ),
          ],
        ),
      ),
    );
  }

  Widget _buildSegmentedBar(Color color, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 10, color: Colors.black87, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildStatItem(IconData icon, Color color, String count, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 16),
        ),
        const SizedBox(height: 8),
        Text(
          count,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 10,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
