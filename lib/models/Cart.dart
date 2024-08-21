import 'package:catalog_app/core/Store.dart';
import 'package:catalog_app/models/Catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart_Model
{
  // Code for current class ---> to make singlaton class.
  // Start From Here.
  /*
  static final cart_Model = Cart_Model._internal();
  Cart_Model._internal();
  factory Cart_Model() => cart_Model; */
  // End the Code Here.

  late CatalogModel _catalogModel;
  final List<int> _itemsIdsList = [];

  // Catalog-Getter Method or Function.
  CatalogModel get catalogModel => _catalogModel;

  // Catalog-Setter Method or Function.
  set catalogModel(CatalogModel catalog_Model)
  {
    assert(catalog_Model != null);
    _catalogModel = catalog_Model;
  }

  // Get Items in the cart by using items Function / Method.
  List<CatalogItem> get items => _itemsIdsList.map((id) => _catalogModel.getItemById( id )).toList();

  // Get total price of items in the cart by using totalPrice Function / Method.
  num get totalPrice => items.fold(0, (totalValue, currentValue) => currentValue.itemPrice + totalValue );

  // Add Items by using addItem Function.
  void addItem(CatalogItem catalogItem)
  {
    _itemsIdsList.add(catalogItem.itemId);
  }

  // Remove Items by using removeItem Function.
  void removeItem(CatalogItem catalogItem)
  {
    _itemsIdsList.remove(catalogItem.itemId);
  }
}

class AddMutation extends VxMutation<My_Store>
{
  final CatalogItem product;

  AddMutation({required this.product});

  @override
  perform() {
    store!.cart_model._itemsIdsList.add( product.itemId );
  }
}

class RemoveMutation extends VxMutation<My_Store>
{
  final CatalogItem product;

  RemoveMutation({required this.product});

  @override
  perform() {
    store!.cart_model._itemsIdsList.remove( product.itemId );
  }
}