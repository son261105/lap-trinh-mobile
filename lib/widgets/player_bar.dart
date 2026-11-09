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
      child: Row(
        children: [
          Expanded(
            child: Align(alignment: Alignment.centerLeft, child: _SongInfo()),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 560),
                child: _ControlButtons(),
              ),
            ),
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

class _ControlButtons extends StatelessWidget {
  const _ControlButtons();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ControlIcon(Icons.shuffle),
        SizedBox(width: 12),
        _ControlIcon(Icons.skip_previous, size: 28, color: Colors.white70),
        SizedBox(width: 12),
        _PlayButton(),
        SizedBox(width: 12),
        _ControlIcon(Icons.skip_next, size: 28, color: Colors.white70),
        SizedBox(width: 12),
        _ControlIcon(Icons.repeat),
      ],
    );
  }
}

class _ControlIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;

  const _ControlIcon(
    this.icon, {
    this.size = 22,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon),
      iconSize: size,
      color: color,
    );
  }
}

class _PlayButton extends StatefulWidget {
  const _PlayButton();

  @override
  State<_PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<_PlayButton> {
  bool _playing = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () => setState(() => _playing = !_playing),
        child: SizedBox(
          width: 44,
          height: 44,
          child: Icon(
            _playing ? Icons.pause : Icons.play_arrow,
            color: Colors.black,
            size: 28,
          ),
        ),
      ),
    );
  }
}
