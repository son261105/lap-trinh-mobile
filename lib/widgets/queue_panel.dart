import 'package:flutter/material.dart';
import '../state/ui_state.dart';
import '../theme/app_colors.dart';

class _QueueSong {
  final String title;
  final String artist;
  final String image;

  const _QueueSong(this.title, this.artist, this.image);
}

// Bài đang phát (cùng bài với thanh phát nhạc ở dưới)
const _nowPlaying = _QueueSong(
  'Nơi Này Có Anh',
  'Sơn Tùng M-TP',
  'imgs/NoiNayCoAnh.jpg',
);

// Dữ liệu mẫu, mày tự sửa tên bài, nghệ sĩ, ảnh
const _songs = [
  _QueueSong(
    'Em Của Ngày Hôm Qua',
    'Sơn Tùng M-TP',
    'imgs/EmCuaNgayHomQua.jpg',
  ),
  _QueueSong('Nắng Ấm Xa Dần', 'Sơn Tùng M-TP', 'imgs/NangAmXaDan.jpg'),
  _QueueSong('Cơn Mưa Ngang Qua', 'Sơn Tùng M-TP', 'imgs/ConMuaNgangQua.jpg'),
  _QueueSong('Âm Thầm Bên Em', 'Sơn Tùng M-TP', 'imgs/AmThamBenEm.jpg'),
  _QueueSong(
    'Buông Đôi Tay Nhau Ra',
    'Sơn Tùng M-TP',
    'imgs/BuongDoiTayNhauRa.jpg',
  ),
];

const _pink = Color(0xFFFF4D8D);

class QueuePanel extends StatelessWidget {
  const QueuePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: AppColors.sidebar,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Danh sách phát',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => queueOpen.value = false,
                  icon: const Icon(Icons.close),
                  iconSize: 20,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
          const _SectionLabel('Đang phát'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: _QueueItem(_nowPlaying, playing: true),
          ),
          const _SectionLabel('Tiếp theo'),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: _songs.length,
              itemBuilder: (context, i) => _QueueItem(_songs[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;

  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _QueueItem extends StatelessWidget {
  final _QueueSong song;
  final bool playing;

  const _QueueItem(this.song, {this.playing = false});

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
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  song.image,
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: playing ? _pink : Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      song.artist,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              if (playing) ...[
                const SizedBox(width: 8),
                const Icon(Icons.graphic_eq, color: _pink, size: 20),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
