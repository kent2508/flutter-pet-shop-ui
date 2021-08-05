import 'package:flutter/material.dart';
import 'package:pet_shop/models/product_model.dart';
import 'package:pet_shop/screens/product_detail_screen.dart';
import 'package:pet_shop/widget/buttons.dart';
import 'package:pet_shop/core/color_palette.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, this.product}) : super(key: key);

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    if (product == null) return SizedBox.shrink();

    final width = (MediaQuery.of(context).size.width - 16 * 3) / 2;
    final height = width * 230 / 164;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailScreen.screenName,
            arguments: {'product': product!});
      },
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0.05),
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
            )
          ],
        ),
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Stack(children: [
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 100 / 230 * height,
                      height: 100 / 230 * height,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFFEE2EA)),
                      child: null,
                    )),
                Image.asset(product!.imageUrl),
              ]),
            )),
            SizedBox(
              height: 68 / 230 * height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          product!.brandName,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          '${product!.price} đ',
                          style: TextStyle(
                            color: Palette.gMainColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  AddButton(onPressed: () {
                    print('add to cart');
                  }),
                  const SizedBox(width: 16.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
