import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/product.dart';

class Shop extends ChangeNotifier {

/// products for sale
final List<product> _shop = [
  // product 1
  product(
    name: "product 1", 
    price: 99.99, 
    description: "Product description Here will be more info like this to describe the product",
    //  imagePath: imagePath
     ),


       // product 2
  product(
    name: "product 2", 
    price: 99.99, 
    description: "Product description",
    //  imagePath: imagePath
     ),


       // product 3
  product(
    name: "product 3", 
    price: 99.99, 
    description: "Product description",
    //  imagePath: imagePath
     ),

       // product 4
  product(
    name: "product 4", 
    price: 99.99, 
    description: "Product description",
    //  imagePath: imagePath
     ),


];



// user cart 

List<product> _cart = [];


// get product list 

List<product> get shop => _shop;


// get user cart
List<product> get cart => _cart;



// add item to cart
void addToCart(product item)
{
  _cart.add(item);
  notifyListeners();
}


// remove item from cart
void remoFromCart(product item)
{
  _cart.remove(item);
    notifyListeners();

}





// final String name;
// final double price;
// final String description;
// final String imagePath;

// product({
//   required this.name,
//   required this.price,
//   required this.description,
//   required this.imagePath
// });

}
