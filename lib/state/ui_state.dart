import 'package:flutter/foundation.dart';
import '../models/song.dart';

/// true = đang mở bảng "Danh sách phát" bên phải
final ValueNotifier<bool> queueOpen = ValueNotifier<bool>(false);

/// Các trang có thể hiện ở phần nội dung chính
enum AppPage {
  home,
  mine,
  favoriteSongs,
  recent,
  favoriteArtists,
  playlistChill,
  song,
  artist,
}

/// Trang đang được chọn
final ValueNotifier<AppPage> currentPage = ValueNotifier<AppPage>(AppPage.home);

/// Bài hát đang được mở ở trang chi tiết
final ValueNotifier<Song?> selectedSong = ValueNotifier<Song?>(null);
