import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.amber[900]), home: OrderList());
  }
}

class OrderList extends StatefulWidget {
  @override
  OrderListState createState() => OrderListState();
}

class OrderListState extends State<OrderList> {
  final _randomWordPairs = <WordPair>[];

  Widget _builderList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();

        final index = item ~/ 2;

        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18)));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order List")),
      body: _builderList(),
    );
  }
}
