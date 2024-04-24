import 'package:flutter/material.dart';
import 'package:mono/src/components/app_bar.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/image.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';
import 'package:mono/src/core/extensions/localization_extensions.dart';
import 'package:mono/src/features/home/home_controller.dart';
import 'package:mono/src/features/home/home_state.dart';
import 'package:mono/src/features/home/widgets/balance_card.dart';
import 'package:mono/src/features/home/widgets/subtitle_item.dart';
import 'package:mono/src/features/home/widgets/transactions_list_tile.dart';
import 'package:mono/src/locator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  final _controller = getIt.get<HomeController>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller.getAllTransactions();
  }

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
              screen: context.locales.homePage,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.locales.hiGreeting,
                    style: AppTypography.kLink.copyWith(
                      color: AppColor.kWhite,
                    ),
                  ),
                  Text(
                    context.locales.whatNewGreeting,
                    style: AppTypography.kSubtitle.copyWith(
                      color: AppColor.kWhite,
                      fontSize: AppSize.s20,
                    ),
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BalanceCard(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.s20,
                      ),
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, _) {
                          if (_controller.state is HomeLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: AppColor.kPrimary,
                              ),
                            );
                          }

                          if (_controller.state is HomeErrorState) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.s32,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                (_controller.state as HomeErrorState).message ??
                                    context.locales.genericErrorMessage,
                                style: AppTypography.kTitle.copyWith(
                                  color: AppColor.kPrimary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }

                          if (_controller.state is HomeSuccessState) {
                            if (_controller.transactions.isNotEmpty) {
                              return Column(
                                children: [
                                  const SubtitleItem(),
                                  ListView.builder(
                                    itemCount: _controller.transactions.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final item =
                                          _controller.transactions[index];
                                      return TransactionsListTile(
                                        title: item.title,
                                        date: item.date,
                                        value: item.value,
                                      );
                                    },
                                  ),
                                ],
                              );
                            } else {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.s32,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  context.locales.transactionsEmptyError,
                                  style: AppTypography.kTitle.copyWith(
                                    color: AppColor.kPrimary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }
                          }

                          return const SizedBox();
                        },
                      ),
                    ),
                  ],
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
