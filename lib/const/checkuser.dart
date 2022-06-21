import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login/screen/startingpage.dart';
import '../screen/appbar.dart';

class Checkuser extends StatelessWidget {
  const Checkuser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return appbar();
    }
    return Startpage();
  }
}
