import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/model/comment.dart';
import 'package:motivapp/view_model/admin_vm.dart';

class CommentFormWidget extends StatefulWidget {
  const CommentFormWidget({Key? key}) : super(key: key);

  @override
  State<CommentFormWidget> createState() => _CommentFormWidgetState();
}

class _CommentFormWidgetState extends State<CommentFormWidget> {
  List<TextEditingController> ctrlList = [];

  var comment = Comment(local: "tr", comment: "", motive: "", url: "");

  @override
  void initState() {
    ctrlList = [];
    for (var i in comment.toJson().keys) {
      ctrlList.add(TextEditingController());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Flexible(
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: TextFormField(
                  decoration: InputDecoration(
                    label: Text(comment.toJson().keys.elementAt(index)),
                    border: const OutlineInputBorder(),
                  ),
                  controller: ctrlList.elementAt(index)),
            ),
            itemCount: ctrlList.length,
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              Map<String, dynamic> map = {};
              for (int i = 0; i < ctrlList.length; i++) {
                map[comment.toJson().keys.elementAt(i)] =
                    int.tryParse(ctrlList.elementAt(i).text) ?? ctrlList.elementAt(i).text;
              }
              var response = await Get.find<AdminVM>().addComments(map);
              if (response) {
                Get.snackbar("Success", "Successfully Added",
                    colorText: Colors.white, backgroundColor: Colors.green);
              } else {
                Get.snackbar("Error", "An Error Occured",
                    colorText: Colors.white, backgroundColor: Colors.red);
              }
            },
            child: const Text("Add Category"))
      ],
    ));
  }
}
