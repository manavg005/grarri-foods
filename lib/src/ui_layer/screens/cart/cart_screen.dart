import 'package:flutter/material.dart';
import 'package:grarri/src/business_layer/providers/cart_provider.dart';
import 'package:grarri/src/data_layer/model/model.dart';
import 'package:grarri/src/data_layer/res/res.dart';
import 'package:grarri/src/ui_layer/widgets/common_buttons.dart';
import 'package:grarri/src/ui_layer/widgets/custom_expansion_widget.dart';
import 'package:grarri/src/ui_layer/widgets/image_widgets.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: _cartAppBarWidget(context),
      body: Column(
        children: [
          Expanded(
            // Wrap with Expanded to take available space
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomExpansionTile(
                    title: "Current order",
                    child: _currentOrderWidget(cartProvider),
                  ),
                  // Adding this ensures only the list below scrolls
                  _previousOrdersWidget(cartProvider),
                ],
              ),
            ),
          ),
          if (cartProvider.getTotalItemCount() > 0)
            _placeOrderButton(context, cartProvider), // Place order at bottom
        ],
      ),
    );
  }

  Widget _currentOrderWidget(CartProvider cartProvider) {
    return cartProvider.getTotalItemCount() == 0
        ? const SizedBox.shrink()
        : Container(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 16),
            margin: AppStyles.pd8,
            decoration: AppDecorations.innerBoxDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cartProvider.items.length,
                  itemBuilder: (context, index) {
                    FoodItem item = cartProvider.items.values.toList()[index];
                    return Row(
                      children: [
                        SvgImageWidget(
                          imagePath: AppImages.veg,
                          color: item.isVeg ? null : AppColors.red,
                        ),
                        8.sbWidth,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _itemNameText(item),
                              4.sbHeight,
                              _itemPriceText(item),
                            ],
                          ),
                        ),
                        _addRemoveButton(cartProvider, item),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return index == cartProvider.items.length - 1
                        ? const SizedBox.shrink()
                        : 24.sbHeight;
                  },
                ),
                // 24.sbHeight,
                _addCookingInstructionTextWidget()
              ],
            ),
          );
  }

  Widget _placeOrderButton(BuildContext context, CartProvider cartProvider) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          _placeOrder(context, cartProvider);
        },
        child: Container(
          margin: AppStyles.pd8,
          padding: const EdgeInsets.only(left: 16, right: 8, bottom: 8, top: 8),
          decoration: BoxDecoration(
              gradient: AppDecorations.blueBackgroundGradient,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Text(
                "${cartProvider.getTotalItemCount()} Items",
                style: AppStyles.ubuntuTextStyle(
                    fontSize: 12, color: AppColors.white),
              ),
              const Spacer(),
              Text(
                "PLACE ORDER",
                style: AppStyles.ubuntuTextStyle(
                    fontSize: 13,
                    color: AppColors.white,
                    fontWeight: FontWeight.w700),
              ),
              8.sbWidth,
              Container(
                height: 28,
                width: 28,
                decoration: AppDecorations.placeOrderButtonDecoration,
                child: const SvgImageWidget(imagePath: AppImages.arrowRight),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _previousOrdersWidget(CartProvider cartProvider) {
    return CustomExpansionTile(
      initiallyExpanded: false,
      title: "Previous orders",
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // Keep this static
        itemCount: cartProvider.previousOrders.length > 20
            ? 20
            : cartProvider.previousOrders.length,
        itemBuilder: (context, index) {
          final order = cartProvider.previousOrders.reversed.toList()[index];
          return Container(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
            margin: AppStyles.pd8,
            decoration: AppDecorations.innerBoxDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: order.map((foodItem) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            SvgImageWidget(
                              imagePath: AppImages.veg,
                              color: foodItem.isVeg ? null : AppColors.red,
                            ),
                            8.sbWidth,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _itemNameText(foodItem),
                                  4.sbHeight,
                                  _itemPriceText(foodItem),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 39),
                              child: Text(
                                '${foodItem.quantity}',
                                style: TextStyle(
                                  fontSize: 13.fSize,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppFonts.ubuntu,
                                  color: AppColors.gray74,
                                ),
                              ),
                            )
                            // _addRemoveButton(cartProvider, foodItem),
                          ],
                        ),
                        24.sbHeight,
                      ],
                    );
                  }).toList(),
                ),
                _addCookingInstructionTextWidget()
              ],
            ),
          );
        },
      ),
    );
  }

  void _placeOrder(BuildContext context, CartProvider cartProvider) {
    final currentOrder = cartProvider.getCurrentOrder();
    cartProvider.addOrder(currentOrder);
    cartProvider.clearCart();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Order placed successfully!'),
      ),
    );

    Navigator.pop(context);
  }

  Widget _addCookingInstructionTextWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Text(
        "Add cooking instruction",
        style: TextStyle(
          fontSize: 12.fSize,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          color: AppColors.selectedLabelText,
        ),
      ),
    );
  }

  PreferredSizeWidget _cartAppBarWidget(BuildContext context) {
    return AppBar(
      title: Text(
        "PLACE ORDER",
        style: AppStyles.ubuntuTextStyle(fontSize: 20, color: AppColors.gray74),
      ),
      centerTitle: false,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: CommonButton(imagePath: AppImages.arrowLeft),
        ),
      ),
      leadingWidth: 50,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: CommonButton(imagePath: AppImages.info),
        )
      ],
    );
  }

  Widget _addRemoveButton(CartProvider cartProvider, FoodItem item) {
    return CommonAddRemoveButton(
        items: cartProvider.getItemCount(item),
        onTapAdd: () => cartProvider.addItem(item),
        onTapRemove: () => cartProvider.removeItem(item));
  }

  Widget _itemPriceText(FoodItem item) {
    return Text(
      "₹${item.price}",
      style: AppStyles.ubuntuTextStyle(
        fontSize: 12,
        color: AppColors.gray74,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _itemNameText(FoodItem item) {
    return Text(
      item.name,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      maxLines: 2,
      style: AppStyles.ubuntuTextStyle(
        fontSize: 14,
        color: AppColors.gray74,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
