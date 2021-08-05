import 'package:flutter/material.dart';
import 'package:pet_shop/core/foods.dart';
import 'package:pet_shop/core/pets.dart';
import 'package:pet_shop/models/cart_model.dart';
import 'package:pet_shop/screens/cart_screen.dart';
import 'package:pet_shop/screens/product_screen.dart';
import 'package:pet_shop/widget/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                  itemCount: pets.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      category: pets[index],
                      lastItem: (index == (pets.length - 1)),
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
                    Navigator.pushNamed(context, ProductScreen.screenName);
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
                  title: 'Special deal',
                  showAction: true,
                  onAction: () {
                    // on Show All button
                    print('show all');
                  }),
            ),
            SliverToBoxAdapter(
              child: _renderSpecialDeal(context),
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

  Widget _renderSpecialDeal(BuildContext context) {
    final bgImageWidth = MediaQuery.of(context).size.width - 16 * 3;
    final bgImageHeight = bgImageWidth * 180 / 343;
    final topMarginOfSaleProduct = bgImageHeight * 34 / 180;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Stack(
        children: [
          Image.asset('assets/images/deals/deal_1_0.png'),
          Positioned(
              top: topMarginOfSaleProduct,
              left: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/deals/deal_1_1.png',
                    width: 113.0 * bgImageWidth / 343,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'SALE 20%',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF8D3A17)),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
