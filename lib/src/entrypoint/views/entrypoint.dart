import 'package:adietalk_radio/common/utils/kcolors.dart';
import 'package:adietalk_radio/common/widgets/app_style.dart';
import 'package:adietalk_radio/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:adietalk_radio/src/home/views/home_screen.dart';
import 'package:adietalk_radio/src/settings/views/settings_screen.dart';
import 'package:adietalk_radio/src/wishlist/views/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class AppEntryPoint extends StatelessWidget {
  AppEntryPoint({super.key});

  List<Widget> pageList = [
    const HomeScreen(),
    const WishlistScreen(),
    // const ShowsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexNotifier>(
      builder: (context, tabIndexNotifier, child) {
        return Scaffold(
          body: Stack(
            children: [
              pageList[tabIndexNotifier.index],
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(canvasColor: Kolors.kOffWhite),
                  child: BottomNavigationBar(
                    selectedFontSize: 12,
                    elevation: 0,
                    showSelectedLabels: true,
                    selectedLabelStyle: appStyle(
                      9,
                      Kolors.kPrimary,
                      FontWeight.w500,
                    ),
                    showUnselectedLabels: false,
                    currentIndex: tabIndexNotifier.index,
                    selectedItemColor: Kolors.kPrimary,
                    unselectedItemColor: Kolors.kGray,
                    unselectedIconTheme: const IconThemeData(
                      color: Colors.black38,
                    ),
                    onTap: (i) {
                      tabIndexNotifier.setIndex(i);
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: tabIndexNotifier.index == 0
                            ? const Icon(
                                AntDesign.home,
                                color: Kolors.kPrimary,
                                size: 24,
                              )
                            : const Icon(AntDesign.home, size: 24),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: tabIndexNotifier.index == 1
                            ? const Icon(
                                Ionicons.heart,
                                color: Kolors.kPrimary,
                                size: 24,
                              )
                            : const Icon(Ionicons.tv_sharp),
                        label: "Shows",
                      ),
                      BottomNavigationBarItem(
                        icon: tabIndexNotifier.index == 2
                            ? const Badge(
                                label: Text('9'),
                                child: Icon(
                                  MaterialCommunityIcons.newspaper,
                                  color: Kolors.kPrimary,
                                  size: 24,
                                ),
                              )
                            : const Badge(
                                label: Text('9'),
                                child: Icon(
                                  MaterialCommunityIcons.shopping_outline,
                                ),
                              ),
                        label: "Promotion",
                      ),

                      BottomNavigationBarItem(
                        icon: tabIndexNotifier.index == 3
                            ? const Icon(
                                Icons.settings,
                                color: Kolors.kPrimary,
                                size: 34,
                              )
                            : const Icon(Icons.settings, size: 34),
                        label: "Settings",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
