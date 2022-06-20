// import 'package:http/http.dart';
// import 'package:stripe_payment/stripe_payment.dart';

// class PaymentService {
//   final int amount;
//   final String url;

//   PaymentService({this.amount = 10, this.url = ''});
//   static init() {
//     StripePayment.setOptions(
//       StripeOptions(
//         publishableKey:
//             'pk_test_51LCP1HIunA1xo8cxZcaiZ2K9KyZ3hEmfwBf0qvrZlVX9CeE9tgDmtn3HB1ieELPwZN91124D81Xvu8acBDvEALhH00poYX2Mwh',
//         androidPayMode: 'test',
//         merchantId: 'test',
//       ),
//     );
//   }

//   Future<PaymentMethod?> createPaymentMethod() async {
//     print('$amount');
//     PaymentMethod paymentMethod =
//         await StripePayment.paymentRequestWithCardForm(
//       CardFormPaymentRequest(),
//     );
//     return paymentMethod;
//   }

//   Future<void> processPayment(PaymentMethod paymentMethod) async {}
// }
