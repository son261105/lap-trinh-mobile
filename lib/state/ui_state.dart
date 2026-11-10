import 'package:flutter/foundation.dart';

final ValueNotifier<bool> queueOpen = ValueNotifier<bool>(false);

enum AppPage {
  home,
  mine,
  favoriteSongs,
  recent,
  favoriteArtists,
  playlistChill,
}

/// Trang đang được chọn
final ValueNotifier<AppPage> currentPage = ValueNotifier<AppPage>(AppPage.home);
