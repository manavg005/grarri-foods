import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:grarri/src/business_layer/providers/cart_provider.dart';
import 'package:grarri/src/data_layer/list_file.dart';
import 'package:grarri/src/ui_layer/screens/menu/widgets/menu_item_card.dart';
import 'package:grarri/src/ui_layer/screens/menu/widgets/tooltip.dart';
import 'package:grarri/src/ui_layer/widgets/custom_expansion_widget.dart';
import 'package:provider/provider.dart';

import '../../../business_layer/util/helper/device_info_helper.dart';
import '../../../data_layer/res/res.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  final ScrollController _scrollController = ScrollController();

  // // Define keys for each section
  final GlobalKey _chineseKey = GlobalKey();
  final GlobalKey _indianKey = GlobalKey();
  final GlobalKey _continentalKey = GlobalKey();
  final GlobalKey _nonVegKey = GlobalKey();
  final GlobalKey _breadsKey = GlobalKey();
  bool _isAddTapped = false; // Toggled for tooltip visibility

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _isAddTapped = !_isAddTapped; // Toggle the tooltip visibility
          });
        },
        label: const Text("Menu"),
        backgroundColor: AppColors.gray74,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                CustomExpansionTile(
                  key: _chineseKey,
                  title: "Chinese",
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: chineseItems.length,
                    itemBuilder: (context, index) {
                      final item = chineseItems[index];
                      return MenuItemListCard(
                          item: item, cartProvider: cartProvider);
                    },
                  ),
                ),
                CustomExpansionTile(
                  key: _indianKey,
                  title: "Indian",
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: indianItems.length,
                    itemBuilder: (context, index) {
                      final item = indianItems[index];
                      return MenuItemListCard(
                          item: item, cartProvider: cartProvider);
                    },
                  ),
                ),
                CustomExpansionTile(
                  key: _continentalKey,
                  title: "Continental",
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: continentalItems.length,
                    itemBuilder: (context, index) {
                      final item = continentalItems[index];
                      return MenuItemListCard(
                          item: item, cartProvider: cartProvider);
                    },
                  ),
                ),
                CustomExpansionTile(
                  key: _nonVegKey,
                  title: "Non-Veg Items",
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: nonVegItems.length,
                    itemBuilder: (context, index) {
                      final item = nonVegItems[index];
                      return MenuItemListCard(
                          item: item, cartProvider: cartProvider);
                    },
                  ),
                ),
                CustomExpansionTile(
                  key: _breadsKey,
                  title: "Breads",
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: breads.length,
                    itemBuilder: (context, index) {
                      final item = breads[index];
                      return MenuItemListCard(
                          item: item, cartProvider: cartProvider);
                    },
                  ),
                ),
              ],
            ),
          ),
          if (_isAddTapped)
            _tooltip(), // Display tooltip if _isAddTapped is true
        ],
      ),
    );
  }

  Widget _tooltip() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: DeviceInfo.smallDevice ? d_12 : d_16, vertical: 70),
        width: 237.width,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: AppColors.gray74),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowLight,
                offset: Offset(-5.0, -5.0),
                blurRadius: 13.0,
              ),
              BoxShadow(
                color: Color.fromRGBO(222, 222, 222, 0.9),
                offset: Offset(5.0, 5.0),
                blurRadius: 10.0,
              ),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MenuContent(
              onTap: () {
                _isAddTapped = false;
                _scrollToSection(_chineseKey);

                setState(() {});
              },
              title: "Chinese",
            ),
            const MenuContentDivider(),
            MenuContent(
                onTap: () {
                  _isAddTapped = false;
                  _scrollToSection(_indianKey);

                  setState(() {});
                },
                title: "Indian"),
            const MenuContentDivider(),
            MenuContent(
                onTap: () {
                  _isAddTapped = false;
                  _scrollToSection(_continentalKey);

                  setState(() {});
                },
                title: "Continental"),
            const MenuContentDivider(),
            MenuContent(
                onTap: () {
                  _isAddTapped = false;
                  _scrollToSection(_nonVegKey);

                  setState(() {});
                },
                title: "Non-Veg"),
            const MenuContentDivider(),
            MenuContent(
                onTap: () {
                  _isAddTapped = false;
                  _scrollToSection(_breadsKey);
                  setState(() {});
                },
                title: "Breads"),
          ],
        ),
      ),
    );
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
