import 'package:flutter/material.dart';
import 'package:pet_shop/core/color_palette.dart';
import 'package:pet_shop/core/foods.dart';
import 'package:pet_shop/models/cart_model.dart';
import 'package:pet_shop/models/product_model.dart';
import 'package:pet_shop/screens/cart_screen.dart';
import 'package:pet_shop/widget/widgets.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen({Key? key}) : super(key: key);

  static String screenName = '/product_detail_screen';

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    final ProductModel product = args['product'] as ProductModel;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            _renderSliverAppBar(product.brandName),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.white,
                    child: Image.asset(product.imageUrl),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SectionView(title: product.productName),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '${product.price} đ',
                  style: TextStyle(
                    color: Palette.gMainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  height: 56,
                  child: _renderSubProduct(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Description:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
                child: Text(
                  '${product.description}',
                  style: TextStyle(
                    color: Palette.gDescriptionTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderSliverAppBar(String title) {
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
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
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

  Widget _renderSubProduct() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) => Container(
        width: 50,
        height: 56,
        padding: EdgeInsets.only(left: 16.0),
        // color: index % 2 == 0 ? Colors.blueGrey : Colors.grey,
        child: Stack(
          children: [
            Positioned(
                bottom: 5,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Palette.gMainColor.withOpacity(0.5),
                  ),
                  width: 25.0,
                  height: 25.0,
                  child: null,
                )),
            Center(
              child: Image.asset(
                'assets/images/foods/lily_food_${index + 1}.png',
              ),
            )
          ],
        ),
      ),
    );
  }
}
