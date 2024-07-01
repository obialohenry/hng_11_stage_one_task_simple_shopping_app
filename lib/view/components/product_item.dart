import 'package:flutter/material.dart';
import 'package:hng_11_stage_one_task_simple_shopping_app/view/components/gap.dart';

class ProductItem extends StatelessWidget {
  ProductItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.onPress,
    required this.trailingIcon,
  });
  final Widget trailingIcon;
  final String imageUrl;
  final String name;
  final String price;
  VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        bottom: 12,
        left: 12,
        right: 12,
      ),
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
      trailing: GestureDetector(onTap: onPress, child: trailingIcon),
    );
  }
}
