import 'package:flutter/material.dart';
import 'package:mango/login/controller/auth.dart';
import 'package:provider/provider.dart';

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

  bool _isobscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
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
          TextField(
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
          TextField(
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
          TextField(
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
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthenticationService>().signUp(
                    name: newNameController.text.trim(),
                    email: newEmailController.text.trim(),
                    password: newPasswordController.text.trim(),
                  );
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
