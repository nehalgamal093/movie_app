import 'package:flutter/material.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/theme/color_manager.dart';
import 'package:movies_app/view/screens/tabs/profile_tab/sections/buttons_section.dart';
import 'package:movies_app/view/screens/tabs/profile_tab/sections/history_tab.dart';
import 'package:movies_app/view/screens/tabs/profile_tab/sections/watch_list_tab.dart';
import 'package:movies_app/view/screens/tabs/profile_tab/widgets/title_count.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: ColorManager.lightBlackColor,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetsManager.avatar3,
                          width: 118,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Nehal Gamal',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    TitleCount(title: StringsManager.wishlist, count: '1'),
                    TitleCount(title: StringsManager.history, count: '11'),
                  ],
                ),
                SizedBox(
                  height: 23,
                ),
                ButtonsSection(),
              ],
            ),
          ),
        ),
        SliverAppBar(
          backgroundColor: ColorManager.lightBlackColor,
          pinned: true,
          automaticallyImplyLeading: false,
          bottom: TabBar(
            controller: tabController,
            indicatorColor: ColorManager.primaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            onTap: (index) {},
            tabs: [
              Column(
                children: [
                  Image.asset(AssetsManager.list),
                  Text(
                    StringsManager.watchList,
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
              Column(
                children: [
                  Image.asset(AssetsManager.folder),
                  Text(
                    StringsManager.history,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              )
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: size.height*.85,
            child: TabBarView(
                controller: tabController,
                children: [WatchListTab(), HistoryTab()],),
          ),
        )
      ],
    );
  }
}
