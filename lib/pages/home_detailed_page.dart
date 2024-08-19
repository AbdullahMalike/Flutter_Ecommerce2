import 'package:flutter/material.dart';
import 'package:flutterpractise/models/catalog.dart';
import 'package:flutterpractise/widgets/theme.dart';
// import 'package:flutterpractise/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  final Item catalog;
  const HomeDetail({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamcolor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "Pkr ${catalog.price}".text.xl2.bold.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(MyTheme.darkbluish),
                        shape: WidgetStateProperty.all(const StadiumBorder())),
                    child: "Buy".text.make())
                .wh(100, 40)
          ],
        ).p32(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.asset(catalog.image))
                .h32(context)
                .p16(),
            Expanded(
              // arch se curve a rha hai container pr hmary
              child: VxArc(
                arcType: VxArcType.convey,
                height: 30.0,
                edge: VxEdge.top,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl3.make(),
                      HeightBox(10),
                      catalog.desc.text.make()
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
