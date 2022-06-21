import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mango/home/home/details.dart';
import 'package:mango/home/home/details_copy.dart';
import '../const/data.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  // CollectionReference groceries = FirebaseFirestore.instance.collection('test');
  final Stream<QuerySnapshot> product =
      FirebaseFirestore.instance.collection('product').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: product,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('errrror');
        }
        // final data = snapshot.requireData;
        // return ListView.builder(
        //   itemCount: data.size,
        //   itemBuilder: (context, index) {
        //     return Column(
        //       children: [
        //         Text(data.docs[index]['ten']),
        //       ],
        //     );
        //   },
        // );

        return GridView.count(
            crossAxisCount: 2,
            childAspectRatio: .65,
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            //// NEED FIX==============================================
            children: snapshot.data!.docs.map((productss) {
              return Card(
                semanticContainer: true,
                elevation: 0,
                margin: EdgeInsets.symmetric(horizontal: 7),
                shadowColor: Colors.blue,
                child: InkWell(
                  splashColor: Colors.black.withAlpha(30),
                  onTap: () {
                    debugPrint('Card tapped.');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Details(
                                products: productss,
                              )),
                    );
                  },
                  child: Column(
                    children: [
                      Image.network(productss['url']),
                      // Text(productss['ten']),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            productss['gia'].toString() + 'đ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const Icon(
                            Icons.favorite_outline,
                            size: 20,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            productss['ten'],
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList());
      },
    ));
  }
}

// return GridView.extent(
//       padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
//       maxCrossAxisExtent: 250,
//       mainAxisSpacing: 10,
//       // crossAxisSpacing: 10,
//       childAspectRatio: .65,

//       children: listSP
//           .map((sp) => Card(
//                 semanticContainer: true,
//                 elevation: 0,
//                 margin: EdgeInsets.symmetric(horizontal: 7),
//                 shadowColor: Colors.blue,
//                 child: InkWell(
//                   splashColor: Colors.black.withAlpha(30),
//                   onTap: () {
//                     debugPrint('Card tapped.');
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Details(
//                                 Listsp: sp,
//                               )),
//                     );
//                   },
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         child: FittedBox(
//                           child: Image.network(sp.url),
//                           fit: BoxFit.fitWidth,
//                         ),
//                         width: double.infinity,
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             sp.gia + 'đ',
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                           const Icon(
//                             Icons.favorite_outline,
//                             size: 20,
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 5),
//                       Row(
//                         children: [
//                           Text(
//                             sp.ten,
//                             textAlign: TextAlign.left,
//                             style: TextStyle(color: Colors.black54),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ))
//           .toList(),
//     );
//   }


    // Image.asset('assets/images/shopbanner.jpg'),
    //     Container(
    //   child: GridView.builder(
    //       gridDelegate:
    //           SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    //       itemBuilder: (context, index) {
    //         return Card(
    //           elevation: 5,
    //         );
    //       }),
    // );


// GridView.extent(
//           padding:
//               const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
//           maxCrossAxisExtent: 250,
//           mainAxisSpacing: 10,
//           crossAxisSpacing: 10,
//           childAspectRatio: 0.8,
//           children: listSP
//               .map((sp) => Card(
//                     elevation: 1,
//                     shadowColor: Colors.blue,
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           child: Image.network(sp.url),
//                           width: 150,
//                           height: 150,
//                         ),
//                         Text(sp.ten),
//                         Text(
//                           "Giá: ${sp.gia}/kg",
//                           style: const TextStyle(color: Colors.red),
//                         ),
//                       ],
//                     ),
//                   ))
//               .toList(),
//         )