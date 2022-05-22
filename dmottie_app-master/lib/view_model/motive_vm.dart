import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/model/comment.dart';

class MotiveVM extends GetxController {
  var comment = Comment().obs;
  var local = "tr".obs;
  var name = "".obs;

  getCommentByMotive(String mot) async {
    Get.dialog(const Dialog(
      child: SizedBox(
          width: 100,
          height: 250,
          child: Padding(
            padding: EdgeInsets.all(50),
            child: CircularProgressIndicator(),
          )),
    ));
    var query = await FirebaseFirestore.instance
        .collection("comments")
        .where("motive", isEqualTo: mot)
        .where("local", isEqualTo: local.value)
        .get();
    Random rnd = Random();
    if (query.docs.isNotEmpty) {
      var randomNumber = rnd.nextInt(query.docs.length);
      DocumentSnapshot randomDocument = query.docs[randomNumber];
      comment.value = Comment.fromJson(randomDocument.data());
    } else {
      comment.value = Comment();
    }
    if (Get.isDialogOpen ?? false) Get.back();
  }

  getLangs() async {
    var query = await FirebaseFirestore.instance.collection("langs").get();
    if (query.docs.isNotEmpty) {
      Get.dialog(
        Dialog(
            child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                      title: Text("${query.docs.elementAt(index).data()["name"]}"),
                      onTap: () {
                        local.value = query.docs.elementAt(index).data()["local"];
                        Get.back();
                      },
                    ),
                itemCount: query.docs.length)),
      );
      print(local.value);
    }
  }
}
