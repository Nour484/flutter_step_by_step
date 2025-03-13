import 'package:flutter/material.dart';

import 'first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home:  FirstScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {


    final String title ;
   final  String body ;
  const MyHomePage({ required this.title , required   this.body  ,  super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

           
        centerTitle: true,
        title: Text("The $title"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/tree.jpg"),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FavoriteWidget (),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  textAlign: TextAlign.justify,
        
                body
              )          ),
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


             Navigator.push(context,  MaterialPageRoute(builder: (context) => FirstScreen() )) ;


        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MySeason extends StatelessWidget {
  final String url;
  final String text;
  const MySeason({required this.text, required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(height: 100, width: 100, fit: BoxFit.cover, url),
        Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 25),
        )
      ],
    );
  }
}



class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
   bool click = false ;


  @override
  Widget build(BuildContext context) {
    return   IconButton(onPressed: () {

        setState(() {

          click =! click ;

        });




    }, icon: Icon(Icons.favorite  , color:  click ? Colors.red : Colors.grey,));

  }
}
