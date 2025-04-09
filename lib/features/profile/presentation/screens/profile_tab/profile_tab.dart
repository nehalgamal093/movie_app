import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/data/avatar_data.dart';
import 'package:movies_app/features/profile/data/models/user_model.dart';
import 'package:movies_app/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:movies_app/features/profile/presentation/screens/profile_tab/sections/buttons_section.dart';
import 'package:movies_app/features/profile/presentation/screens/profile_tab/sections/history_tab.dart';
import 'package:movies_app/features/profile/presentation/screens/profile_tab/sections/profile_loading.dart';
import 'package:movies_app/features/profile/presentation/screens/profile_tab/sections/watch_list_tab.dart';
import 'package:movies_app/features/profile/presentation/screens/profile_tab/sections/wish_list_section.dart';
import 'package:movies_app/features/profile/presentation/screens/profile_tab/widgets/title_count.dart';
import 'package:movies_app/methods/capitalize.dart';
import 'package:movies_app/theme/color_manager.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/string_manager.dart';

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
      create: (context) => getIt<ProfileCubit>()..getUser(),
      child: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
        if (state is UserLoading) {
          return ProfileLoadingSection();
        } else if (state is UserError) {
          return Text('Error');
        } else if (state is UserSuccess) {
          var user = state.user.data;

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
                                AvatarData
                                    .listOfImages[user!.avaterId!.toInt()],
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
                        user: state.user,
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
        } else {
          return SizedBox();
        }
      }),
    );
  }
}
