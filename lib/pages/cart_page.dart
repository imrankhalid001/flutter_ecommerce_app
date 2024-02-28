


import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/components/my_button.dart';
import 'package:flutter_ecommerce_app/models/product.dart';
import 'package:flutter_ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

// remove item from cart method 

remoteItemFromCart(BuildContext context, product product) {

// show dialogue box to ask user to confirm to remove from cart

showDialog(context: context
, builder: (context) => AlertDialog(
  content: const Text("Remove this item from your cart?"),
  actions: [
// cancel button 

MaterialButton(
  onPressed: () => Navigator.pop(context),
child: Text("Cancel"),
),
// yes button
MaterialButton(
  onPressed: () {

    // pop dialogue box
  Navigator.pop(context);
// add to cart funtion 
context.read<Shop>().remoFromCart(product);

},
child: Text("Yes"),

)

  ],
),);
}

// user click on paybutton 
void payButtonPressed(BuildContext context)
{

showDialog(
  context: context, 
  builder: (context) => AlertDialog(

    content: Text("User wants to pay! Connect this app to your payment backend"),

  ) ,
  
  );


}





  @override
  Widget build(BuildContext context) {

    final cart = context.watch<Shop>().cart;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text('Cart page',
        style: TextStyle(
          color: Colors.black
        ),),
      ),

      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // cart list
          Expanded(
            child: cart.isEmpty ?
            const Center(child: Text("your cart is empty "))
            : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index){
                // get individual item in cart
                final item = cart[index];
                //  reutrn as a cart tile UI
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    icon:Icon(Icons.remove),
                    onPressed: () => remoteItemFromCart(context, item) ,
                     ),
                );
              },
            ),
          ),


          // pay button

          Padding(
            padding: const EdgeInsets.all(50),
            child: MyButton(onTap:() => payButtonPressed(context),
              child: Text("Pay Now")
              ),
          )



        ],
      ),
      
    );
  }
}
