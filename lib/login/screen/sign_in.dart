import 'package:flutter/material.dart';
import 'package:mango/login/controller/auth.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool _isobscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: emailController,
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
            controller: passwordController,
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
                labelText: "Password",
                floatingLabelStyle: TextStyle(color: Colors.black),
                labelStyle: TextStyle(color: Colors.black38)),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                    );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                fixedSize: Size(300, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
              ),
              child: const Text("ĐĂNG NHẬP",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)))
        ],
      ),
    );
  }
}
