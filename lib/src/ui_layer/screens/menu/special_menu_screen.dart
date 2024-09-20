import 'package:flutter/material.dart';
import 'package:grarri/src/business_layer/providers/cart_provider.dart';
import 'package:grarri/src/data_layer/model/model.dart';
import 'package:grarri/src/data_layer/res/res.dart';
import 'package:grarri/src/ui_layer/screens/menu/widgets/menu_item_card.dart';
import 'package:grarri/src/ui_layer/widgets/custom_expansion_widget.dart';
import 'package:provider/provider.dart';

class SpecialMenuScreen extends StatelessWidget {
  const SpecialMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    final List<FoodItem> pizzas = [
      FoodItem(
          name: 'Margherita Pizza',
          image:
              'https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141352.jpg',
          price: 350.00,
          isVeg: true),
      FoodItem(
          name: 'Pepperoni Pizza',
          image:
              'https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141352.jpg',
          price: 450.00,
          isVeg: false),
      FoodItem(
          name: 'BBQ Chicken Pizza',
          image:
              'https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141352.jpg',
          price: 490.00,
          isVeg: false),
      FoodItem(
          name: 'Veggie Delight Pizza',
          image:
              'https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141352.jpg',
          price: 370.00,
          isVeg: true),
    ];

    final List<FoodItem> pastas = [
      FoodItem(
          name: 'Pasta Alfredo with Bread',
          image:
              'https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141352.jpg',
          price: 300.00,
          isVeg: true),
      FoodItem(
          name: 'Bow Tie Pasta (Farfalle) with Bread - Creamy',
          image:
              'https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141352.jpg',
          price: 280.00,
          isVeg: true),
      FoodItem(
          name: 'Chicken Carbonara',
          image:
              'https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141352.jpg',
          price: 450.00,
          isVeg: false),
      FoodItem(
          name: 'Penne Primavera',
          image:
              'https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141352.jpg',
          price: 320.00,
          isVeg: true),
    ];
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
              padding: AppStyles.pd16,
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
