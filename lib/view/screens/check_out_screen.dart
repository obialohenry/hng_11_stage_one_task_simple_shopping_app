import 'package:flutter/material.dart';
import 'package:hng_11_stage_one_task_simple_shopping_app/view/components/product_item.dart';
import 'package:hng_11_stage_one_task_simple_shopping_app/view/screens/success_screen.dart';

import '../../model/response/product_response.dart';

import '../components/gap.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen(
      {Key? key, required this.checkOutProducts, required this.removeProductFromCheckOutList})
      : super(key: key);
  final List<ProductResponse> checkOutProducts;
  final void Function(int) removeProductFromCheckOutList;
  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  // ShoppingViewModel shoppingViewModel = ShoppingViewModel();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          child: widget.checkOutProducts.isEmpty
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_checkout,
                      size: 50,
                      color: const Color(0xff023E8A),
                    ),
                    Text(
                      "No Item has been added to the cart",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: widget.checkOutProducts.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          String imageUrl = widget.checkOutProducts[index].image ?? "";
                          String name = widget.checkOutProducts[index].name ?? "";
                          String price = "₦${widget.checkOutProducts[index].price ?? ""}";
                          return ProductItem(
                            imageUrl: imageUrl,
                            name: name,
                            price: price,
                            onPress: () {
                              final snackBar = SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                    "Removed ${widget.checkOutProducts[index].name} from check out list"),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              widget.removeProductFromCheckOutList(index);

                        
                            },
                            trailingIcon: const Icon(
                              Icons.remove_shopping_cart,
                              color: Colors.red,
                              size: 20,
                            ),
                          );
                        },
                      ),
                      const Gap(20),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const SuccessScreen()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: const Color(0xff023E8A),
                          ),
                          child: const Text(
                            "Check Out Items",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
