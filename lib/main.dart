import 'package:flutter/material.dart';
import 'package:pet_shop/screens/cart_screen.dart';
import 'package:pet_shop/screens/main_tabbar.dart';
import 'package:pet_shop/screens/product_detail_screen.dart';
import 'package:pet_shop/screens/product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainTabBarScreen(),
      routes: <String, WidgetBuilder>{
        CartScreen.screenName: (BuildContext context) => CartScreen(),
        ProductScreen.screenName: (BuildContext context) => ProductScreen(),
        ProductDetailScreen.screenName: (BuildContext context) =>
            ProductDetailScreen(),
      },
    );
  }
}
