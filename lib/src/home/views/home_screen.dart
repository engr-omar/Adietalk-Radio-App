import 'package:adietalk_radio/src/home/controllers/home_tab_notifier.dart';
import 'package:adietalk_radio/src/home/widgets/categories_list.dart';
import 'package:adietalk_radio/src/home/widgets/custom_app_bar.dart';
import 'package:adietalk_radio/src/home/widgets/home_header.dart';
import 'package:adietalk_radio/src/home/widgets/home_slider.dart';
import 'package:adietalk_radio/src/home/widgets/home_tabs.dart';
import 'package:adietalk_radio/src/home/widgets/shows_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();

    // Convert weekday (1–7) to 0–6
    int todayIndex = DateTime.now().weekday - 1;

    _tabController = TabController(
      length: homeTabs.length,
      vsync: this,
      initialIndex: todayIndex,
    );

    _currentTabIndex = todayIndex;

    // Sync notifier with today’s tab after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = Provider.of<HomeTabNotifier>(context, listen: false);
      controller.setIndex(todayIndex);
    });

    _tabController.addListener(_handleSelection);
  }

  void _handleSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _currentTabIndex = _tabController.index;
      });

      final controller = Provider.of<HomeTabNotifier>(context, listen: false);
      controller.setIndex(_currentTabIndex);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: CustomAppBar(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        children: [
          SizedBox(height: 20.h),
          const HomeSlider(),
          SizedBox(height: 15.h),
          const HomeHeader(),
          SizedBox(height: 10.h),
          const HomeCategoriesList(),
          SizedBox(height: 15.h),
          HomeTabs(tabController: _tabController),
          SizedBox(height: 15.h),
          const ExploreShows(),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }
}

// Still keep this for Tab labels:
List<String> homeTabs = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];
