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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:mango/const/firebase.dart';

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
List myCart = [];
// addToCart() async{
//   final firebaseUser = await FirebaseAuth.instance.currentUser;
//   firebaseFirestore.collection('users').doc(firebaseUser?.uid).withConverter<Item>(
//     fromFirestore: (snapshot, _) => Item.fromJson(snapshot.data()!),
//       toFirestore: (model, _) => model.toJson(),
//   );
// }

getCart() async {
  final firebaseUser = await FirebaseAuth.instance.currentUser;
  if (firebaseUser != null) {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .get()
        .then((ds) {
      myCart = ds['cart'];
      print(myCart);
    }).catchError((e) {
      print(e);
    });
  }
}

changeTotalPrice() {
  int totalPrice = 0;
  for (int i = 0; i < cart.length; i++) {
    totalPrice = totalPrice + int.parse(cart[i].gia);
  }
  return totalPrice.toString();
}

sale() {
  var f = NumberFormat("###", "en_US");
  double totalPrice = double.parse(changeTotalPrice());
  double sale = totalPrice * 10 / 100;
  // int result = int.parse(sale.toString());
  return f.format(sale).toString();
}

discount() {
  var f = NumberFormat("###", "en_US");
  double totalPrice = double.parse(changeTotalPrice());
  double sale = totalPrice * 90 / 100;
  // int result = int.parse(sale.toString());
  return f.format(sale).toString();
}
