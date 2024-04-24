import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/icons.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton.signOut({
    required this.onTap,
    this.icon = AppIcons.kSignOut,
    this.label = 'Sign out',
    super.key,
  });

  final String icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSize.s12),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: AppSize.s28,
              width: AppSize.s28,
            ),
            const SizedBox(width: AppSize.s32),
            Text(
              label,
              style: AppTypography.kText.copyWith(
                color: AppColor.kTextHighlight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
