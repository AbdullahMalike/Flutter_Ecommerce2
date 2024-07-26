import 'package:flutter/material.dart';
import 'package:flutterpractise/models/catalog.dart';
import 'package:flutterpractise/widgets/drawer.dart';
import 'package:flutterpractise/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dummy_list = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummy_list.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: dummy_list[index]);
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
