import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:flutterpractise/models/catalog.dart';
import 'package:flutterpractise/widgets/drawer.dart';
import 'package:flutterpractise/widgets/theme.dart';
// import 'package:flutterpractise/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

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
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, int index) {
            var items = CatalogModel.items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: GridTile(
                child: Image.asset(items.image),
                header: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.deepPurple),
                    child: Text(
                      items.name,
                      style: TextStyle(color: Colors.white),
                    )),
                footer: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.black),
                    child: Text(
                      items.price.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}



// code change kr rha velocity package use kro ga oper ab ui ke liye
// Scaffold(
//       appBar: AppBar(
//         title: const Text("Catalog App"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: (CatalogModel.items.isNotEmpty)
//             ? GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     mainAxisSpacing: 16,
//                     crossAxisSpacing: 16,
//                     crossAxisCount: 2),
//                 itemCount: CatalogModel.items.length,
//                 itemBuilder: (context, index) {
//                   final item = CatalogModel.items[index];
//                   return Card(
//                       clipBehavior: Clip.antiAlias,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       child: GridTile(
//                         child: Image.asset(item.image),
//                         header: Container(
//                           padding: const EdgeInsets.all(12),
//                           decoration:
//                               const BoxDecoration(color: Colors.deepPurple),
//                           child: Text(
//                             item.name,
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                         ),
//                         footer: Container(
//                             padding: const EdgeInsets.all(12),
//                             decoration:
//                                 const BoxDecoration(color: Colors.black),
//                             child: Text(item.price.toString(),
//                                 style: const TextStyle(color: Colors.white))),
//                       ));
//                 })
//             : const Center(
//                 child: CircularProgressIndicator(),
//               ),
//       ),
//       drawer: MyDrawer(),
//     );