import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mango/home/home/details.dart';
import 'package:mango/home/home/details_copy.dart';
import '../const/data.dart';

class Baby extends StatefulWidget {
  const Baby({Key? key}) : super(key: key);

  @override
  State<Baby> createState() => _BabyState();
}

class _BabyState extends State<Baby> {
  // CollectionReference groceries = FirebaseFirestore.instance.collection('test');
  final Stream<QuerySnapshot> product = FirebaseFirestore.instance
      .collection('product')
      .where('sex', isEqualTo: 'baby')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: product,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('errrror');
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

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
