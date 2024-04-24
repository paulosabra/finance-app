import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mono/src/components/circle_avatar.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.sizeOf(context).height * 0.15,
        bottom: AppSize.s32,
      ),
      child: Column(
        children: [
          const CustomCircleAvatar(
            image:
                'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745',
            initials: 'TP',
          ),
          const SizedBox(height: AppSize.s20),
          Text(
            'Temporibus Provident',
            style: AppTypography.kTitle.copyWith(
              color: AppColor.kTextHighlight,
            ),
          ),
          Text(
            '@temporibus_provident',
            style: AppTypography.kLink.copyWith(
              color: AppColor.kPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
