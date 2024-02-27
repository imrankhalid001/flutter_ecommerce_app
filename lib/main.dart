import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/shop.dart';
import 'package:flutter_ecommerce_app/pages/cart_page.dart';
import 'package:flutter_ecommerce_app/pages/intro_page.dart';
import 'package:flutter_ecommerce_app/pages/shop_page.dart';
import 'package:flutter_ecommerce_app/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
   ChangeNotifierProvider(create: (context)=> Shop(),
    child: const MyApp(),)
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightmode,
      home: const IntroPage(),

      routes: {
        '/intro_page': (context)=> const IntroPage(),
        '/shop_page': (context)=> const ShopPage(),
           '/cart_page': (context)=> const CartPage(),
      },
    );
  }
}