import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:grarri/src/business_layer/providers/cart_provider.dart';
import 'package:grarri/src/business_layer/util/helper/helper.dart';
import 'package:grarri/src/data_layer/res/res.dart';
import 'package:grarri/src/ui_layer/screens/cart/cart_screen.dart';
import 'package:grarri/src/ui_layer/screens/menu/food_list_screen.dart';
import 'package:grarri/src/ui_layer/widgets/image_widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: const FoodListScreen(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return Consumer<CartProvider>(
      builder: (context, provider, child) {
        return BottomNavigationBar(
          backgroundColor: AppColors.primaryColor,
          currentIndex: 1,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          useLegacyColorScheme: false,
          iconSize: 32,
          onTap: (index) {
            setState(() {
              if (index == 2) {
                // Navigate to CartScreen when the Cart icon is pressed
                Navigator.push(context,
                    ScreenNavigation.createRoute(widget: const CartScreen()));
              }
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: _iconContainer(
                  AppImages.bolt, AppDecorations.outerBoxDecoration), // Static
              label: 'Static',
            ),
            BottomNavigationBarItem(
              icon: _iconContainer(
                  AppImages.home, AppDecorations.innerBoxDecoration), // Static
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                clipBehavior: Clip.none,
                children: [
                  _iconContainer(
                      AppImages.cart, AppDecorations.outerBoxDecoration),
                  if (provider.getTotalItemCount() > 0)
                    Positioned(
                        top: -12,
                        right: -10,
                        child: _badgeCountWidget(provider))
                ],
              ), // Static
              label: 'cart',
            ),
          ],
        );
      },
    );
  }

  Widget _badgeCountWidget(CartProvider provider) {
    return Container(
      height: 20.height,
      width: 20.width,
      // padding: AppStyles.pd5,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.badgeRed,
      ),
      child: Center(
        child: Text(
          "${provider.getTotalItemCount()}",
          style: AppStyles.mediumTextStyle(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  Widget _iconContainer(String iconPath, Decoration decoration) {
    return Container(
      padding: AppStyles.pd6,
      decoration: decoration,
      child: SvgImageWidget(
        imagePath: iconPath,
      ),
    );
  }
}
