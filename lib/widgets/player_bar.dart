import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class PlayerBar extends StatelessWidget {
  const PlayerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: AppColors.background,
      child: const Row(
        children: [
          Expanded(
            child: Align(alignment: Alignment.centerLeft, child: _SongInfo()),
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}

class _SongInfo extends StatelessWidget {
  const _SongInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            'imgs/NoiNayCoAnh.jpg',
            width: 56,
            height: 56,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        const Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nơi Này Có Anh',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Sơn Tùng M-TP',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        const _LikeButton(),
        IconButton(
          onPressed: () {},
          tooltip: 'Thêm vào playlist',
          icon: const Icon(Icons.add_circle_outline),
          color: Colors.white,
          iconSize: 22,
        ),
      ],
    );
  }
}

class _LikeButton extends StatefulWidget {
  const _LikeButton();

  @override
  State<_LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<_LikeButton> {
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => setState(() => _liked = !_liked),
      icon: Icon(_liked ? Icons.favorite : Icons.favorite_border),
      color: _liked ? const Color(0xFFFF4D8D) : Colors.white,
      iconSize: 22,
    );
  }
}
