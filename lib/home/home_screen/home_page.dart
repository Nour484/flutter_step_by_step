
import 'package:flutter/material.dart';
import 'package:flutter_for_beginners/profile/profile_page/profile_page.dart';
import '../../first_screen.dart';

import '../home_widget/home_widget.dart';


class MyHomePage extends StatelessWidget {
  final String ? title;

  final String ? body;

  const MyHomePage({ this.title,  this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        actions: [ IconButton(onPressed:  (){

           Navigator.push(context, MaterialPageRoute(builder: (context ) =>ProfilePage())) ;


        }, icon: Icon(Icons.account_box))],
        centerTitle: true,
        title: Text("The ${title ?? "Tree"}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExcludeSemantics(child: Image.asset("assets/tree.jpg")),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FavoriteWidget(),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(textAlign: TextAlign.justify, body ?? "A tree is a tall plant with a woody stem, branches, and leaves. It plays a vital role in nature by producing oxygen, providing shade, and offering a home to many animals. Trees absorb carbon dioxide and help reduce air pollution. They come in many types, like oak, pine, and mango. Trees also prevent soil erosion and are important for the water cycle. People use trees for wood, paper, and fruit. In cities and forests, trees add beauty and support life. Planting and protecting trees is essential for a healthy environment and a better future for all living things.")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MySeason(url: "assets/tree_spring.jpg", text: "Spring"),
                MySeason(url: "assets/tree_fall.jpg", text: "Fall"),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FirstScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}




