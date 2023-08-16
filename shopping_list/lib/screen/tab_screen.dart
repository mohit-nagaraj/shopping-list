import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/model/category.dart';
import 'package:shopping_list/model/grocery_item.dart';
import 'package:shopping_list/screen/new_item_screen.dart';
import 'package:shopping_list/widget/display_item.dart';
import 'package:http/http.dart' as http;

class TabScreen extends StatefulWidget {
  TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<GroceryItem> items = [];

  @override
  void initState() {
    loadItem();
    super.initState();
  }

  void loadItem() async {
    final url = Uri.https(
        'test2-bb3f7-default-rtdb.europe-west1.firebasedatabase.app',
        'shopping-list.json');
    final response = await http.get(url);
    final Map<String, dynamic> loadedData = json.decode(response.body);
    final List<GroceryItem> tempList = [];
    for (final item in loadedData.entries) {
      final cat = categories.entries
          .firstWhere((e) => e.value.name == item.value['category'])
          .value;
      tempList.add(
        GroceryItem(
          id: item.key,
          category: cat,
          name: item.value['name'],
          quantity: item.value['quantity'],
        ),
      );
    }

    setState(() {
      items = tempList;
    });
  }

  void addItem() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => NewItem()));
    loadItem();
  }

  void removeItem(GroceryItem g) {
    setState(() {
      items.remove(g);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery list'),
        actions: [
          IconButton(
            onPressed: addItem,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: (items.length == 0)
            ? Center(
                child: Text(
                'Start adding some items',
                style: TextStyle(fontSize: 16),
              ))
            : ListView(
                children: [...items.map((e) => DisplayItem(e, removeItem))],
              ),
      ),
    );
  }
}
