import 'dart:ui';

class CustomBottomAppBarItem {
  final String? icon;
  final String? iconSelected;
  final VoidCallback? onPressed;

  CustomBottomAppBarItem({
    required this.icon,
    required this.iconSelected,
    required this.onPressed,
  });

  CustomBottomAppBarItem.empty({
    this.icon = '',
    this.iconSelected = '',
    this.onPressed,
  });
}
