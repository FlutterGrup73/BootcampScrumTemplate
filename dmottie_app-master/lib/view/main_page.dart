import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/model/motive.dart';
import 'package:motivapp/view/admin_login_page.dart';
import 'package:motivapp/view/widgets/mood_widget.dart';
import 'package:motivapp/view_model/motive_vm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
            color: Colors.indigo.withOpacity(0.3),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Spacer(),
                  InkWell(
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(Icons.settings, color: Colors.white),
                    ),
                    onTap: () {
                      Get.dialog(Dialog(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            ListTile(
                              title: const Text("Sıfırla"),
                              onTap: () async {
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                await prefs.clear();
                                Get.back();
                              },
                            )
                          ],
                        ),
                      ));
                    },
                    onDoubleTap: () {
                      Get.to(() => const AdminLoginPage());
                    },
                  ),
                ],
              ),
            )),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: GetBuilder<MotiveVM>(
            initState: (_) async {
              Get.put(MotiveVM());
              SharedPreferences prefs = await SharedPreferences.getInstance();
              Get.find<MotiveVM>().name.value = prefs.getString("name") ?? "";
            },
            builder: (logic) {
              return Obx(() {
                return StreamBuilder<QuerySnapshot<Motive>>(
                  stream: FirebaseFirestore.instance
                      .collection('motives')
                      .where("local", isEqualTo: logic.local.value)
                      .orderBy("order")
                      .withConverter<Motive>(
                        fromFirestore: (snapshots, _) => Motive.fromJson(snapshots.data()!),
                        toFirestore: (motive, _) => motive.toJson(),
                      )
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.requireData.docs;
                      return MoodWidget(data: data);
                    } else {
                      return Container();
                    }
                  },
                );
              });
            },
          ),
        ));
  }
}
