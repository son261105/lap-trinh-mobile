import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/cover_art.dart';

const _cyan = Color(0xFF00D4E8);

const _bannerImage = 'imgs/banner.jpg';

class _PopularSong {
  final String title;
  final String artist;
  final String plays;
  final String duration;
  final Color color;
  final String? image;

  const _PopularSong(
    this.title,
    this.artist,
    this.plays,
    this.duration,
    this.color, {
    this.image,
  });
}

const _popular = [
  _PopularSong(
    'Nơi Này Có Anh',
    'Sơn Tùng M-TP',
    '47.379.809',
    '3:36',
    Color(0xFFEC4899),
    image: 'imgs/NoiNayCoAnh.jpg',
  ),
  _PopularSong(
    'Nang Ấm Xa Dần',
    'Sơn Tùng M-TP',
    '33.600.284',
    '4:13',
    Color(0xFF3B82F6),
    image: 'imgs/NangAmXaDan.jpg',
  ),
  _PopularSong(
    'Em Của Ngày Hôm Qua',
    'Sơn Tùng M-TP',
    '29.481.052',
    '4:23',
    Color(0xFFF59E0B),
    image: 'imgs/EmCuaNgayHomQua.jpg',
  ),
  _PopularSong(
    'Cơn Mưa Ngang Qua',
    'Sơn Tùng M-TP',
    '21.904.377',
    '4:05',
    Color(0xFF14B8A6),
    image: 'imgs/ConMuaNgangQua.jpg',
  ),
];

class ArtistPage extends StatelessWidget {
  const ArtistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_ArtistHero(), _ArtistBody()],
      ),
    );
  }
}

// ===== Phần ảnh nền lớn + tên nghệ sĩ =====

class _ArtistHero extends StatelessWidget {
  const _ArtistHero();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF2A4A4A), Color(0xFF0F1F1F)],
              ),
            ),
          ),
          Image.asset(
            _bannerImage,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            errorBuilder: (context, error, stack) => const SizedBox.shrink(),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color(0xCC000000)],
              ),
            ),
          ),
          const Positioned(
            left: 32,
            right: 32,
            bottom: 28,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sơn Tùng M-TP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 88,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  '5,4 Tr người nghe hằng tháng',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ===== Phần bên dưới: nút bấm + danh sách Phổ biến =====

class _ArtistBody extends StatelessWidget {
  const _ArtistBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 32),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF3A2F33), AppColors.sidebar],
          stops: [0, 0.6],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ArtistActions(),
          SizedBox(height: 32),
          Text(
            'Phổ biến',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          _PopularTable(),
        ],
      ),
    );
  }
}

class _ArtistActions extends StatelessWidget {
  const _ArtistActions();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: _cyan,
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () {},
            child: const SizedBox(
              width: 56,
              height: 56,
              child: Icon(Icons.play_arrow, color: Colors.black, size: 32),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Tooltip(
          message: 'Trộn bài',
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shuffle),
            iconSize: 30,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(width: 12),
        const _FollowButton(),
      ],
    );
  }
}

class _FollowButton extends StatefulWidget {
  const _FollowButton();

  @override
  State<_FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<_FollowButton> {
  bool _following = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _following ? Colors.white : Colors.transparent,
      shape: StadiumBorder(
        side: BorderSide(color: _following ? Colors.white : Colors.white54),
      ),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: () => setState(() => _following = !_following),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
          child: Text(
            _following ? 'Đang theo dõi' : 'Theo dõi',
            style: TextStyle(
              color: _following ? Colors.black : Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _PopularTable extends StatelessWidget {
  const _PopularTable();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < _popular.length; i++)
          _PopularRow(i + 1, _popular[i]),
      ],
    );
  }
}

class _PopularRow extends StatelessWidget {
  final int index;
  final _PopularSong song;

  const _PopularRow(this.index, this.song);

  @override
  Widget build(BuildContext context) {
    // Bài đầu tiên tô màu cyan như đang phát
    final playing = index == 1;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        hoverColor: Colors.white10,
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              SizedBox(
                width: 36,
                child: Text(
                  '$index',
                  style: TextStyle(
                    color: playing ? _cyan : AppColors.textSecondary,
                    fontSize: 16,
                  ),
                ),
              ),
              CoverArt(
                size: 48,
                radius: 4,
                color: song.color,
                image: song.image,
              ),
              const SizedBox(width: 14),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: playing ? _cyan : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      song.artist,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  song.plays,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                width: 60,
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
