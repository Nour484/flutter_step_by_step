import 'package:flutter/material.dart';
import 'package:flutter_for_beginners/profile/user_model.dart';
import 'package:provider/provider.dart';

import 'home/home_screen/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => UserModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  showSemanticsDebugger: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
