import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/features/main/widgets/bottom_app_bar_item.dart';

class CustomBottomAppBar extends StatefulWidget {

  const CustomBottomAppBar({
    required this.children, super.key,
    this.selectedItemColor,
  });
  final Color? selectedItemColor;
  final List<CustomBottomAppBarItem> children;

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      shadowColor: AppColor.kWhite,
      height: AppSize.s80,
      surfaceTintColor: AppColor.kWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.children.map(
          (item) {
            final currentItem =
                widget.children.indexOf(item) == _selectedItemIndex;
            return Expanded(
              child: GestureDetector(
                onTap: item.onPressed,
                onTapUp: (_) => setState(() {
                  _selectedItemIndex = widget.children.indexOf(item);
                }),
                child: Padding(
                  padding: const EdgeInsets.all(AppSize.s12),
                  child: SvgPicture.asset(
                    currentItem ? item.iconSelected! : item.icon!,
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
