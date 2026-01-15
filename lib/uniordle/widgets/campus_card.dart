import 'package:flutter/material.dart';
import 'package:uniordle/uniordle/data/university_data.dart';

class CampusCard extends StatelessWidget {
  final University university;
  final VoidCallback onTap;

  static const Color matteColor = Color(0xFF1A1F2B);

  const CampusCard({
    super.key,
    required this.university,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: matteColor,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.1)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias, // keeps image inside rounded corners
        child: Column(
          children: [
            _buildImageHeader(),
            _buildCardFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageHeader() {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            university.path,
            fit: BoxFit.cover,
          ),

          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    matteColor.withValues(alpha: 0.4),
                    matteColor.withValues(alpha: 0.9),
                    matteColor,
                  ],
                  stops: const [0.5, 0.8, 0.95, 1.0], // fade starts halfway down
                ),
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget _buildCardFooter() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              university.shortName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  Icons.circle, 
                  size: 8, 
                  color: Colors.blue
                ),
                const SizedBox(width: 6),
                Text(
                  'NEW CODE',
                  style: TextStyle(
                    color: Colors.blue.withValues(alpha: 0.8),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}