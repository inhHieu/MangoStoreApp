import 'package:flutter/material.dart';
// import 'package:stripe_payment/stripe_payment.dart';
// import 'package:flutter_stripe/payment_service.dart';
import './payment_controller.dart';
import 'cart_controller.dart';

class PaymentConfirm extends StatefulWidget {
  const PaymentConfirm({Key? key}) : super(key: key);

  @override
  State<PaymentConfirm> createState() => _PaymentConfirmState();
}

class _PaymentConfirmState extends State<PaymentConfirm> {
  // PaymentMethod? paymentMethod;
  @override
  void initState() {
    super.initState();
    // PaymentService.init();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'Xác nhận Đặt hàng',
          style: TextStyle(
            // fontSize: 16,
            // letterSpacing: 2,
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.black12,
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  //user information
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [Text('username'), Text('userphonenumber')],
                        ),
                        Text('useraddress'),
                        Text('useraddressindetails'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  //user information
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text('Phương pháp vận chuyển',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          children: [
                            IconButton(
                              padding: const EdgeInsets.only(right: 5),
                              constraints: const BoxConstraints(),
                              onPressed: () {},
                              icon: const Icon(Icons.circle_outlined),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Giao Hàng tiêu chuẩn'),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: RichText(
                                      text: const TextSpan(
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                          ),
                                          children: [
                                        TextSpan(
                                            text: 'MANGO: 0đ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text:
                                                ' Đơn hàng đã được đặt, dự kiến sẽ đến trước 5 ngày sau.'),
                                      ])),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //====
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('MANGO'),
                              Text(cart.length.toString() + ' sản phẩm'),
                            ],
                          ),
                        ),
                        Container(
                          height: 150,
                          // color: Colors.black,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: cart.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    child: Image.network(cart[index].url),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //=======
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Giá gốc:'),
                            Text(changeTotalPrice())
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Giảm:'), Text(sale())],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Giá còn'), Text(discount())],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Phí vận chuyển:'), Text('0')],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //====
              ],
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Text(
                                'Tổng cộng',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              discount(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () /*async */ {
                                // debugPrint(discout());
                                // paymentMethod =
                                //     await PaymentService().createPaymentMethod();
                                // print(paymentMethod!.id);
                              },
                              child: const Text(
                                'ĐẶT HÀNG',
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
                            )),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
