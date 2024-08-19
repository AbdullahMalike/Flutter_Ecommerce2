import 'package:flutter/material.dart';
import 'package:flutterpractise/models/catalog.dart';
import 'package:flutterpractise/pages/home_page.dart';
import 'package:flutterpractise/widgets/home_widgets/catalog_image.dart';
import 'package:flutterpractise/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

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
        Hero(
            // tag ke through me do chezo ko connect kr skta ho jesy yaha 2 pages connect ho gy product pr click krne pr jo next page pr open ho rhi hai osko animate kre gy
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
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
