import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:icon_badge/icon_badge.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void addToCart(value) {}

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyCart());
  }
}

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class WordPairMeta {
  late String wordPairs;
  late int index;
  late bool selected = false;
  late bool onCart = false;
}

class _MyCartState extends State<MyCart> {
  List<WordPairMeta> myCart = [];
  List<WordPairMeta> wordPairsMeta = [];
  late bool tmp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("CHOOSE YOUR WORDS AAAND THEN ?????"),
            backgroundColor: Colors.orange,
            actions: [
              IconBadge(
                icon: const Icon(Icons.add_shopping_cart_sharp),
                itemCount: myCart.length,
                badgeColor: Colors.red,
                itemColor: Colors.white,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
                          return Dialog(
                              child: ListView.builder(
                                itemCount: myCart.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: myCart[index].selected
                                        ? Text(myCart[index].wordPairs)
                                        : const Text(""),
                                    onTap: () {
                                      setState(() {
                                        int currentIndex = myCart[index].index;
                                        wordPairsMeta[currentIndex].selected = false;
                                        myCart[index].selected = false;
                                      });
                                    },
                                  );
                                },
                              ));
                        },);
                      });
                },
              )
            ]),
        body: ListView.builder(itemBuilder: (context, index) {
          WordPairMeta wordPairMeta = WordPairMeta();
          wordPairMeta.wordPairs = generateWordPairs().first.asCamelCase;
          wordPairMeta.index = index;
          wordPairsMeta.add(wordPairMeta);
          if (index % 2 == 1) {
            return const Divider();
          }
          return ListTile(
            title: !wordPairsMeta[index].selected
                ? Text(wordPairsMeta[index].wordPairs)
                : const Text(""),
            trailing: IconButton(
              onPressed: () {
                !wordPairsMeta[index].selected
                    ? setState(() {
                        wordPairsMeta[index].selected = true;
                        myCart.add(wordPairsMeta[index]);
                      })
                    : false;
              },
              icon: Visibility(
                  child: const Icon(Icons.add_box),
                  visible: !wordPairsMeta[index].selected ? true : false),
            ),
          );
        }));
  }
}
