import 'package:catalog_app/models/Catalog.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget
{
  final CatalogItem catalogItem;

  const ProductWidget({super.key, required this.catalogItem,}) : assert(catalogItem != null);
  // const ProductWidget({Key key, required this.catalogItem}) : super(key: key);

  @override
  Widget build(BuildContext buildContext)
  {
    return Card(
     // elevation: 0.0,
      child: ListTile(
        onTap: (){
          // print("${catalogItem.itemName} Pressed");
        },
        leading: Image.network(catalogItem.itemImage),
        title: Text(catalogItem.itemName),
        subtitle: Text(catalogItem.itemDescription),
        trailing: Text("\$${catalogItem.itemPrice}",style: TextStyle( fontWeight: FontWeight.bold, color: Colors.deepPurple, ), textScaleFactor: 2.0,),
      ),
    );
  }
}