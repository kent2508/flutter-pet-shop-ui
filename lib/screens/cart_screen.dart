import 'package:flutter/material.dart';
import 'package:pet_shop/core/color_palette.dart';
import 'package:pet_shop/models/cart_model.dart';
import 'package:pet_shop/widget/widgets.dart';

class Cart {
  Cart._internal();
  static Cart shared = Cart._internal();
  factory Cart() => shared;

  List<CartModel>? cartItems;
}

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);

  static String screenName = '/cart_screen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _renderAppBar(context),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
              child: Text(
                '${Cart.shared.cartItems?.length ?? 0} items',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Cart.shared.cartItems?.length ?? 0,
                itemBuilder: (context, index) =>
                    _renderCartBuilderItem(context, index),
              ),
            ),
            _renderBottomView(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _renderAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Text(
        'Cart',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _renderCartBuilderItem(BuildContext context, int index) {
    final cartItem = Cart.shared.cartItems?[index] ?? null;
    if (cartItem == null) return SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Container(
        width: double.infinity,
        height: 94,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: Offset(0, 02),
                blurRadius: 4),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(child: Image.asset(cartItem.food.imageUrl)),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 12.0, right: 12.0, bottom: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cartItem.food.productName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF333333),
                      ),
                    ),
                    Text(
                      cartItem.food.brandName,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF5A5A5A),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${cartItem.food.price} đ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Palette.gMainColor,
                          ),
                        ),
                        Spacer(),
                        AddButton(
                          isMinus: true,
                          onPressed: () {
                            print('decrease volume');
                          },
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          '${cartItem.quantity}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF333333),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        AddButton(
                          onPressed: () {
                            print('increase volume');
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderBottomView() {
    var total = 0;
    Cart.shared.cartItems!.forEach((element) {
      total += element.quantity * element.food.price;
    });
    return Container(
      height: 162.0,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(0, 3),
            blurRadius: 10,
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _renderTextRow(
                    Text('${Cart.shared.cartItems?.length ?? 0} items'),
                    Text('$total đ')),
                _renderTextRow(Text('Ship'), Text('20000 đ')),
                _renderTextRow(
                  Text(
                    'Total',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('${total + 20000} đ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Palette.gMainColor,
                      )),
                ),
              ],
            ),
          )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              width: double.infinity,
              height: 40.0,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Palette.gMainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () => print('on Check out'),
                child: Text(
                  'Check out',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _renderTextRow(Text labelText, Text valueText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        labelText,
        valueText,
      ],
    );
  }
}
