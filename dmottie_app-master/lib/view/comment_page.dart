import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/model/motive.dart';
import 'package:motivapp/view_model/motive_vm.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({Key? key, required this.data}) : super(key: key);
  final Motive data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${data.title}"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(data.red ?? 0, data.green ?? 0, data.blue ?? 0, 100),
      ),
      body: Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: Text(
                  "${Get.find<MotiveVM>().comment.value.comment}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.indigo, fontSize: 24),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(data.red ?? 0, data.green ?? 0, data.blue ?? 0, 100),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurStyle: BlurStyle.solid,
                        blurRadius: 12,
                        offset: const Offset(2, 2))
                  ]),
              child: SizedBox(
                width: Get.size.width / 1.2,
                height: 80,
                child: Center(
                  child: InkWell(
                    onTap: () => launchUrlString(Get.find<MotiveVM>().comment.value.url ?? ""),
                    child: Text(
                      "${data.subtitle}",
                      style: const TextStyle(fontSize: 24, color: Colors.indigo),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Center(),
          )
        ],
      ),
    );
  }
}
