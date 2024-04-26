import 'package:flutter/material.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.screen,
    this.title,
    super.key,
  });
  final String? screen;
  final Widget? title;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.s60);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      title: widget.title ??
          Center(
            child: Text(
              widget.screen ?? '',
              style: AppTypography.kSubtitle.copyWith(
                color: AppColor.kWhite,
              ),
            ),
          ),
    );
  }
}
