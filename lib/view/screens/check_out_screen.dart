import 'package:flutter/material.dart';
import 'package:hng_11_stage_one_task_simple_shopping_app/view/screens/success_screen.dart';

import '../../view_model/shopping_view_model.dart';
import '../components/gap.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  ShoppingViewModel shoppingViewModel = ShoppingViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 15,
          ),
          child: shoppingViewModel.checkOutProducts.isEmpty
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
                        itemCount: shoppingViewModel.checkOutProducts.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          String imageUrl = shoppingViewModel.checkOutProducts[index].image ?? "";
                          String name = shoppingViewModel.checkOutProducts[index].name ?? "";
                          String price =
                              "₦${shoppingViewModel.checkOutProducts[index].price ?? ""}";
                          return ListTile(
                            leading: SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    imageUrl,
                                    width: 24,
                                    height: 24,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        name,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      const Gap(15),
                                      Text(
                                        price,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            trailing: InkWell(
                              onTap: () {
                                shoppingViewModel
                                    .removeACheckOutItem(shoppingViewModel.checkOutProducts[index]);
                                final snackBar = SnackBar(
                                  content: Container(
                                    color: Colors.red,
                                    width: double.infinity,
                                    child: Text(
                                        "Removed ${shoppingViewModel.checkOutProducts[index].name} from check out list"),
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              },
                              child: const Icon(
                                Icons.remove_shopping_cart,
                                color: Colors.red,
                                size: 20,
                              ),
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
