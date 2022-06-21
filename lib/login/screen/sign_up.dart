import 'package:flutter/material.dart';
import 'package:mango/login/controller/auth.dart';
import 'package:provider/provider.dart';

import '../controller/validate.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController newNameController = TextEditingController();
  final TextEditingController newEmailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmpasswordController =
      TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool _isobscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Form(
            key: formState,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) => validateString(value),
                  controller: newNameController,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black38,
                      ),
                    ),
                    labelText: "Họ Tên",
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    labelStyle: TextStyle(color: Colors.black38),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    // validateString(value);
                    if (value == null || value.isEmpty) {
                      return 'Thông tin bắt buộc';
                    } else {
                      return RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)
                          ? null
                          : 'Email không hợp lệ';
                    }
                  },
                  controller: newEmailController,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black38,
                      ),
                    ),
                    labelText: "Email",
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    labelStyle: TextStyle(color: Colors.black38),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Thông tin bắt buộc';
                    else if (value.length < 6) {
                      return 'mật khẩu ít nhất 6 kí tự';
                    } else if (newPasswordController.text !=
                        confirmpasswordController.text)
                      return 'Mật khẩu không giống nhau';
                  },
                  controller: newPasswordController,
                  obscureText: _isobscure,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black38,
                      ),
                    ),
                    labelText: "Password",
                    floatingLabelStyle: TextStyle(color: Colors.black),
                    labelStyle: TextStyle(color: Colors.black38),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Thông tin bắt buộc';
                    else if (value.length < 6) {
                      return 'mật khẩu ít nhất 6 kí tự';
                    } else if (newPasswordController.text !=
                        confirmpasswordController.text)
                      return 'Mật khẩu không giống nhau';
                  },
                  controller: confirmpasswordController,
                  obscureText: _isobscure,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isobscure = !_isobscure;
                          });
                        },
                        icon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.black38,
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black38,
                        ),
                      ),
                      labelText: "Confirm Password",
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black38)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              if (formState.currentState!.validate()) {
                context.read<AuthenticationService>().signUp(
                      name: newNameController.text.trim(),
                      email: newEmailController.text.trim(),
                      password: newPasswordController.text.trim(),
                    );
              }
            },
            child: Text("ĐĂNG KÝ"),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              fixedSize: Size(300, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
            ),
          )
        ],
      ),
    );
  }
}
