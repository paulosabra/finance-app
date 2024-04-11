import 'package:flutter/material.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/size.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox.square(
        dimension: AppSize.s48,
        child: CircularProgressIndicator(
          color: AppColor.kPrimary,
          strokeWidth: AppSize.s4,
        ),
      ),
    );
  }
}

Future showLoader(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) {
      return const CustomLoader();
    },
  );
}
