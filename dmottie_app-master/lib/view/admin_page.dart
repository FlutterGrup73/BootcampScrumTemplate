import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/view/widgets/admin_widgets/comment_form_widget.dart';
import 'package:motivapp/view/widgets/admin_widgets/motive_form_widget.dart';
import 'package:motivapp/view_model/admin_vm.dart';

class AdminPage extends StatelessWidget {
  AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin"),
        centerTitle: true,
      ),
      body: GetBuilder<AdminVM>(
          init: Get.put(AdminVM()),
          builder: (logic) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: const [
                  Flexible(child: MotiveFormWidget()),
                  Flexible(child: CommentFormWidget())
                ],
              ),
            );
          }),
    );
  }
}
