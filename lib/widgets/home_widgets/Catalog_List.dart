import 'package:catalog_app/screens/Home_Detail_Screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/Catalog.dart';
import 'Catalog_Element.dart';

class Catalog_List extends StatelessWidget
{
  @override
  Widget build(BuildContext buildContext)
  {
    return !buildContext.isMobile? GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20.0),
      itemBuilder: (buildContext, index) {
        final catalogItemsList = CatalogModel.products![index];
        // final catalogItemsList = CatalogModel.getProductByLocation(index);

        return InkWell( onTap: () => Navigator.push( buildContext, MaterialPageRoute(builder: (buildContext) => HomeDetailScreen(catalogItem: catalogItemsList),), ), child: Catalog_Element( catalogItem: catalogItemsList ));
      },
      itemCount: CatalogModel.products!.length,
      shrinkWrap: true,
    ) : ListView.builder(
      itemBuilder: (buildContext, index) {
        final catalogItemsList = CatalogModel.products![index];
        // final catalogItemsList = CatalogModel.getProductByLocation(index);

        return InkWell( onTap: () => Navigator.push(
          buildContext,
          MaterialPageRoute(builder: (buildContext) => HomeDetailScreen(catalogItem: catalogItemsList),), ),
            child: Catalog_Element( catalogItem: catalogItemsList ));
      },
      itemCount: CatalogModel.products!.length,
      shrinkWrap: true,
    );
  }
}