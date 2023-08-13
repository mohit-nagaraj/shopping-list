import 'package:flutter/material.dart';
import 'package:shopping_list/model/grocery_item.dart';

class DisplayItem extends StatelessWidget {
  DisplayItem(this.item, {super.key});
  final GroceryItem item;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      child: Row(
        children: [
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: item.category.color,
            ),
          ),
          SizedBox(width: 16),
          Text(item.name),
          Spacer(),
          Text('${item.quantity}'),
        ],
      ),
    );
  }
}
