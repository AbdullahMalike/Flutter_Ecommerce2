import 'package:flutter/material.dart';
import 'package:flutterpractise/models/catalog.dart';
import 'package:flutterpractise/pages/home_detailed_page.dart';
import 'package:flutterpractise/pages/home_page.dart';
import 'package:flutterpractise/widgets/home_widgets/catalog_item.dart';

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
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetail(catalog: catalog))),
            child: CatalogItem(
              // hm jb nechy Item ka constructor bnaty hai yaha error aya ke esko nameed bnana ho ga
              catalog: catalog,
            ),
          );
        });
  }
}
