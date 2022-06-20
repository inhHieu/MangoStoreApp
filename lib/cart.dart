import 'package:flutter/material.dart';
import 'package:mango/payment.dart';
import 'cart_controller.dart';

class Bag extends StatefulWidget {
  const Bag({Key? key}) : super(key: key);

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  late String price = changeTotalPrice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'Giỏ hàng',
          style: TextStyle(
            // fontSize: 16,
            // letterSpacing: 2,
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_outline))
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 50),
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black12,
                            width: 1,
                          ),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: [
                          // IconButton(
                          //   padding: EdgeInsets.all(0),
                          //   constraints: BoxConstraints(),
                          //   onPressed: () {},
                          //   icon: const Icon(Icons.circle_outlined),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Image.network(cart[index].url),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(cart[index].ten),
                                Text(
                                  cart[index].gia,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Container(
                      // color: Colors.red,
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.only(right: 5),
                                constraints: BoxConstraints(),
                                onPressed: () {},
                                icon: const Icon(Icons.circle_outlined),
                              ),
                              Text('Tất cả'),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  price,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // debugPrint(discout());
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PaymentConfirm()),
                                  );
                                },
                                child: const Text(
                                  'Thanh toán',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  fixedSize: const Size(150, 35),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0)),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
