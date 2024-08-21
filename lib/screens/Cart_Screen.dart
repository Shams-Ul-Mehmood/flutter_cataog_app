import 'package:catalog_app/models/Cart.dart';
import 'package:catalog_app/widgets/Catalog_Themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/Store.dart';

class Cart_Screen extends StatelessWidget {
  const Cart_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Catalog_Themes.creamColor,
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _Cart_List().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    // final _cart = Cart_Model();
    final Cart_Model _cart = (VxState.store as My_Store).cart_model;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // 1st-Method.

          // '\$${_cart.totalPrice}'.text.xl5.color(context.theme.appBarTheme.foregroundColor).make(),

          // 2nd-Method.

          VxConsumer(
            mutations: {RemoveMutation},
            notifications: {},
            builder: (context, store, status) => '\$${_cart.totalPrice}'.text.xl5.color(context.theme.appBarTheme.foregroundColor).make(),
          ),


          // 3rd-Method.

          // VxBuilder(builder: (context, store, status) {
          //   return '\$${_cart.totalPrice}'.text.xl5.color(context.theme.appBarTheme.foregroundColor).make();
          // }, mutations: {RemoveMutation},
          // ),

          30.widthBox,
          ElevatedButton(
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not supported yet.".text.make()));
              },
              child: "Buy".text.white.make(),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(context.theme.primaryColor)),
          ).w32(context),
        ],
      ),
    );
  }
}

/*class _Cart_List extends StatefulWidget {
  const _Cart_List({super.key});

  @override
  State<_Cart_List> createState() => _Cart_ListState();
}

class _Cart_ListState extends State<_Cart_List> {
  final _cart = Cart_Model();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty? "Nothing to show".text.xl3.makeCentered() : ListView.builder(
        itemCount: _cart.items?.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: Icon(Icons.done),
            trailing: IconButton(
              icon: Icon( Icons.remove_circle_outline ),
              onPressed: (){
                _cart.removeItem(_cart.items[index]);
                setState(() {});
              },
            ),
            title: _cart.items[index].itemName.text.make(),
          );
        },
    );
  }
}*/

// OR

class _Cart_List extends StatelessWidget{
  // final _cart = Cart_Model();
  @override
  Widget build(BuildContext buildContext) {

    VxState.watch(buildContext, on: [RemoveMutation]);

    final Cart_Model _cart = (VxState.store as My_Store).cart_model;

    return _cart.items.isEmpty? "Nothing to show".text.xl3.makeCentered() : ListView.builder(
      itemCount: _cart.items?.length,
      itemBuilder: (context, index){
        return ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon( Icons.remove_circle_outline ),
            onPressed: (){
              // _cart.removeItem(_cart.items[index]);
              RemoveMutation(product: _cart.items[index]);
            },
          ),
          title: _cart.items[index].itemName.text.make(),
        );
      },
    );
  }
}
