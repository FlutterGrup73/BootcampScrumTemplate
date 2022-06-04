import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:motivapp/model/motive.dart';
import 'package:motivapp/view_model/motive_vm.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({Key? key, required this.data}) : super(key: key);
  final Motive data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          color: Color.fromRGBO(data.red ?? 0, data.green ?? 0, data.blue ?? 0, 100),
          child: const Padding(child: Text("D'Mottie",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 24,fontFamily: "graphie",fontWeight: FontWeight.bold)),padding: EdgeInsets.all(16)),
        ),
      ),
      appBar: AppBar(
        leading: InkWell(child: Image.memory(base64Decode(data.icon ?? ""),scale: 2,color: Colors.white),onTap: () {
          Get.back();
        }),
        title: Text("${data.title}"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(data.red ?? 0, data.green ?? 0, data.blue ?? 0, 100),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "${(Get.find<MotiveVM>().comment.value.comment ?? "").replaceAll("\\n", "\n")}",
                textAlign: TextAlign.center,
                style: TextStyle(color: HexColor(data.secondarycolor ?? ""), fontSize: 24),
              ),
            ),
          ),
          Get.find<MotiveVM>().comment.value.url != "" ?
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
                      style: TextStyle(fontSize: 24, color: HexColor(data.secondarycolor ?? "")),
                    ),
                  ),
                ),
              ),
            ),
          ) : Container()

        ],
      ),
    );
  }
}
