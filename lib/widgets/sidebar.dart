import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.sidebar,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          _NavItem(icon: Icons.home_filled, label: 'Trang chủ', selected: true),
          SizedBox(height: 4),
          _NavItem(icon: Icons.person_outline, label: 'Của Tôi'),
          SizedBox(height: 28),
          _SectionTitle('THƯ VIỆN'),
          SizedBox(height: 8),
          _LibraryItem(
            icon: Icons.favorite,
            color: Color(0xFFFF4D8D),
            label: 'Bài hát yêu thích',
          ),
          _LibraryItem(
            icon: Icons.history,
            color: Color(0xFF3B82F6),
            label: 'Nghe gần đây',
          ),
          _LibraryItem(
            icon: Icons.mic,
            color: Color(0xFF8B5CF6),
            label: 'Nghệ sĩ yêu thích',
          ),
          SizedBox(height: 28),
          _SectionTitle('PLAYLIST ĐÃ TẠO', showAdd: true),
          SizedBox(height: 8),
          _LibraryItem(
            color: Color(0xFF0EA5A4),
            label: 'Nhạc chill',
            imagePath: 'imgs/NhacChill.jpg',
          ),
          _LibraryItem(
            color: Color(0xFF6D28D9),
            label: 'Nhạc remix',
            imagePath: 'imgs/NhacRemix.jpg',
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;

  const _NavItem({
    required this.icon,
    required this.label,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? AppColors.surfaceHover : Colors.transparent,
      borderRadius: BorderRadius.circular(500),
      child: InkWell(
        borderRadius: BorderRadius.circular(500),
        hoverColor: AppColors.surface,
        onTap: () {},
        child: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 22),
              const SizedBox(width: 14),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: selected ? FontWeight.bold : FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  final bool showAdd;

  const _SectionTitle(this.text, {this.showAdd = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
          if (showAdd)
            InkWell(
              borderRadius: BorderRadius.circular(500),
              onTap: () {},
              child: const Icon(
                Icons.add_circle_outline,
                color: AppColors.textSecondary,
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}

class _LibraryItem extends StatelessWidget {
  final IconData? icon;
  final Color color;
  final String label;
  final String? imagePath;

  const _LibraryItem({
    this.icon,
    required this.color,
    required this.label,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        hoverColor: AppColors.surface,
        onTap: () {},
        child: Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: imagePath != null
                    ? Image.asset(imagePath!, fit: BoxFit.cover)
                    : Icon(icon, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
