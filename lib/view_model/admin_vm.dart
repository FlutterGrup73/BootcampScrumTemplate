import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AdminVM extends GetxController {
  TextEditingController adminNickCtrl = TextEditingController();
  TextEditingController adminPassCtrl = TextEditingController();

  login() async {
    var response = await FirebaseFirestore.instance
        .collection("admin")
        .where("nick", isEqualTo: base64Encode(adminNickCtrl.text.codeUnits))
        .where("pass", isEqualTo: base64Encode(adminPassCtrl.text.codeUnits))
        .get();
    if (response.docs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  addMotives(Map<String, dynamic> map) async {
    var uuid = (const Uuid()).v1();
    map["uuid"] = uuid;
    try {
      await FirebaseFirestore.instance.collection("motives").add(map);
      return true;
    } catch (e) {
      return false;
    }
  }

  addComments(Map<String, dynamic> map) async {
    var uuid = (const Uuid()).v1();
    map["uuid"] = uuid;
    try {
      await FirebaseFirestore.instance.collection("comments").add(map);
      return true;
    } catch (e) {
      return false;
    }
  }
}
