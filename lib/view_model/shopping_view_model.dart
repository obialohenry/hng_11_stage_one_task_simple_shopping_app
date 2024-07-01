import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/response/products_response.dart';

class ShoppingViewModel {
  ProductResponse productResponse = ProductResponse();
  final List<ProductResponse> _products = [
    ProductResponse(
        name: "Xiaomi Redmi", image: "assets/images/first_phone_item.jpg", price: "151,000"),
    ProductResponse(
        name: "Sneakers Shoe", image: "assets/images/first_shoe_item.jpg", price: "13,500"),
    ProductResponse(
        name: "T900 Watch", image: "assets/images/first_wrist_watch.jpg", price: "11,541"),
    ProductResponse(
        name: "Yeezy Casual", image: "assets/images/fourth_shoe_item.jpg", price: "14,373"),
    ProductResponse(name: "Itel TV", image: "assets/images/itel_tv.jpg", price: "77,999"),
    ProductResponse(
        name: "Tecno POP 8", image: "assets/images/second_phone_item.jpg", price: "101,875"),
    ProductResponse(
        name: "Social Man", image: "assets/images/second_shoe_item.jpg", price: "13,500"),
    ProductResponse(
        name: "Itel Watch", image: "assets/images/second_wrist_watch.jpg", price: "15,000"),
    ProductResponse(
        name: "Xiaomi A3", image: "assets/images/third_phone_item.jpg", price: "110,500"),
    ProductResponse(
        name: "Men's Shoe", image: "assets/images/third_shoe_item.jpg", price: "14,500"),
    ProductResponse(
        name: "Fngeen Quartz", image: "assets/images/third_wrist_watch.jpg", price: "5,000"),
  ];
  List<ProductResponse> get products => _products;
  final List<ProductResponse> _checkOutProducts = [];
  List<ProductResponse> get checkOutProducts => _checkOutProducts;
  // Future<List<ProductsResponse>?> getAllResponse() async {
  //   var input = await rootBundle.loadString("assets/json/products.json");
  //   List<dynamic> dynamicProductResponse = jsonDecode(input);
  //   _products = dynamicProductResponse
  //       .map((dynamicProducts) => ProductsResponse.fromJson(dynamicProducts))
  //       .toList();
  //   return _products;
  // }

  void addACheckOutItem(ProductResponse product) {
    _checkOutProducts.add(product);
  }

  void removeACheckOutItem(ProductResponse product) {
    _checkOutProducts.remove(product);
  }
}

class ProductResponse {
  String? name;
  String? price;
  String? image;
  ProductResponse({
    this.image,
    this.name,
    this.price,
  });
}
