import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/view/admin_page.dart';
import 'package:motivapp/view_model/admin_vm.dart';

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Page"),
        centerTitle: true,
      ),
      body: GetBuilder<AdminVM>(
          init: Get.put(AdminVM()),
          builder: (logic) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    controller: logic.adminNickCtrl,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text("Kullanıcı Adı")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    controller: logic.adminPassCtrl,
                    obscureText: true,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder(), label: Text("Şifre")),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      var response = await logic.login();
                      if (response) {
                        Get.to(() => AdminPage());
                      } else {
                        Get.snackbar("Uyarı", "Kullanıcı Adı veya Şifre Hatalı",
                            backgroundColor: Colors.red, colorText: Colors.white);
                      }
                    },
                    child: const Text("Giriş Yap"))
              ],
            );
          }),
    );
  }
}
