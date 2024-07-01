class ProductsResponse {
  String? productName;
  String? productImage;
  String? productPrice;
  ProductsResponse({this.productImage, this.productName, this.productPrice});
  ProductsResponse.fromJson(dynamic json) {
    productName = json['name'];
    productImage = json['image'];
    productPrice = json['price'];
  }
}
