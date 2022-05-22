import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/model/motive.dart';
import 'package:motivapp/view_model/admin_vm.dart';

class MotiveFormWidget extends StatefulWidget {
  const MotiveFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MotiveFormWidget> createState() => _MotiveFormWidgetState();
}

class _MotiveFormWidgetState extends State<MotiveFormWidget> {
  List<TextEditingController> ctrlList = [];

  final motive = Motive(
      blue: 255,
      green: 255,
      red: 255,
      title: "",
      order: 1,
      local: "tr",
      category: "",
      icon: "",
      subtitle: "");

  @override
  void initState() {
    ctrlList = [];
    for (var i in motive.toJson().keys) {
      ctrlList.add(TextEditingController());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: TextFormField(
                  decoration: InputDecoration(
                    label: Text(motive.toJson().keys.elementAt(index)),
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
                map[motive.toJson().keys.elementAt(i)] =
                    int.tryParse(ctrlList.elementAt(i).text) ?? ctrlList.elementAt(i).text;
              }
              var response = await Get.find<AdminVM>().addMotives(map);
              if (response) {
                Get.snackbar("Success", "Successfully Added",
                    colorText: Colors.white, backgroundColor: Colors.green);
              } else {
                Get.snackbar("Error", "An Error Occured",
                    colorText: Colors.white, backgroundColor: Colors.red);
              }
            },
            child: const Text("Add Motive"))
      ],
    );
  }
}
