import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(bottom: BorderSide(color: AppColors.surface)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Trái: logo
          Align(alignment: Alignment.centerLeft, child: _Logo()),

          // Giữa: nút trang chủ
          // Giữa: nút trang chủ + thanh tìm kiếm
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 560),
              child: Row(
                children: [
                  _HomeButton(),
                  SizedBox(width: 8),
                  Expanded(child: _SearchBar()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.graphic_eq, color: Colors.black, size: 24),
    );
  }
}

class _HomeButton extends StatelessWidget {
  const _HomeButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        hoverColor: AppColors.surfaceHover,
        onTap: () {},
        child: const SizedBox(
          width: 48,
          height: 48,
          child: Icon(Icons.home_outlined, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: 'Bạn muốn phát nội dung gì?',
          hintStyle: const TextStyle(color: AppColors.textSecondary),
          prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
          filled: true,
          fillColor: AppColors.surface,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: const BorderSide(color: Colors.white, width: 2),
          ),
        ),
      ),
    );
  }
}
