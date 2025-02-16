import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/profile_cubit/profile_cubit.dart';
import 'package:movies_app/data/avatar_data.dart';
import 'package:movies_app/methods/capitalize.dart';
import 'package:movies_app/repository/profile_repo/profile_repo_impl.dart';
import 'package:movies_app/resources/assets_manager.dart';
import 'package:movies_app/resources/string_manager.dart';
import 'package:movies_app/theme/color_manager.dart';
import 'package:movies_app/view/screens/tabs/profile_tab/sections/buttons_section.dart';
import 'package:movies_app/view/screens/tabs/profile_tab/sections/history_tab.dart';
import 'package:movies_app/view/screens/tabs/profile_tab/sections/profile_loading.dart';
import 'package:movies_app/view/screens/tabs/profile_tab/sections/watch_list_tab.dart';
import 'package:movies_app/view/screens/tabs/profile_tab/sections/wish_list_section.dart';
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
    return BlocProvider(
      create: (context) => ProfileCubit(ProfileRepoImpl())..getProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
        if (state is ProfileLoading) {
          return ProfileLoadingSection();
        } else if (state is ProfileError) {
          return Text('Error');
        }
        var bloc = BlocProvider.of<ProfileCubit>(context);
        var user = bloc.registerResponse!.data;
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
                              AvatarData.listOfImages[user!.avaterId!.toInt()],
                              width: 118,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              user.name!.capitalize(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        WishListSection(),
                        TitleCount(
                            title: StringsManager.history.tr(), count: '11'),
                      ],
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    ButtonsSection(
                      bloc: bloc,
                    ),
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
                        StringsManager.watchList.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(AssetsManager.folder),
                      Text(
                        StringsManager.history.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: size.height * .85,
                child: TabBarView(
                  controller: tabController,
                  children: [WatchListTab(), HistoryTab()],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
