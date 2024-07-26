class CatalogModel {
  static final items = [
    Item(
        id: "Product01",
        name: "Iphone 8 Plus",
        desc: "Iphone 8 Plus 64 GB Space Grey Color",
        price: 50000,
        color: "Space Grey",
        image: "assets/images/8plus.jpg"),
    Item(
        id: "Product02",
        name: "Iphone 7",
        desc: "Iphone 7 32 GB Black Color",
        price: 50000,
        color: "Black",
        image: "assets/images/8plus.jpg"),
  ];
}

class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {this.id = "",
      this.name = "",
      this.desc = "",
      this.price = 0,
      this.color = "",
      this.image = ""});
}
