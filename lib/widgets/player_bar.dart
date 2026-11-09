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
          const Expanded(
            child: Align(alignment: Alignment.centerLeft, child: _SongInfo()),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _ControlButtons(),
                    SizedBox(height: 4),
                    _ProgressBar(),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: _RightTools(),
            ),
          ),
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

const _timeStyle = TextStyle(color: AppColors.textSecondary, fontSize: 12);

class _ProgressBar extends StatefulWidget {
  const _ProgressBar();

  @override
  State<_ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<_ProgressBar> {
  static const double _total = 290;
  double _value = 0;

  String _format(double seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds.toInt() % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(_format(_value), style: _timeStyle),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 4,
              activeTrackColor: Colors.white,
              inactiveTrackColor: AppColors.surfaceHover,
              thumbColor: Colors.white,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
            ),
            child: Slider(
              value: _value,
              max: _total,
              onChanged: (v) => setState(() => _value = v),
            ),
          ),
        ),
        Text(_format(_total), style: _timeStyle),
      ],
    );
  }
}

class _RightTools extends StatelessWidget {
  const _RightTools();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _LyricsButton(),
        _QueueButton(),
        SizedBox(width: 4),
        _VolumeControl(),
      ],
    );
  }
}

// Khung chữ hiện lên phía trên icon khi rê chuột vào
class _HoverTip extends StatelessWidget {
  final String message;
  final Widget child;

  const _HoverTip({required this.message, required this.child});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      preferBelow: false,
      waitDuration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceHover,
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 13,
        height: 1.5,
      ),
      child: child,
    );
  }
}

class _LyricsButton extends StatelessWidget {
  const _LyricsButton();

  @override
  Widget build(BuildContext context) {
    return _HoverTip(
      message: 'Lời bài hát',
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.lyrics_outlined),
        iconSize: 22,
        color: AppColors.textSecondary,
      ),
    );
  }
}

class _QueueButton extends StatefulWidget {
  const _QueueButton();

  @override
  State<_QueueButton> createState() => _QueueButtonState();
}

class _QueueButtonState extends State<_QueueButton> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return _HoverTip(
      message: 'Danh sách phát',
      child: IconButton(
        onPressed: () {
          setState(() => _open = !_open);
          // TODO: hiện/ẩn danh sách các bài hát tiếp theo (làm sau)
        },
        icon: const Icon(Icons.queue_music),
        iconSize: 22,
        color: _open ? Colors.white : AppColors.textSecondary,
      ),
    );
  }
}

class _VolumeControl extends StatefulWidget {
  const _VolumeControl();

  @override
  State<_VolumeControl> createState() => _VolumeControlState();
}

class _VolumeControlState extends State<_VolumeControl> {
  double _volume = 0.7;

  IconData get _icon {
    if (_volume == 0) return Icons.volume_off;
    if (_volume < 0.5) return Icons.volume_down;
    return Icons.volume_up;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _HoverTip(
          message: 'Âm lượng',
          child: IconButton(
            onPressed: () => setState(() => _volume = _volume == 0 ? 0.7 : 0),
            icon: Icon(_icon),
            iconSize: 22,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(
          width: 100,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 4,
              activeTrackColor: Colors.white,
              inactiveTrackColor: AppColors.surfaceHover,
              thumbColor: Colors.white,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
            ),
            child: Slider(
              value: _volume,
              onChanged: (v) => setState(() => _volume = v),
            ),
          ),
        ),
      ],
    );
  }
}
