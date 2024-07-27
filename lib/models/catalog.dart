class CatalogModel {
  static List<Item> items = [];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {this.id = 0,
      this.name = "",
      this.desc = "",
      this.price = 0,
      this.color = "",
      this.image = ""});
// factory esliye use kia hai hm ne ab esme ek error a rha tha ke hmy final var ko initialize krna ho ga to login ke basis pr hm factory use kr skty matlab hmy pehly logic lgani ho initialize krna hai to factory ka use ho skta or dosra ye ke factory select krne me help krta jesy 1 classes hai animal aur 2 constructor hai animal aur dog to hmy konsa constructor chahiye to osko factory kr skty

// esme or bat hm ne map se eska class bnaya tha take hm sb set kr sky
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }

  // ab class se map bnaen gy dobara

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}
