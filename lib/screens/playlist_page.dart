import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class _PlaylistSong {
  final String title;
  final String artist;
  final String image;
  final String duration;

  const _PlaylistSong(this.title, this.artist, this.image, this.duration);
}

const _songs = [
  _PlaylistSong('Đi Về Nhà', 'Đen Vâu', 'imgs/DiVeNha.jpg', '04:23'),
  _PlaylistSong(
    'Nơi Này Có Anh',
    'Sơn Tùng M-TP',
    'imgs/NoiNayCoAnh.jpg',
    '04:57',
  ),
  _PlaylistSong(
    'Vợ Người Ta',
    'Phan Mạnh Quỳnh',
    'imgs/VoNguoiTa.jpg',
    '05:45',
  ),
];

const _cyan = Color(0xFF00D4E8);

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1B3A3A), AppColors.sidebar],
          stops: [0, 0.45],
        ),
      ),
      child: const SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_PlaylistHeader(), SizedBox(height: 32), _SongTable()],
        ),
      ),
    );
  }
}

class _PlaylistHeader extends StatelessWidget {
  const _PlaylistHeader();

  @override
  Widget build(BuildContext context) {
    final artists = _songs.map((s) => s.artist).toSet().join(', ');

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'imgs/NhacChill.jpg',
            width: 240,
            height: 240,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Playlist',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Nhạc chill',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                artists,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                '${_songs.length} bài hát',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  _PlayAllButton(),
                  SizedBox(width: 12),
                  _ShuffleButton(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PlayAllButton extends StatelessWidget {
  const _PlayAllButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _cyan,
      shape: const StadiumBorder(),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.play_arrow, color: Colors.black, size: 22),
              SizedBox(width: 8),
              Text(
                'Phát tất cả',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShuffleButton extends StatelessWidget {
  const _ShuffleButton();

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Trộn bài',
      child: Material(
        color: const Color(0xFF2F2F2F),
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () {},
          child: const SizedBox(
            width: 48,
            height: 48,
            child: Icon(Icons.shuffle, color: Colors.white, size: 22),
          ),
        ),
      ),
    );
  }
}

const _numWidth = 40.0;
const _timeWidth = 80.0;

class _SongTable extends StatelessWidget {
  const _SongTable();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _TableHeader(),
        const SizedBox(height: 8),
        for (var i = 0; i < _songs.length; i++) _SongRow(i + 1, _songs[i]),
      ],
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      color: AppColors.textSecondary,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    );

    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: _numWidth,
            child: Text('#', style: style),
          ),
          Expanded(flex: 5, child: Text('Tên bài hát', style: style)),
          Expanded(flex: 3, child: Text('Nghệ sĩ', style: style)),
          SizedBox(
            width: _timeWidth,
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.access_time,
                color: AppColors.textSecondary,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SongRow extends StatelessWidget {
  final int index;
  final _PlaylistSong song;

  const _SongRow(this.index, this.song);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        hoverColor: AppColors.surface,
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              SizedBox(
                width: _numWidth,
                child: Text(
                  '$index',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        song.image,
                        width: 38,
                        height: 38,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        song.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  song.artist,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                width: _timeWidth,
                child: Text(
                  song.duration,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
