import 'package:flutter/material.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';
import 'package:mono/src/core/extensions/localization_extensions.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.greetings,
    required this.name,
    super.key,
  });

  final String? greetings;
  final String? name;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.s60);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.greetings ?? context.locales.hiGreeting,
            style: AppTypography.kLink.copyWith(
              color: AppColor.kWhite,
            ),
          ),
          Text(
            widget.name ?? context.locales.whatNewGreeting,
            style: AppTypography.kSubtitle.copyWith(
              color: AppColor.kWhite,
            ),
          ),
        ],
      ),
    );
  }
}
