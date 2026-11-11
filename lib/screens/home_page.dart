import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/cover_art.dart';

const _cyan = Color(0xFF00D4E8);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1B3A3A), AppColors.sidebar],
          stops: [0, 0.35],
        ),
      ),
      child: const SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader('Bảng Xếp Hạng'),
            SizedBox(height: 16),
            _ChartsRow(),
            SizedBox(height: 32),
            _SectionHeader('Nghệ sĩ thịnh hành', action: 'Hiện tất cả'),
            SizedBox(height: 16),
            _ArtistsRow(),
          ],
        ),
      ),
    );
  }
}

// Tiêu đề của mỗi mục, có thể có chữ nhỏ ở góc phải (Hiện tất cả, Thêm)
class _SectionHeader extends StatelessWidget {
  final String title;
  final String? action;

  const _SectionHeader(this.title, {this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (action != null)
          Text(
            action!,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }
}

// ===== Bảng xếp hạng =====

class _ChartSong {
  final String title;
  final String artist;
  final Color color;
  final String? image;

  const _ChartSong(this.title, this.artist, this.color, {this.image});
}

class _Chart {
  final String title;
  final Color background;
  final List<_ChartSong> songs;

  const _Chart(this.title, this.background, this.songs);
}

const _charts = [
  _Chart('Top Bài Hát Thịnh Hành', Color(0xFF4A3535), [
    _ChartSong(
      'Gái Tây Gốc Việt',
      'Nicole Nguyễn, Tommy Tèo',
      Color(0xFF3B82F6),
      image: 'imgs/GaiTayGocViet.jpg',
    ),
    _ChartSong(
      'Anh Vẫn Ở Đây',
      'Quang Đăng Trần',
      Color(0xFF8B5CF6),
      image: 'imgs/AnhVanODay.jpg',
    ),
    _ChartSong(
      'Chờ Chút',
      'CONGB',
      Color(0xFFEC4899),
      image: 'imgs/ChoChut.jpg',
    ),
    _ChartSong(
      'Để Dành cho Em',
      'Dangrangto',
      Color(0xFF14B8A6),
      image: 'imgs/DeDanhChoEm.jpg',
    ),
    _ChartSong(
      'Xương Rồng',
      'Dangrangto',
      Color(0xFFF59E0B),
      image: 'imgs/XuongRong.jpg',
    ),
  ]),
  _Chart('Top Nhạc Việt', Color(0xFF45472A), [
    _ChartSong(
      'Như Một Người Dưng',
      'OSAD, Hà An Huy',
      Color(0xFF6366F1),
      image: 'imgs/NhuMotNguoiDung.jpg',
    ),
    _ChartSong(
      'Tìm Em',
      'Hngle, Bảo Anh',
      Color(0xFF0EA5E9),
      image: 'imgs/TimEm.jpg',
    ),
    _ChartSong(
      ' Lưu Niên',
      'Jack - 97',
      Color(0xFFEF4444),
      image: 'imgs/LuuNien.jpg',
    ),
    _ChartSong(
      'Chờ Chút',
      'CONGB',
      Color(0xFF22C55E),
      image: 'imgs/ChoChut.jpg',
    ),
    _ChartSong(
      'Thế Nào Là Đúng?',
      'Nghệ sĩ K',
      Color(0xFFD946EF),
      image: 'imgs/TheNaoLaDung.jpg',
    ),
  ]),
];

class _ChartsRow extends StatelessWidget {
  const _ChartsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < _charts.length; i++) ...[
          if (i > 0) const SizedBox(width: 24),
          Expanded(child: _ChartCard(_charts[i])),
        ],
      ],
    );
  }
}

class _ChartCard extends StatelessWidget {
  final _Chart chart;

  const _ChartCard(this.chart);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [chart.background, Colors.black],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(120),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        chart.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                      size: 22,
                    ),
                  ],
                ),
              ),
              const _PlayPill(),
            ],
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < chart.songs.length; i++)
            _ChartRow(i + 1, chart.songs[i]),
        ],
      ),
    );
  }
}

class _PlayPill extends StatelessWidget {
  const _PlayPill();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0x33FFFFFF),
      shape: const StadiumBorder(),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Phát',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.play_arrow, color: _cyan, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChartRow extends StatelessWidget {
  final int rank;
  final _ChartSong song;

  const _ChartRow(this.rank, this.song);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        hoverColor: Colors.white10,
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Row(
            children: [
              SizedBox(
                width: 32,
                child: Text(
                  '$rank',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              CoverArt(
                size: 52,
                radius: 6,
                color: song.color,
                image: song.image,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      song.artist,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Nghệ sĩ yêu thích

class _Artist {
  final String name;
  final Color color;
  final String? image;

  const _Artist(this.name, this.color, {this.image});
}

const _artists = [
  _Artist('Vũ.', Color(0xFFE11D48), image: 'imgs/NgheSiVu.jpg'),
  _Artist('AMEE', Color(0xFFE11D48), image: 'imgs/AnhNgheSiAmee.jpg'),
  _Artist('SOOBIN', Color(0xFFE11D48), image: 'imgs/NgheSiSoobin.jpg'),
  _Artist('Sơn Tùng M-TP', Color(0xFFE11D48), image: 'imgs/NgheSiSontung.jpg'),
  _Artist('Phan Mạnh Quỳnh', Color(0xFFE11D48), image: 'imgs/NgheSiPMQ.jpg'),
  _Artist('Đen Vâu', Color(0xFFE11D48), image: 'imgs/NgheSiDenVau.jpg'),
];

class _ArtistsRow extends StatelessWidget {
  const _ArtistsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < _artists.length; i++) ...[
          if (i > 0) const SizedBox(width: 12),
          Expanded(child: _ArtistCard(_artists[i])),
        ],
      ],
    );
  }
}

class _ArtistCard extends StatefulWidget {
  final _Artist artist;

  const _ArtistCard(this.artist);

  @override
  State<_ArtistCard> createState() => _ArtistCardState();
}

class _ArtistCardState extends State<_ArtistCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final artist = widget.artist;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _hover ? AppColors.surface : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: CoverArt(
                    color: artist.color,
                    image: artist.image,
                    icon: Icons.person,
                    circle: true,
                  ),
                ),
                Positioned(
                  right: 4,
                  bottom: 4,
                  child: AnimatedOpacity(
                    opacity: _hover ? 1 : 0,
                    duration: const Duration(milliseconds: 150),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        color: _cyan,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 26,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              artist.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Nghệ sĩ',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
