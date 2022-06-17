import 'package:flutter/material.dart';
import 'shop.dart';
import 'package:mango/cart.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Details extends StatelessWidget {
  final products;
  Details({Key? key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              //body
              Image.network(products['url']),
              // const SizedBox(height: 7),
              Container(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          products['ten'],
                          style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 13,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              color: Colors.black87),
                        ),
                        Text(
                          products['gia'],
                          style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            onPressed: () {},
                            icon: Icon(Icons.ios_share_sharp)),
                        RatingBar.builder(
                          initialRating: 3.4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15,
                          ignoreGestures: true,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 10,
                color: Colors.black12,
              ),
              Image.network(products['url']),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag_outlined)),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_horiz)),
              ],
            )
          ],
        ),
        Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Colors.white,
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border_outlined)),
                  ElevatedButton(
                    onPressed: () {
                      // cart = cart + products;
                      // debugPrint(cart[0]);
                    },
                    child: Text('THÊM VÀO GIỎ HÀNG'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      fixedSize: Size(300, 35),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}

/* return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_bag_outlined)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_horiz)),
                  ],
                )
              ],
            ),
            //body
            Image.network(products['url']),
            Image.network(products['url']),
            // const SizedBox(height: 7),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        products['ten'],
                        style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 10,
                            color: Colors.grey),
                      ),
                      Text(
                        products['gia'],
                        style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                          icon: const Icon(Icons.ios_share_sharp)),
                      RatingBar.builder(
                        initialRating: 3.4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15,
                        ignoreGestures: true,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  } */

/*ListView(
      padding: EdgeInsets.all(0),
      children: [
        Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     IconButton(
            //       icon: const Icon(Icons.arrow_back_ios),
            //       onPressed: () {
            //         Navigator.pop(context);
            //       },
            //     ),
            //     Row(
            //       children: [
            //         IconButton(
            //             onPressed: () {},
            //             icon: const Icon(Icons.shopping_bag_outlined)),
            //         IconButton(
            //             onPressed: () {}, icon: const Icon(Icons.more_horiz)),
            //       ],
            //     )
            //   ],
            // ),
            //body
            Image.network(Listsp.url),
            Image.network(Listsp.url),
            // const SizedBox(height: 7),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        Listsp.ten,
                        style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 10,
                            color: Colors.grey),
                      ),
                      Text(
                        Listsp.gia,
                        style: const TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {},
                          icon: Icon(Icons.ios_share_sharp)),
                      RatingBar.builder(
                        initialRating: 3.4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15,
                        ignoreGestures: true,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }*/