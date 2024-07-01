import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng_11_stage_one_task_simple_shopping_app/view/components/gap.dart';
import '../../model/response/product_response.dart';
import '../components/product_item.dart';


class ProductsScreen extends StatelessWidget {
  ProductsScreen({Key? key, required this.addProduct}) : super(key: key);

  final void Function(ProductResponse) addProduct;

  final List<ProductResponse> products = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: SingleChildScrollView(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    String imageUrl = products[index].image ?? "";
                    String name = products[index].name ?? "";
                    String price = "₦${products[index].price ?? ""}";
                    //  debugPrintStack(
                    //         label: " ${shoppingViewModel.addACheckOutItem(shoppingViewModel.products[index])}");
                    return ProductItem(
                      imageUrl: imageUrl,
                      name: name,
                      price: price,
                      onPress: () {
                        addProduct(products[index]);
                        // debugPrintStack(
                        //     label: "items added to cart: ${shoppingViewModel.checkOutProducts}");

                        final snackBar = SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Added ${products[index].name} to check out list"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      trailingIcon: const Icon(
                        Icons.add_shopping_cart,
                        color: Color(0xff023E8A),
                        size: 20,
                      ),
                    );
                  }),
            )),
      ),
    );
  }
}

