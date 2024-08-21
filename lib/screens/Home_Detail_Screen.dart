import 'package:catalog_app/models/Catalog.dart';
import 'package:catalog_app/widgets/Catalog_Themes.dart';
import 'package:catalog_app/widgets/home_widgets/Add_To_Cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailScreen extends StatelessWidget {
  final CatalogItem catalogItem;

  const HomeDetailScreen({super.key, required this.catalogItem}) : assert( catalogItem != null );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalogItem.itemPrice}".text.bold.xl4.red800.make(),
            AddToCart(catalogItem: catalogItem).wh(120, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalogItem.itemId.toString()),
                child: Image.network( catalogItem.itemImage ),
            ).h32(context),
            Expanded(child: VxArc(
              height: 30.0,
              edge: VxEdge.top,
              arcType: VxArcType.convey,
              child: Container(
               color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalogItem.itemName.text.xl4.color(context.accentColor).bold.make(),
                    catalogItem.itemDescription.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox,
                    "IPhone mobile pro is handset, this is very cheap and it is very latest iphone product, this product available with affordable price. IPhone mobile pro is handset, this is very cheap and it is very latest iphone product, this product available with affordable price. iPhone mobile pro is handset, this is very cheap and it is very latest iphone product, this product available with affordable price. iPhone mobile pro is handset, this is very cheap and it is very latest iphone product, this product available with affordable price."
                        .text.textStyle(context.captionStyle)
                        .make().p16(),
                  ],
                ).py64(),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
