import 'package:catalog_app/models/Cart.dart';
import 'package:catalog_app/models/Catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class My_Store extends VxStore
{
  late CatalogModel catalogModel;
  late Cart_Model cart_model;

  My_Store()
  {
    catalogModel = CatalogModel();
    cart_model = Cart_Model();
    cart_model.catalogModel = catalogModel;
  }
}