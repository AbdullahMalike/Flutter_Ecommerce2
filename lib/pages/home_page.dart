import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutterpractise/models/catalog.dart';
import 'package:flutterpractise/widgets/drawer.dart';
import 'package:flutterpractise/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // esme hm json se file la rhy hai apni or loadstring future deti hai oska matlab hai ke ye thora time leti hai to hm ne await aur async ka use ki hai
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // ab hmary pas jo valye ai hai wo string hai hm string se values nhi nikal skty hmy map ke liye convert krna ho ga decode me jo json decode ka use kia ta ke hmy map mil sky
    final decodedData = jsonDecode(catalogJson);

    // ab hmy map/list se sari value mil gai liken hmy bs products ka data cahiye jo key ke value dy di products ye json se sirf products ke hi value laen ga
    var productsData = decodedData["products"];
//esme hm ek list bna rhy hai jesme hm prudoct wali list use kr ke osko map krwa rhy hai item waly map se or osko list me convert kr rhy hai ta ke hmary pas list ban jaen
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items.isNotEmpty)
            ? ListView.builder(
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) =>
                    ItemWidget(item: CatalogModel.items[index]))
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
