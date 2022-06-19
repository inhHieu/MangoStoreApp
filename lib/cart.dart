// class CartItemModel {
//   static const ID = "id";
//   static const IMAGE = "image";
//   static const NAME = "name";
//   static const QUANTITY = "quantity";
//   static const COST = "cost";
//   static const PRICE = "price";
//   static const PRODUCT_ID = "productId";

//   String id;
//   String image;
//   String name;
//   int quantity;
//   double cost;
//    String productId;
//    double price;

//   CartItemModel({this.productId, this.id, this.image, this.name, this.quantity, this.cost});

//   CartItemModel.fromMap(Map<String, dynamic> data){
//     id = data[ID];
//     image = data[IMAGE];
//     name = data[NAME];
//     quantity = data[QUANTITY];
//     cost = data[COST].toDouble();
//     productId = data[PRODUCT_ID];
//     price = data[PRICE].toDouble();

//   }

//   Map toJson() => {
//     ID: id,
//     PRODUCT_ID: productId,
//     IMAGE: image,
//     NAME: name,
//     QUANTITY: quantity,
//     COST: price * quantity,
//     PRICE: price
//   };

// }

class Item {
  String id;
  String ten;
  String gia;
  String url;
  int soluong;
  Item(this.id, this.ten, this.gia, this.url, this.soluong);
  factory Item.formJson(dynamic json) {
    return Item(json['id'] as String, json['ten'] as String,
        json['gia'] as String, json['url'] as String, json['soluong'] as int);
  }
  @override
  String toString() {
    return '{${this.id},${this.ten},${this.gia},${this.url},}';
  }
}

List<Item> cart = <Item>[];

changeTotalPrice() {
  int totalPrice = 0;
  for (int i = 0; i < cart.length; i++) {
    totalPrice = totalPrice + int.parse(cart[i].gia);
  }
  return totalPrice.toString();
}
