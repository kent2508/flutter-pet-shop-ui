import 'package:flutter/material.dart';
import 'package:pet_shop/core/foods.dart';
import 'package:pet_shop/core/product_categories.dart';
import 'package:pet_shop/models/cart_model.dart';
import 'package:pet_shop/screens/cart_screen.dart';
import 'package:pet_shop/widget/widgets.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({Key? key}) : super(key: key);

  static String screenName = '/product_screen';

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            _renderSliverAppBar(context),
            SliverToBoxAdapter(
              child: SectionView(title: 'Category'),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
                height: 146.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      category: categories[index],
                      lastItem: (index == (categories.length - 1)),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SectionView(
                  title: 'Best seller',
                  showAction: true,
                  onAction: () {
                    // on Show All button
                    print('show all');
                  }),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 12.0, bottom: 24.0),
                child: Row(
                  children: [
                    ProductCard(product: foods[0]),
                    const SizedBox(width: 16),
                    ProductCard(product: foods[1]),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SectionView(
                  title: 'You may like',
                  showAction: true,
                  onAction: () {
                    // on Show All button
                    print('show all');
                  }),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 12.0, bottom: 24.0),
                child: Row(
                  children: [
                    ProductCard(product: foods[2]),
                    const SizedBox(width: 16),
                    ProductCard(product: foods[3]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderSliverAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      pinned: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: SearchBar(),
      actions: [
        Stack(
          children: [
            IconButton(
                onPressed: () {
                  Cart.shared.cartItems = [
                    CartModel(foods[0], 2),
                    CartModel(foods[1], 3),
                    CartModel(foods[2], 4),
                  ];
                  Navigator.pushNamed(context, CartScreen.screenName);
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.blueGrey,
                )),
            Positioned(
              top: 4.00,
              right: 8.0,
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                width: 18,
                height: 18,
                child: Center(
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
