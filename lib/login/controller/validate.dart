import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

validateString(String? value) {
  return value == null || value.isEmpty ? 'Thông tin bắt buộc' : null;
}

validateNull(String? value1, String? value2) {
  return value1 == null || value1.isEmpty || value2 == null || value2.isEmpty
      ? Get.snackbar(
          "Thông tin giao hàng chưa hợp lệ", 'Vui lòng cập nhật ở mục Cá nhân')
      : Get.snackbar("Đặt hàng thành công", 'Cám ơn bạn đã mua hàng tại MANGO');
}

validatePassword(String? value, var pass1, var pass2) {
  if (value == null || value.isEmpty) {
    return 'Thông tin bắt buộc';
  } else if (value.length < 6) {
    return 'Mật khẩu ít nhất có 6 kí tự';
  } else {
    debugPrint(pass1);
    debugPrint(pass2);
    if (pass1 != pass2) {
      return 'Mật khẩu chưa giống nhau';
    } else
      return null;
  }
}

validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Thông tin bắt buộc';
  } else {
    return RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)
        ? null
        : 'Email không hợp lệ';
  }
}

// validateNumber(String? value) {
//   if (value == null) {
//     return 'null';
//   } else {
//     if (double.tryParse(value) != null) ;
//     // return int.parse(value) < 0 ? 'Input cant smaller than 0' : null;
//   }Z
// }

validateNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Thông tin bắt buộc';
  } else {
    return value.length < 10 ? 'Số điện thoại không hợp lệ' : null;
  }
}
