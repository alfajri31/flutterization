import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> wordPairs = [];
  List<String> myCart = [];

  void addToCart(value) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("CHOOSE YOUR WORDS THEN ?????"),
            actions: [
              IconButton(
                  onPressed: () {
                    return;
                  },
                  icon: const Icon(Icons.shopping_cart))
            ],
          ),
          body: ListView.builder(itemBuilder: (context, index) {
            wordPairs.add(generateWordPairs().first.asCamelCase);
            if (index % 2 == 1) {
              return const Divider();
            }
            return ListTile(
              title: Text(wordPairs[index]),
              trailing: IconButton(
                onPressed: () {
                  myCart.add(wordPairs[index]);
                  log('user has selected');
                },
                icon: const Icon(Icons.add_box),
              ),
            );
          })),
    );
  }
}
