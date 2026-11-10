import 'package:flutter/material.dart';

class CoverArt extends StatelessWidget {
  final double? size;
  final String? image;
  final Color color;
  final IconData icon;
  final bool circle;
  final double radius;

  const CoverArt({
    super.key,
    required this.color,
    this.size,
    this.image,
    this.icon = Icons.music_note,
    this.circle = false,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    final Widget content = image != null
        ? Image.asset(image!, fit: BoxFit.cover)
        : DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color, Color.lerp(color, Colors.black, 0.5)!],
              ),
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white54,
                size: (size ?? 80) * 0.4,
              ),
            ),
          );

    return ClipRRect(
      borderRadius: BorderRadius.circular(circle ? 999 : radius),
      child: SizedBox(width: size, height: size, child: content),
    );
  }
}
