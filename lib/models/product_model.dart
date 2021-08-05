class ProductModel {
  final String brandName;
  final String imageUrl;
  final String productName;
  final String description;
  final int price;
  final List<String>? subImageUrls;

  ProductModel(this.brandName, this.imageUrl, this.productName,
      this.description, this.price,
      {this.subImageUrls});
}
