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
      child: const Stack(
        alignment: Alignment.center,
        children: [
          // Trái: logo
          Align(alignment: Alignment.centerLeft, child: _Logo()),

          // Giữa: nút trang chủ
          Center(child: _HomeButton()),
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
