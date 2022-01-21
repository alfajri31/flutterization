import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:developer';
import 'package:icon_badge/icon_badge.dart';

List<String> myCart = [];

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

  void addToCart(value) {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("CHOOSE YOUR WORDS THEN ?????"),
            actions: const [
              CartDynamicIcon()
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
                  log('user has selected this item');
                },
                icon: const Icon(Icons.add_box),
              ),
            );
          })),
    );
  }
}

class CartDynamicIcon extends StatefulWidget {
  const CartDynamicIcon({Key? key}) : super(key: key);

  @override
  _CartDynamicIconState createState() => _CartDynamicIconState();
}

class _CartDynamicIconState extends State<CartDynamicIcon> {
  @override
  Widget build(BuildContext context) {
    return IconBadge(
      onTap: () {
        return;
      },
      icon: const Icon(Icons.add_shopping_cart_sharp),
      itemCount: myCart.length,
      badgeColor: Colors.red,
      itemColor: Colors.white,
    );
  }
}
