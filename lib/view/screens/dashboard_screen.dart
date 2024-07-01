import 'package:flutter/material.dart';
import 'package:hng_11_stage_one_task_simple_shopping_app/view/screens/check_out_screen.dart';
import 'package:hng_11_stage_one_task_simple_shopping_app/view/screens/product_screen.dart';

import '../../model/response/product_response.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final List<ProductResponse> _checkOutProducts = [];
  void _addACheckOutItem(ProductResponse product) {
    setState(() {
      _checkOutProducts.add(product);
    });
  }

  void _removeACheckOutItem(int productIndex) {
    setState(() {
      _checkOutProducts.removeAt(productIndex);
    });
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      ProductsScreen(
        addProduct: _addACheckOutItem,
      ),
      CheckOutScreen(
        checkOutProducts: _checkOutProducts,
        removeProductFromCheckOutList: _removeACheckOutItem,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
          size: 15,
        ),
        title: Text(_currentIndex == 0 ? "Products" : "Check Out Items",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            )),
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        useLegacyColorScheme: false,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xff023E8A),
        unselectedItemColor: const Color(0xffBECFE7),
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: "Product",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: "Check Out",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }
}
