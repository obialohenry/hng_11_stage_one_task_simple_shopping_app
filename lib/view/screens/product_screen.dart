import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hng_11_stage_one_task_simple_shopping_app/view/components/gap.dart';
import 'package:hng_11_stage_one_task_simple_shopping_app/view_model/shopping_view_model.dart';

import '../../model/response/products_response.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ShoppingViewModel shoppingViewModel = ShoppingViewModel();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   setState(() {
  //     shoppingViewModel.getAllResponse();
  //   });
  // }

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
                  itemCount: shoppingViewModel.products.length,
                  itemBuilder: (context, index) {
                    String imageUrl = shoppingViewModel.products[index].image ?? "";
                    String name = shoppingViewModel.products[index].name ?? "";
                    String price = "₦${shoppingViewModel.products[index].price ?? ""}";
                    return ProductItem(
                      imageUrl: imageUrl,
                      name: name,
                      price: price,
                      onPress: () {
                        setState(() {
                          shoppingViewModel.addACheckOutItem(shoppingViewModel.products[index]);
                        });

                        final snackBar = SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                              "Added ${shoppingViewModel.products[index].name} to check out list"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    );
                  }),
            )),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  ProductItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.onPress,
  });

  final String imageUrl;
  final String name;
  final String price;
  VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 30,
              height: 30,
            ),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
                ),
                const Gap(5),
                Text(
                  price,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
                ),
              ],
            )
          ],
        ),
      ),
      trailing: InkWell(
        onTap: onPress,
        child: const Icon(
          Icons.add_shopping_cart,
          color: const Color(0xff023E8A),
          size: 20,
        ),
      ),
    );
  }
}
