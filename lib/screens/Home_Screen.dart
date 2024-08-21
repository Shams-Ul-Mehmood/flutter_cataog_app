import 'package:catalog_app/core/Store.dart';
import 'package:catalog_app/models/Cart.dart';
import 'package:catalog_app/models/Catalog.dart';
import 'package:catalog_app/utils/Our_Screens_Routes.dart';
import 'package:catalog_app/widgets/Catalog_Themes.dart';
import 'package:catalog_app/widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import '../widgets/ProductWidget.dart';
import '../widgets/home_widgets/Catalog_Header.dart';
import '../widgets/home_widgets/Catalog_List.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userNameFromLoginScreen;
  // final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  // var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async
  {
     await Future.delayed(Duration(seconds: 4));

      final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
     //  // final response = await http.get( Uri.parse("https://fakestoreapi.com/products/1/") );
     // final response = await http.get( Uri.parse("https://api.escuelajs.co/api/v1/products", hashCode) );
     //  final catalogJson = response.body.toString();
    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;
     // print(catalogJson);
     final decodedData = jsonDecode(catalogJson);
    // print(decodedData);
    var productsData = decodedData["products"];
    // print(productsData);
    // List<CatalogItem> catalogItemsList = List.from(productsData).map<CatalogItem>((item) => CatalogItem.fromMap(item)).toList();
     CatalogModel.products = List.from(productsData).map<CatalogItem>((item) => CatalogItem.fromMap(item)).toList();
     setState(() {});
  }

  @override
  Widget build(BuildContext buildContext)
  {
   // final dummyProductsList = List.generate(100, (index) => CatalogModel.products[0]);
     final _cart = (VxState.store as My_Store).cart_model;
    return Scaffold(
      primary: true,
       backgroundColor: Catalog_Themes.creamColor,
      // backgroundColor: Catalog_Themes.darkCreamColor,
      // backgroundColor: Catalog_Themes.lightBlueColor,
      // backgroundColor: buildContext.cardColor,
      // backgroundColor: context.canvasColor,
      // backgroundColor: Theme.of(context).cardColor,
      floatingActionButton: VxConsumer(
        mutations: {AddMutation, RemoveMutation},
        notifications: {},
        builder: (context, store, status) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed( context, ScreensRoutes.cartRoute ),
          child: FaIcon(FontAwesomeIcons.cartShopping, color: Colors.white,),
           backgroundColor: Catalog_Themes.darkBlueColor,
          // backgroundColor: Catalog_Themes.lightBlueColor,
        ).badge(color: Vx.green600, size: 20, count: _cart.items.length, textStyle: TextStyle( fontWeight: FontWeight.bold, color: Colors.white, )),
      ),
      // appBar: AppBar(
      //   title: Text("Home Screen", softWrap: true, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
      // ),
      body:

        // Method-A.

        // Padding(
        // padding: const EdgeInsets.all(18.0),
        // child:
            // First-Method.
        // (CatalogModel.products != null && CatalogModel.products!.isNotEmpty)? ListView.builder(
        //   itemCount: CatalogModel.products!.length,
        //   itemBuilder: (buildContext, index){
        //     return ProductWidget(catalogItem: CatalogModel.products![index],);
        //   },
        // ) : Center(
        //   child: CircularProgressIndicator(),
        // ),

        // Second-Method.

      //   (CatalogModel.products != null && CatalogModel.products!.isNotEmpty)? GridView.builder(
      //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
      //       itemBuilder: (context, index){
      //         final item = CatalogModel.products![index];
      //         return Card(
      //             child: GridTile(
      //               child: Image.network(item.itemImage),
      //               header: Container(
      //                   child: Text( item.itemName, style: TextStyle( color: Colors.white, ), ),
      //                   padding: const EdgeInsets.all(8),
      //                   decoration: BoxDecoration(
      //                     color: Colors.deepPurple,
      //                   ),
      //               ),
      //               //footer: Text( "\$${item.itemPrice}" ),
      //               footer: Container(
      //                   padding: const EdgeInsets.all(8),
      //                   child: Text( '\$${item.itemPrice.toString()}', style: TextStyle( color: Colors.white, ), ),
      //                   decoration: BoxDecoration(
      //                     color: Colors.deepPurple,
      //                   ),
      //               ),
      //             ),
      //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //           clipBehavior: Clip.antiAlias,
      //         );
      //       },
      //     itemCount: CatalogModel.products!.length,
      //   )
      //       : Center(
      //     child: CircularProgressIndicator(),
      //   ),
      // ),
      // drawer: DrawerWidget(),

      // Method-B.

      SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Catalog_Header(),
              if( CatalogModel.products != null && CatalogModel.products!.isNotEmpty )
                Catalog_List().py16().expand()
              else
                CircularProgressIndicator().centered().py16().expand(),
            ],
          ),
        ),
      ),

    );
  }
}
