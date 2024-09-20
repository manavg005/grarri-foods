import 'package:flutter/material.dart';
import 'package:grarri/src/business_layer/providers/cart_provider.dart';
import 'package:grarri/src/data_layer/model/model.dart';
import 'package:grarri/src/data_layer/res/res.dart';
import 'package:grarri/src/ui_layer/widgets/common_buttons.dart';
import 'package:grarri/src/ui_layer/widgets/image_widgets.dart';

class MenuItemListCard extends StatelessWidget {
  const MenuItemListCard({
    super.key,
    required this.item,
    required this.cartProvider,
  });

  final FoodItem item;
  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppStyles.pdH16V8,
      padding: AppStyles.pd8,
      decoration: AppDecorations.innerBoxDecoration,
      child: Row(
        children: [
          if (item.image.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.image,
                height: 71.height,
                width: 71.width,
                fit: BoxFit.cover,
              ),
            ),
          if (item.image.isNotEmpty) 19.sbWidth,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  style: AppStyles.ubuntuTextStyle(fontSize: 16),
                ),
                8.sbHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgImageWidget(
                          imagePath: AppImages.veg,
                          color: item.isVeg ? null : AppColors.red,
                        ),
                        8.sbWidth,
                        Text(
                          "₹${item.price}",
                          style: AppStyles.ubuntuTextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    (cartProvider.getItemCount(item) == 0)
                        ? InkWell(
                            onTap: () {
                              cartProvider.addItem(item);
                            },
                            child: const CommonAddButton())
                        : CommonAddRemoveButton(
                            items: cartProvider.getItemCount(item),
                            onTapAdd: () => cartProvider.addItem(item),
                            onTapRemove: () => cartProvider.removeItem(item))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItemGridCard extends StatelessWidget {
  const MenuItemGridCard({
    super.key,
    required this.item,
    required this.cartProvider,
  });

  final FoodItem item;
  final CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.innerBoxDecoration,
      child: Column(
        children: [
          if (item.image.isNotEmpty)
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                item.image,
                height: 128.height,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          Container(
            // color: Color.fromRGBO(246, 246, 246, 1),
            padding: AppStyles.pd8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgImageWidget(
                      imagePath: AppImages.veg,
                      color: item.isVeg ? null : AppColors.red,
                    ),
                    8.sbWidth,
                    Expanded(
                      child: Text(
                        item.name,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.fSize,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppFonts.ubuntu,
                          color: AppColors.gray74,
                        ),
                      ),
                    ),
                  ],
                ),
                15.sbHeight,
                Row(
                  children: [
                    Text(
                      "₹${item.price}",
                      style: AppStyles.ubuntuTextStyle(fontSize: 16),
                    ),
                    const Spacer(),
                    (cartProvider.getItemCount(item) == 0)
                        ? InkWell(
                            onTap: () {
                              cartProvider.addItem(item);
                            },
                            child: const CommonAddButton())
                        : CommonAddRemoveButton(
                            items: cartProvider.getItemCount(item),
                            onTapAdd: () => cartProvider.addItem(item),
                            onTapRemove: () => cartProvider.removeItem(item))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
