import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
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
    );
  }
}
