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
              colors: [Colors.red, Colors.indigo, Colors.pinkAccent.shade100])),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text("Merhaba ${Get.find<MotiveVM>().name.value.capitalizeFirst}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 30, color: Colors.white)),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(child: Icon(Icons.star)),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Text("Bugün Nasıl Hissediyorsun?",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.pink.shade200,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5, spreadRadius: 2, color: Colors.grey.withOpacity(0.5))
                        ]),
                    child: InkWell(
                      onTap: () async {
                        await Get.find<MotiveVM>()
                            .getCommentByMotive(data.elementAt(index).data().category ?? "");
                        if (Get.find<MotiveVM>().comment.value.comment != null) {
                          Get.to(() => CommentPage(data: data.elementAt(index).data()));
                        } else {}
                      },
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
