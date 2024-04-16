import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/icons.dart';
import 'package:mono/src/features/home/home_page.dart';
import 'package:mono/src/features/main/widgets/bottom_app_bar.dart';
import 'package:mono/src/features/main/widgets/bottom_app_bar_item.dart';
import 'package:mono/src/features/profile/profile_page.dart';
import 'package:mono/src/features/statistics/statistics_page.dart';
import 'package:mono/src/features/wallet/wallet_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: const [
          HomePage(),
          StatisticsPage(),
          WalletPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: SvgPicture.asset(
          AppIcons.kAdd,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomAppBar(
        selectedItemColor: AppColor.kPrimary,
        children: [
          CustomBottomAppBarItem(
            icon: AppIcons.kHome,
            iconSelected: AppIcons.kHomeFilled,
            onPressed: () => _controller.jumpToPage(0),
          ),
          CustomBottomAppBarItem(
            icon: AppIcons.kStatistics,
            iconSelected: AppIcons.kStatisticsFilled,
            onPressed: () => _controller.jumpToPage(1),
          ),
          CustomBottomAppBarItem.empty(),
          CustomBottomAppBarItem(
            icon: AppIcons.kWallet,
            iconSelected: AppIcons.kWalletFilled,
            onPressed: () => _controller.jumpToPage(2),
          ),
          CustomBottomAppBarItem(
            icon: AppIcons.kProfile,
            iconSelected: AppIcons.kProfileFilled,
            onPressed: () => _controller.jumpToPage(3),
          ),
        ],
      ),
    );
  }
}
