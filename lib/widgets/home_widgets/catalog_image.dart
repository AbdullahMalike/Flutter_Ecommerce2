import 'package:flutter/material.dart';
import 'package:flutterpractise/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

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
