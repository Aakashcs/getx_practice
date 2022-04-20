import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/screens/add_article.dart';
import 'package:getx_practice/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News Articles',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const HomeScreen(title: "News Articles"),
        '/add': (context) => const AddArticleScreen(),
      },
    );
  }
}
