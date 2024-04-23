import 'package:flutter/material.dart';
import 'package:mono/src/components/app_bar.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/image.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/core/extensions/localization_extensions.dart';
import 'package:mono/src/features/home/widgets/balance_card.dart';
import 'package:mono/src/features/home/widgets/subtitle_item.dart';
import 'package:mono/src/features/home/widgets/transactions_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
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
              greetings: context.locales.afternoonGreeting,
              name: 'Architecto Sunt',
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
                      child: Column(
                        children: [
                          const SubtitleItem(),
                          ListView.builder(
                            itemCount: 4,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return TransactionsListTile(
                                location: 'Ipsa Suscipit Distinctio',
                                date: DateTime.now(),
                                value: -850,
                              );
                            },
                          ),
                        ],
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
