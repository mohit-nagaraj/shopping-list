import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/model/grocery_item.dart';
import 'package:shopping_list/widget/display_item.dart';

class TabScreen extends StatelessWidget {
  TabScreen({super.key});
  final List<GroceryItem> items = groceryItems;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery list'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView(
          children: [...items.map((e) => DisplayItem(e))],
        ),
      ),
    );
  }
}
