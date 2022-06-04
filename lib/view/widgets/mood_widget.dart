import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motivapp/model/motive.dart';
import 'package:motivapp/view/comment_page.dart';
import 'package:motivapp/view_model/motive_vm.dart';

class MoodWidget extends StatelessWidget {
  const MoodWidget({Key? key, required this.data}) : super(key: key);
  final List<QueryDocumentSnapshot<Motive>> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.purpleAccent.shade200, Colors.deepPurple, Colors.blue.shade600])),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text("Merhaba ${Get.find<MotiveVM>().name.value.capitalizeFirst}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 28, color: Colors.white)),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Image.asset("assets/9.png")),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Text("Bugün Nasıl Hissediyorsun?",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.white,shadows: [
                            BoxShadow(
                                blurRadius: 10, spreadRadius: 6, color: Colors.black.withOpacity(0.4)
                            )
                          ])),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10, spreadRadius: 6, color: Colors.black.withOpacity(0.4))
                        ]),
                    child: ElevatedButton(
                      onPressed: () async {
                        await Get.find<MotiveVM>()
                            .getCommentByMotive(data.elementAt(index).data().category ?? "");
                        if (Get.find<MotiveVM>().comment.value.comment != null) {
                          Get.to(() => CommentPage(data: data.elementAt(index).data()));
                        } else {}
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.2)
                        ),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                        ))
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          "${data.elementAt(index).data().category}",
                          style: const TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      )),
                    ),
                  ),
                ),
                itemCount: data.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
