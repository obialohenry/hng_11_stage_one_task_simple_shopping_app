import 'package:flutter/material.dart';
import 'package:hng_11_stage_one_task_simple_shopping_app/view/screens/dashboard_screen.dart';

import '../components/gap.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/tick_mark.png",
                  // width: 40,
                  width: 265,
                  height: 155,
                ),
              ],
            ),
            const Gap(
              20,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Successfull",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Items have been checked out!",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Gap(
              45,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  // the new route
                  MaterialPageRoute(
                    builder: (BuildContext context) => const DashBoardScreen(),
                  ),

                  // this function should return true when we're done removing routes
                  // but because we want to remove all other screens, we make it
                  // always return false
                  (Route route) => false,
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xff023E8A),
                ),
                child: const Text(
                  "Back To Products",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
