import 'package:flutter/material.dart';
import '../state/ui_state.dart';
import '../theme/app_colors.dart';
import '../widgets/player_bar.dart';
import '../widgets/queue_panel.dart';
import '../widgets/sidebar.dart';
import '../widgets/top_bar.dart';
import 'playlist_page.dart';
import 'simple_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _pageFor(AppPage page) {
    switch (page) {
      case AppPage.home:
        return const SimplePage('Trang chủ');
      case AppPage.mine:
        return const SimplePage('Của Tôi');
      case AppPage.favoriteSongs:
        return const SimplePage('Bài hát yêu thích');
      case AppPage.recent:
        return const SimplePage('Nghe gần đây');
      case AppPage.favoriteArtists:
        return const SimplePage('Nghệ sĩ yêu thích');
      case AppPage.playlistChill:
        return const PlaylistPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const TopBar(),
            const SizedBox(height: 8),
            Expanded(
              child: Row(
                children: [
                  const Sidebar(),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: ColoredBox(
                        color: AppColors.sidebar,
                        child: ValueListenableBuilder<AppPage>(
                          valueListenable: currentPage,
                          builder: (context, page, _) => _pageFor(page),
                        ),
                      ),
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: queueOpen,
                    builder: (context, open, _) {
                      if (!open) return const SizedBox.shrink();
                      return const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: QueuePanel(),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const PlayerBar(),
          ],
        ),
      ),
    );
  }
}
