import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/view/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NamePage extends StatelessWidget {
  const NamePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.orange.shade200, Colors.red.shade200, Colors.pinkAccent.shade100])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Text("D'mottie",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, color: Colors.white)),
                ),
              ),
              const Expanded(
                flex: 4,
                child: Icon(Icons.star),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    const Text("Merhaba\nBen Mottie\nSenin adın ne?",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 18, right: Get.size.width / 4, left: Get.size.width / 4),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                          fillColor: Colors.white24,
                          filled: true,
                        ),
                        onFieldSubmitted: (value) async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString("name", value);
                          Get.offAll(() => const MainPage());
                        },
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20, color: Colors.white, decoration: TextDecoration.none),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
