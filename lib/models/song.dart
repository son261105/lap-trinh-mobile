import 'package:flutter/material.dart';

class Artist {
  final String name;
  final int followers;
  final Color color;
  final String? image;

  const Artist({
    required this.name,
    required this.followers,
    required this.color,
    this.image,
  });
}

class Song {
  final String title;
  final List<Artist> artists;
  final Color color;
  final String? image;
  final int likes;

  const Song({
    required this.title,
    required this.artists,
    required this.color,
    this.image,
    this.likes = 0,
  });
}
