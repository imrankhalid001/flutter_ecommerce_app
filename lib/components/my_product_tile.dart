

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/product.dart';
import 'package:flutter_ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final product Product;


  const MyProductTile({super.key,
  required this.Product
  });

// add to cart button pressed

void addToCart(BuildContext context)
{
// show dialogue box to ask user to confirm to add to cart

showDialog(context: context
, builder: (context) => AlertDialog(
  content: Text("Add this item to your cart?"),
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
context.read<Shop>().addToCart(Product);

},
child: Text("Yes"),

)

  ],
),);


}





  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12)
      ),

      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  // product image

          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              width: double.infinity,
              padding: EdgeInsets.all(25),
              child: Image.asset(Product.imagePath),
              ),
          ),

          SizedBox(height: 25,),


          // product name 
          Text(
            Product.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            ),

          // product description
          Text(Product.description,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          )
          ),

            ],
          ),
          
          SizedBox(height: 25,),

          // product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // product price

              Text('\$'+Product.price.toStringAsFixed(2)),

              // add to cart button 

              Container(
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: ()=> addToCart(context),
                   icon: Icon(Icons.add,
                
                   ),
                   ),
              )


            ],
          ),


        ],
      ),
    );
  }
}