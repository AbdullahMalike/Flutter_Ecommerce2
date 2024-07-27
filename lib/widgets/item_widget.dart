import 'package:flutter/material.dart';
import 'package:flutterpractise/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  // ignore: unnecessary_null_comparison
  const ItemWidget({super.key, required this.item}) : assert(item != null);

  final Item item;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.name} tapped");
        },
        leading: Image.asset(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "${item.price.toString()} Pkr",
          style: const TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    );
  }
}
