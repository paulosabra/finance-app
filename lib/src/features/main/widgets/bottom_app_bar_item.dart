import 'dart:ui';

class CustomBottomAppBarItem {

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
  final String? icon;
  final String? iconSelected;
  final VoidCallback? onPressed;
}
