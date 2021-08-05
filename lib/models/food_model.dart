import 'package:pet_shop/models/product_model.dart';

class FoodModel extends ProductModel {
  FoodModel(
    String brandName,
    String imageUrl,
    String productName,
    String description,
    int price,
  ) : super(brandName, imageUrl, productName, description, price);
}
