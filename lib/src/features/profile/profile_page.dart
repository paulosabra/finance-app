import 'package:flutter/material.dart';
import 'package:mono/src/components/app_bar.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/image.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/core/extensions/localization_extensions.dart';
import 'package:mono/src/features/profile/widgets/profile_button.dart';
import 'package:mono/src/features/profile/widgets/profile_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin<ProfilePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ColoredBox(
      color: AppColor.kWhite,
      child: Stack(
        children: [
          Image.asset(
            AppImage.kAppBar,
            alignment: Alignment.topCenter,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(
              screen: context.locales.profilePage,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProfileCard(),
                      ProfileButton.signOut(
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            resizeToAvoidBottomInset: false,
          ),
        ],
      ),
    );
  }
}
