import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../login/controller/auth.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: Text('logout'),
        onPressed: () {
          context.read<AuthenticationService>().signout();
        },
      )),
    );
  }
}
