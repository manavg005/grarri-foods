import 'package:flutter/material.dart';
import 'package:grarri/src/data_layer/res/res.dart';
import 'package:grarri/src/ui_layer/screens/menu/main_menu_screen.dart';
import 'package:grarri/src/ui_layer/screens/menu/special_menu_screen.dart';
import 'package:grarri/src/ui_layer/widgets/common_buttons.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({super.key});

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          // extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 10,
            title: Row(
              children: [
                Container(
                  height: 32.height,
                  width: 32.width,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.gray,
                  ),
                ),
                8.sbWidth,
                Text(
                  "Sunrise Cafe",
                  style: AppStyles.ubuntuTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.gray74),
                ),
              ],
            ),
            backgroundColor: AppColors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            actions: [
              const CommonButton(
                imagePath: AppImages.support,
              ),
              10.sbWidth,
              const CommonButton(
                imagePath: AppImages.hash,
              ),
              16.sbWidth,
            ],
            bottom: TabBar(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              labelStyle: AppStyles.semiBoldTextStyle(
                  color: AppColors.selectedLabelText),
              labelPadding: EdgeInsets.zero,
              indicatorColor: AppColors.selectedLabelText,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
              unselectedLabelStyle: AppStyles.semiBoldTextStyle(
                  color: AppColors.unselectedLabelText),
              tabs: const [
                Tab(text: 'Special'),
                Tab(text: 'Main'),
                Tab(text: 'Desserts'),
                Tab(text: 'Beverages'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              SpecialMenuScreen(),
              MainMenuScreen(),
              Center(child: Text('Desserts')),
              Center(child: Text('Beverages')),
            ],
          ),
        ));
  }
}
