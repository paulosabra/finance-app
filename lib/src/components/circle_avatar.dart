import 'package:flutter/material.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    required this.image,
    required this.initials,
    super.key,
  });
  final String? image;
  final String? initials;

  @override
  Widget build(BuildContext context) {
    final imageUrl = image != null;
    return Center(
      child: CircleAvatar(
        backgroundColor: AppColor.kBorder,
        backgroundImage: imageUrl ? NetworkImage(image!) : null,
        radius: AppSize.s60,
        child: !imageUrl
            ? Text(
                initials ?? '',
                style: AppTypography.kDisplay.copyWith(
                  color: AppColor.kPrimary,
                ),
              )
            : null, //Text
      ), //CircleAvatar
    );
  }
}
