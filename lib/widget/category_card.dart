import 'package:flutter/material.dart';
import 'package:pet_shop/models/product_category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, this.category, this.lastItem = false})
      : super(key: key);

  final ProductCategoryModel? category;
  final bool lastItem;

  @override
  Widget build(BuildContext context) {
    if (category == null) return SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.only(
          left: 16.0, top: 10.0, bottom: 10.0, right: lastItem ? 16.0 : 0.0),
      child: Container(
          width: 125,
          height: 125,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(category!.avatarUrl, width: 52, height: 52),
              SizedBox(height: 12.0),
              Text(
                category!.name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          )),
    );
  }
}
