
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/components/my_drawer.dart';
import 'package:flutter_ecommerce_app/components/my_product_tile.dart';
import 'package:flutter_ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';


class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {

    // access product in shop 
    final products = context.watch<Shop>().shop;



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text('Shop page'),
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,

      body: ListView(
        children: [
          // shop subtitle

        Center(
          child: Text("Pick from selected list of premium products",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary
          ),
          ),
        ), 




          // product list 

           SizedBox(
        height: 550,
        child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(15),
          itemBuilder:(context, index) {
            // get each product from the shop
            final product = products[index];
        
        
            // return as a product tile UI
            return MyProductTile(Product: product);
          }),
      ),


        ],
      )
      
     
    );
  }
}