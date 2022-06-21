import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Person extends StatefulWidget {
  const Person({
    Key? key,
  }) : super(key: key);

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  late String myName;
  late String myEmail;
  // DocumentReference user = firebaseFirestore.collection('user').doc('a');
  // final _uid = FirebaseAuth.instance.currentUser;
  // final Stream<QuerySnapshot> user =
  //     FirebaseFirestore.instance.collection('users').doc(_uid.uid).get();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FutureBuilder(
        future: _fetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator();
          } else {
            return Column(
              children: [
                Text('Chào ' + myName),
                Text('Email: ' + myEmail),
              ],
            );
          }
        },
      ),
    ]);
    // return StreamBuilder(
    //   stream: user,
    //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //     if (snapshot.hasError) {
    //       return Text('errrror');
    //     }
    //     return Column(
    //       children: [Text(_uid.toString())],
    // crossAxisCount: 2,
    // childAspectRatio: .65,
    // padding:
    //     const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
    // mainAxisSpacing: 10,
    // crossAxisSpacing: 10,
    //// NEED FIX==============================================
    //     children:
    //     snapshot.data!.docs.map((user) {
    //   return Text(user['name']);
    // }).toList(),
    //   );
    // },
    // );
  }

  // getname(user){
  //       String _uid = _firebaseAuth.currentUser!.uid;
  //   if(user['id'] == )
  // }
  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        myName = ds['name'];
        myEmail = ds['email'];
        print(myName);
      }).catchError((e) {
        print(e);
      });
    }
  }
}
