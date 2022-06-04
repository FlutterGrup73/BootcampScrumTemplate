import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/view/admin_login_page.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(color: Colors.blue),
      child: Row(
        children: [
          Text("asdasd"),
          InkWell(
            child: const SizedBox(
              width: 50,
              height: 30,
            ),
            onDoubleTap: () {
              Get.to(() => const AdminLoginPage());
            },
          ),
        ],
      ),
    );
  }
}
