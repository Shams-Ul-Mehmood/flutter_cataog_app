import 'package:catalog_app/models/Cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/Catalog.dart';
import '../../widgets/Catalog_Themes.dart';
import 'Add_To_Cart.dart';
import 'Catalog_Images.dart';

class Catalog_Element extends StatelessWidget {
  final CatalogItem catalogItem;

  const Catalog_Element({super.key, required this.catalogItem}) : assert(catalogItem != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: context.isMobile ? Row(
          children: [
            Hero(
                tag: Key(catalogItem.itemId.toString()),
                child: Catalog_Images(image: catalogItem.itemImage)),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                catalogItem.itemName.text.xl.color(Catalog_Themes.darkBlueColor).bold.make(),
                catalogItem.itemDescription.text.textStyle(context.captionStyle).make(),
                10.heightBox, // for spacing
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalogItem.itemPrice}".text.bold.xl.make(),
                    AddToCart(catalogItem: catalogItem,),
                  ],
                ).pOnly(right: 4.0),
              ],
            ).p(context.isMobile? 0 : 16),
            ),
          ],
        ) : Row(
          children: [
            Hero(
                tag: Key(catalogItem.itemId.toString()),
                child: Catalog_Images(image: catalogItem.itemImage)),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                catalogItem.itemName.text.xl.color(Catalog_Themes.darkBlueColor).bold.make(),
                catalogItem.itemDescription.text.textStyle(context.captionStyle).make(),
                10.heightBox, // for spacing
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalogItem.itemPrice}".text.bold.xl.make(),
                    AddToCart(catalogItem: catalogItem,),
                  ],
                ).pOnly(right: 4.0),
              ],
            ).p(context.isMobile? 0 : 16),
            ),
          ],
        )
    ).white.roundedLg.square(150).make().py16();
  }
}