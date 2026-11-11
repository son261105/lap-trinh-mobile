import 'package:flutter/material.dart';
import '../models/song.dart';
import '../state/ui_state.dart';
import '../theme/app_colors.dart';
import '../widgets/cover_art.dart';

const _cyan = Color(0xFF00D4E8);
const _pink = Color(0xFFFF4D8D);
const _grayButton = Color(0xFF2F2F2F);

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Song?>(
      valueListenable: selectedSong,
      builder: (context, song, _) {
        if (song == null) return const SizedBox.shrink();
        return _SongView(song, key: ValueKey(song.title));
      },
    );
  }
}

class _SongView extends StatelessWidget {
  final Song song;

  const _SongView(this.song, {super.key});

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
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SongHeader(song),
            const SizedBox(height: 40),
            _ArtistsSection(song.artists),
          ],
        ),
      ),
    );
  }
}

class _SongHeader extends StatelessWidget {
  final Song song;

  const _SongHeader(this.song);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CoverArt(size: 240, radius: 12, color: song.color, image: song.image),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bài hát',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                song.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                song.artists.map((a) => a.name).join(', '),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _LikeAction(song.likes),
                  const SizedBox(width: 16),
                  const _AddToPlaylistButton(),
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  _PlayButton(),
                  SizedBox(width: 12),
                  _DownloadButton(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Trái tim + số lượt thích, bấm vào thì đổi màu hồng và tăng 1
class _LikeAction extends StatefulWidget {
  final int likes;

  const _LikeAction(this.likes);

  @override
  State<_LikeAction> createState() => _LikeActionState();
}

class _LikeActionState extends State<_LikeAction> {
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () => setState(() => _liked = !_liked),
          icon: Icon(_liked ? Icons.favorite : Icons.favorite_border),
          color: _liked ? _pink : Colors.white,
          iconSize: 26,
        ),
        Text(
          '${widget.likes + (_liked ? 1 : 0)}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _AddToPlaylistButton extends StatelessWidget {
  const _AddToPlaylistButton();

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Thêm vào playlist',
      child: Material(
        color: _grayButton,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () {},
          child: const SizedBox(
            width: 42,
            height: 42,
            child: Icon(Icons.add, color: Colors.white, size: 22),
          ),
        ),
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _cyan,
      shape: const StadiumBorder(),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: () {},
        child: const SizedBox(
          width: 170,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.play_arrow, color: Colors.black, size: 22),
              SizedBox(width: 8),
              Text(
                'Phát',
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

class _DownloadButton extends StatelessWidget {
  const _DownloadButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _grayButton,
      shape: const StadiumBorder(),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: () {},
        child: const SizedBox(
          width: 170,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.download_outlined, color: Colors.white, size: 22),
              SizedBox(width: 8),
              Text(
                'Tải về',
                style: TextStyle(
                  color: Colors.white,
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

// ===== Phần Nghệ sĩ (nằm bên trái, to hơn) =====

class _ArtistsSection extends StatelessWidget {
  final List<Artist> artists;

  const _ArtistsSection(this.artists);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 640),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Nghệ sĩ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          for (final artist in artists) _ArtistTile(artist),
        ],
      ),
    );
  }
}

class _ArtistTile extends StatelessWidget {
  final Artist artist;

  const _ArtistTile(this.artist);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CoverArt(
            size: 88,
            circle: true,
            color: artist.color,
            image: artist.image,
            icon: Icons.person,
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  artist.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${artist.followers} người theo dõi',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const _FollowButton(),
        ],
      ),
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
