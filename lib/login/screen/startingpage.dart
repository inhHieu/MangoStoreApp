import 'package:flutter/material.dart';
import 'package:mango/login/screen/sign_in.dart';
import 'package:mango/login/screen/sign_up.dart';

class Startpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'MANGO',
            style: TextStyle(
              fontSize: 23,
              letterSpacing: 2,
              fontWeight: FontWeight.w900,
            ),
          ),
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          bottom: const TabBar(
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            tabs: [
              Text('ĐĂNG KÝ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              Text('ĐĂNG NHẬP',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: SignUpPage(),
            ),
            Center(
              child: SignInPage(),
            ),
          ],
        ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     TextField(
        //       controller: emailController,
        //       decoration: InputDecoration(
        //         labelText: "Email",
        //       ),
        //     ),
        //     TextField(
        //       controller: passwordController,
        //       decoration: InputDecoration(
        //         labelText: "Password",
        //       ),
        //     ),
        //     ElevatedButton(
        //         onPressed: () {
        //           context.read<AuthenticationService>().signIn(
        //                 email: emailController.text.trim(),
        //                 password: passwordController.text.trim(),
        //               );
        //         },
        //         child: Text("Sign In"))
        //   ],
        // ),
      ),
    );
  }
}
