import 'dart:ffi';

import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  RxDouble totalCartPrice = 0.0.obs;

  @override
  Void onReady() {
    super.onReady();
    ever(listener, callback)
  }
}
