import 'package:flutter/foundation.dart';
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
    await Future.delayed(const Duration(seconds: 2));
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
      backgroundColor: MyTheme.creamcolor,
      body: SafeArea(
        child: Container(
          padding: Vx.m20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // esem header ka code nechy alag class me bna kr yaha call krlia
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                Cataloglist().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkbluish).make(),
        "Trending Products".text.xl2.make()
      ],
    );
  }
}

class Cataloglist extends StatelessWidget {
  const Cataloglist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          var catalog = CatalogModel.items[index];
          // esme hm ye kr rhy hai ke item ko catalog me save krwa kr CatalogItem class me dy rhy hai ye sirf data provide kr rha display CatalogItem class krwaen gi
          return CatalogItem(
            // hm jb nechy Item ka constructor bnaty hai yaha error aya ke esko nameed bnana ho ga
            catalog: catalog,
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  // assert esme hmy debug me ye bta dy ga ke esme koi value null ho rhi hai
  const CatalogItem({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.color(MyTheme.darkbluish).lg.bold.make().py2(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "Pkr ${catalog.price}".text.xl.bold.make(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(MyTheme.darkbluish),
                          shape:
                              WidgetStateProperty.all(const StadiumBorder())),
                      child: "Buy".text.make())
                ],
              ).pOnly(right: 8.0)
            ],
          ),
        )
      ],
    )).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  // esme hm image ko string me rkh rhy hai or oska constructor bna rhy hai or oper catalog image ke parameter me pass kr rhy hai es image ko
  final String image;
  const CatalogImage({super.key, required this.image}) : assert(Image != null);

  @override
  Widget build(BuildContext context) {
    return Image.asset(image)
        .box
        .color(MyTheme.creamcolor)
        .rounded
        .make()
        .p12()
        .w32(context);
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
