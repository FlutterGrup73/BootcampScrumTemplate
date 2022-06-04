import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/view/main_page.dart';
import 'package:motivapp/view/name_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

var name = "";
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Async olduğunda initialize edebilmek için
  await Firebase.initializeApp(); // Firebase uygulamasını alıyor.
  SharedPreferences prefs = await SharedPreferences.getInstance(); // Sharedpreferences paketini çağırır
  name = prefs.getString("name") ?? "";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Motivapp',

      theme: ThemeData(
        fontFamily: "graphie",
        primarySwatch: Colors.blue,
      ),
      home: name.isEmpty ? const NamePage() : const MainPage(),
    );
  }
}
