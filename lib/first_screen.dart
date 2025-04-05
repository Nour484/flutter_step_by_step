import 'package:flutter/material.dart';

import 'home/home_screen/home_page.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void dispose() {
    print(" title  ${title.text}   body ${body.text}");

    title.clear();
    body.clear();
    title.dispose();
    body.dispose();

    print(" title  ${title.text}   body ${body.text}");

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: MergeSemantics(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/background.jpg"),
            )),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: title,
                    decoration: InputDecoration(
                        hintText: "title", border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: body,
                    minLines: 3,
                    maxLines: 7,
                    decoration: InputDecoration(
                        hintText: "body", border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.save),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            title: title.text,
                            body: body.text,
                          )));
            }));
  }
}
