
import 'dart:convert';

class CatalogItem
{
  int itemId;
  final String itemName;
  final String itemDescription;
  final String itemColor;
  final String itemImage;
  final num itemPrice;

  CatalogItem( { required this.itemId, required this.itemName, required this.itemDescription, required this.itemColor, required this.itemImage, required this.itemPrice } );

  CatalogItem copyWith({ required int itemId, required String itemName, required String itemDescription, required String itemColor, required String itemImage, required num itemPrice })
  {
    return CatalogItem( itemId: itemId ?? this.itemId, itemName: itemName ?? this.itemName, itemDescription: itemDescription ?? this.itemDescription, itemColor: itemColor ?? this.itemColor, itemImage: itemImage ?? this.itemImage, itemPrice: itemPrice ?? this.itemPrice);
  }

  // 1st Method of toMap();
  Map<String, dynamic> toMap()
  {
    return { 'itemId' : itemId, 'itemName' : itemName, 'itemDescription' : itemDescription, 'itemColor' : itemColor, 'itemImage' : itemImage, 'itemPrice' : itemPrice };
  }

  // 2nd Method of toMap();

  // toMap() => {
  //   "id" : itemId,
  //   "name" : itemName,
  //   "description" : itemDescription,
  //   "color" : itemColor,
  //   "image" : itemImage,
  //   "price" : itemPrice,
  // };


  // 1st Method for Decode.
  factory CatalogItem.fromMap(Map<dynamic,dynamic> map)=> CatalogItem(
    itemId: map["id"],
    itemName: map["name"],
    itemDescription: map["description"],
    itemColor: map["color"],
    itemImage: map["image"],
    itemPrice: map["price"],
  );

  // 2nd Method for Decode.

  //  factory CatalogItem.fromMap(Map<String,dynamic> catalogItemsMap)
  // {
  //     return CatalogItem(
  //         itemId: catalogItemsMap["itemId"],
  //         itemName: catalogItemsMap['itemName'],
  //         itemDescription: catalogItemsMap["itemDescription"],
  //         itemColor: catalogItemsMap["itemColor"],
  //         itemImage: catalogItemsMap['itemImage'],
  //         itemPrice: catalogItemsMap["itemPrice"],
  //     );
  // }

  String toJson() => json.encode(toMap());
  factory CatalogItem.fromJson(String source) => CatalogItem.fromMap(json.decode(source));

  @override
  String toString()
  {
    return "CatalogItem(itemId : $itemId, itemName : $itemName, itemDescription : $itemDescription, itemColor : $itemColor, itemImage : $itemImage, itemPrice : $itemPrice)";
  }

  @override
  bool operator == (Object object)
  {
    if( identical(this, object) ) return true;

    return object is CatalogItem && object.itemId == itemId && object.itemName == itemName && object.itemDescription == itemDescription && object.itemColor == itemColor && object.itemImage == itemImage && object.itemPrice == itemPrice;
  }

  @override
  int get hashCode{
    return itemId.hashCode ^ itemName.hashCode ^ itemDescription.hashCode ^ itemColor.hashCode ^ itemImage.hashCode ^ itemPrice.hashCode;
  }

}

class CatalogModel
{
  // 1st-Method.

  // static List<CatalogItem> products = [
  //   CatalogItem(
  //       itemId: 1,
  //       itemName: "iPhone 12 Pro",
  //       itemDescription: "Apple iPhone 12th generation",
  //       itemColor: "#33505a",
  //       itemImage: "https://regen.pk/cdn/shop/products/iphone-12-364028_91435cf4-a70c-419e-bf4b-c4878df680eb.jpg?v=1686390191",
  //       itemPrice: 999),
    // CatalogItem(
    //     itemId: 1,
    //     itemName: "iPhone 12 Pro",
    //     itemDescription: "Apple iPhone 12th generation",
    //     itemColor: "#33505a",
    //     itemImage: "https://regen.pk/cdn/shop/products/iphone-12-364028_91435cf4-a70c-419e-bf4b-c4878df680eb.jpg?v=1686390191",
    //     itemPrice: 999),
    // CatalogItem(
    //     itemId: 1,
    //     itemName: "iPhone 12 Pro",
    //     itemDescription: "Apple iPhone 12th generation",
    //     itemColor: "#33505a",
    //     itemImage: "https://regen.pk/cdn/shop/products/iphone-12-364028_91435cf4-a70c-419e-bf4b-c4878df680eb.jpg?v=1686390191",
    //     itemPrice: 999),
    // CatalogItem(
    //     itemId: 1,
    //     itemName: "iPhone 12 Pro",
    //     itemDescription: "Apple iPhone 12th generation",
    //     itemColor: "#33505a",
    //     itemImage: "https://regen.pk/cdn/shop/products/iphone-12-364028_91435cf4-a70c-419e-bf4b-c4878df680eb.jpg?v=1686390191",
    //     itemPrice: 999),
 // ];

    // 2nd-Method.

  // Code for current class ---> to make singlaton class.
  // Start From Here.
  /*
  static final catalogModel = CatalogModel._internal();
  CatalogModel._internal();
  factory CatalogModel() => catalogModel; */
  // End the Code Here.

  static List<CatalogItem>? products = [];

  // Get item by using their ID.
  // static CatalogItem getItemById( int itemId ) => products!.firstWhere((element) => element.itemId == itemId, orElse: null);
  CatalogItem getItemById( int itemId ) => products!.firstWhere((element) => element.itemId == itemId, orElse: null);
  // Get item by using their position.
  // static CatalogItem getProductByLocation( int location ) => products![location];
  CatalogItem getProductByLocation( int location ) => products![location];

}