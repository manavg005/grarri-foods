import 'package:flutter/material.dart';
import 'package:grarri/src/business_layer/providers/cart_provider.dart';
import 'package:grarri/src/data_layer/list_file.dart';
import 'package:grarri/src/data_layer/res/res.dart';
import 'package:grarri/src/ui_layer/screens/menu/widgets/menu_item_card.dart';
import 'package:grarri/src/ui_layer/widgets/custom_expansion_widget.dart';
import 'package:provider/provider.dart';

class SpecialMenuScreen extends StatelessWidget {
  const SpecialMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: AppStyles.pd17,
            padding: AppStyles.pd4,
            width: double.infinity,
            height: 130.height,
            decoration: AppDecorations.outerBoxDecoration,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      // color: Colors.black,
                      gradient: AppDecorations.lightGreyGradiant,
                      backgroundBlendMode: BlendMode.luminosity,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Positioned.fill(
                    top: 65,
                    left: 12,
                    child: Text(
                      "Welcome to \nSunrise Cafe",
                      style: AppStyles.ubuntuTextStyle(
                          fontSize: 16,
                          color: AppColors.white,
                          height: onePointTwo),
                    ))
              ],
            ),
          ),
          CustomExpansionTile(
            title: "Today's Special",
            child: GridView.builder(
              padding: AppStyles.pdH16,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in grid
                crossAxisSpacing: 8.width, // Spacing between columns
                mainAxisSpacing: 16, // Spacing between rows
                childAspectRatio: 0.9, // Ratio of item width to height
              ),
              itemCount: pizzas.length,
              itemBuilder: (context, index) {
                final item = pizzas[index];

                return MenuItemGridCard(item: item, cartProvider: cartProvider);
              },
            ),
          ),
          CustomExpansionTile(
            title: "Dish of the week",
            child: LargeMenuCard(
                dishOfTheWeek: dishOfTheWeek.first, cartProvider: cartProvider),
          ),
          CustomExpansionTile(
            title: "Recommended",
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: pastas.length,
              itemBuilder: (context, index) {
                final item = pastas[index];

                return MenuItemListCard(item: item, cartProvider: cartProvider);
              },
            ),
          )
        ],
      ),
    );
  }
}
