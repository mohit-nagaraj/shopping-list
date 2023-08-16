import 'package:flutter/material.dart';
import 'package:shopping_list/model/grocery_item.dart';

class DisplayItem extends StatelessWidget {
  DisplayItem(this.item, this.removeItem, {super.key});
  void Function(GroceryItem g) removeItem;
  final GroceryItem item;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      onDismissed: (direction) {
        removeItem(item);
      },
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red[400],
        ),
        child: Center(
          child: Icon(Icons.delete_forever),
        ),
      ),
      child: Container(
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
      ),
    );
  }
}
