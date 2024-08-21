import 'package:catalog_app/core/Store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/Cart.dart';
import '../../models/Catalog.dart';
import '../Catalog_Themes.dart';

/*
class AddToCart extends StatefulWidget
{
  final CatalogItem catalogItem;

  const AddToCart({super.key, required this.catalogItem});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {

  final _cart = Cart_Model();

  @override
  Widget build(BuildContext buildContext)
  {
    bool isItemAddedToCart = _cart.items.contains(widget.catalogItem) ?? false;
    return ElevatedButton(
      onPressed: (){
        if( !isItemAddedToCart ) {
          isItemAddedToCart = isItemAddedToCart.toggle();
          final _catalog = CatalogModel();
          _cart.catalogModel = _catalog;
          _cart.addItem(widget.catalogItem);
          setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Catalog_Themes.darkBlueColor)
      ),
      child: isItemAddedToCart ? Icon(Icons.done, color: Catalog_Themes.creamColor,) : Icon(CupertinoIcons.cart_fill_badge_plus, color: Catalog_Themes.creamColor,),
    );
  }
}*/

// OR

class AddToCart extends StatelessWidget
{
  final CatalogItem catalogItem;
 // final _cart = Cart_Model();

  AddToCart({super.key, required this.catalogItem});

  @override
  Widget build(BuildContext buildContext)
  {
    // VxState.listen(buildContext, to: []);
    // VxState.notify(VxDarkModeMutation(true));
    VxState.watch(buildContext, on: [AddMutation, RemoveMutation]);
    final Cart_Model _cart = (VxState.store as My_Store).cart_model;
   // final CatalogModel _catalogModel = (VxState.store as My_Store).catalogModel;

    bool isItemAddedToCart = _cart.items.contains(catalogItem) ?? false;
    return ElevatedButton(
      onPressed: (){
        if( !isItemAddedToCart ) {
         // isItemAddedToCart = isItemAddedToCart.toggle();
         // final _catalog = CatalogModel();
         // _cart.catalogModel = _catalogModel;
         // _cart.addItem(catalogItem);
          AddMutation(product: catalogItem);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Catalog_Themes.darkBlueColor)
      ),
      child: isItemAddedToCart ? Icon(Icons.done, color: Catalog_Themes.creamColor,) : Icon(CupertinoIcons.cart_fill_badge_plus, color: Catalog_Themes.creamColor,),
    );
  }
}

