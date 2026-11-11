import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

// Đổi tên thương hiệu ở đây, cả chân trang sẽ đổi theo
const _brand = 'MusicChill';

class _FooterColumn {
  final String title;
  final List<String> links;

  const _FooterColumn(this.title, this.links);
}

const _columns = [
  _FooterColumn('Công ty', ['Giới thiệu', 'Việc làm', 'For the Record']),
  _FooterColumn('Cộng đồng', [
    'Dành cho các Nghệ sĩ',
    'Dành cho Nhà sáng tạo',
    'Dành cho Tác giả',
    'Nhà phát triển',
    'Quảng cáo',
    'Nhà đầu tư',
    'Nhà cung cấp',
  ]),
  _FooterColumn('Đường liên kết hữu ích', [
    'Hỗ trợ',
    'Ứng dụng Di động Miễn phí',
    'Phổ biến theo quốc gia',
    'Top lời bài hát',
    'Thêm nhạc',
  ]),
  _FooterColumn('Các gói của $_brand', [
    'Premium Individual',
    'Premium Student',
    '$_brand Free',
  ]),
];

const _bottomLinks = [
  'Pháp lý',
  'Trung tâm an toàn và quyền riêng tư',
  'Chính sách quyền riêng tư',
  'Cookie',
  'Giới thiệu Quảng cáo',
  'Hỗ trợ tiếp cận',
];

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(color: Colors.white12, height: 1),
        const SizedBox(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final column in _columns)
              Expanded(child: _FooterColumnView(column)),
            const Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: _SocialIcons(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Divider(color: Colors.white12, height: 1),
        const SizedBox(height: 20),
        const _FooterBottom(),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _FooterColumnView extends StatelessWidget {
  final _FooterColumn column;

  const _FooterColumnView(this.column);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          column.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        for (final link in column.links) _FooterLink(link),
      ],
    );
  }
}

// Một liên kết: rê chuột vào thì chữ sáng lên và có gạch chân
class _FooterLink extends StatefulWidget {
  final String text;
  final double fontSize;

  const _FooterLink(this.text, {this.fontSize = 14});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          widget.text,
          style: TextStyle(
            color: _hover ? Colors.white : AppColors.textSecondary,
            fontSize: widget.fontSize,
            decoration: _hover ? TextDecoration.underline : TextDecoration.none,
            decorationColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _SocialIcons extends StatelessWidget {
  const _SocialIcons();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SocialButton(Icons.camera_alt_outlined, 'Instagram'),
        SizedBox(width: 10),
        _SocialButton(Icons.alternate_email, 'X'),
        SizedBox(width: 10),
        _SocialButton(Icons.facebook, 'Facebook'),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;

  const _SocialButton(this.icon, this.tooltip);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: AppColors.surfaceHover,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          hoverColor: Colors.white12,
          onTap: () {},
          child: SizedBox(
            width: 40,
            height: 40,
            child: Icon(icon, color: Colors.white, size: 20),
          ),
        ),
      ),
    );
  }
}

class _FooterBottom extends StatelessWidget {
  const _FooterBottom();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Wrap(
            spacing: 20,
            children: [
              for (final link in _bottomLinks) _FooterLink(link, fontSize: 12),
            ],
          ),
        ),
        const SizedBox(width: 16),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            '© 2026 $_brand',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
