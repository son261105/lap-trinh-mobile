import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/player_bar.dart';
import '../widgets/sidebar.dart';
import '../widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Sidebar(),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        TopBar(),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Nội dung chính sẽ nằm ở đây',
                              style: TextStyle(color: Colors.white54),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            PlayerBar(),
          ],
        ),
      ),
    );
  }
}
