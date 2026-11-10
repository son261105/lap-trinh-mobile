import 'package:flutter/material.dart';
import '../state/ui_state.dart';
import '../theme/app_colors.dart';
import '../widgets/player_bar.dart';
import '../widgets/queue_panel.dart';
import '../widgets/sidebar.dart';
import '../widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  const Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: ColoredBox(
                        color: AppColors.sidebar,
                        child: Center(
                          child: Text(
                            'Nội dung chính sẽ nằm ở đây',
                            style: TextStyle(color: Colors.white54),
                          ),
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
