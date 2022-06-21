import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mango/login/controller/validate.dart';
import 'package:provider/provider.dart';

import '../../login/controller/auth.dart';

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
  late String mySDT;
  late String myAddress;
  // DocumentReference user = firebaseFirestore.collection('user').doc('a');
  // final _uid = FirebaseAuth.instance.currentUser;
  // final Stream<QuerySnapshot> user =
  //     FirebaseFirestore.instance.collection('users').doc(_uid.uid).get();
  @override
  Widget build(BuildContext context) {
    final TextEditingController addressController = TextEditingController();
    final TextEditingController sdtController = TextEditingController();
    GlobalKey<FormState> formState = GlobalKey<FormState>();

    return Column(children: [
      FutureBuilder(
        future: _fetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const CircularProgressIndicator();
          } else {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Chào ' + myName),
                  const SizedBox(height: 5),
                  Text('Email: ' + myEmail),
                  const SizedBox(height: 5),
                  Text('SDT: ' + mySDT),
                  const SizedBox(height: 5),
                  Text('Địa chỉ nhận hàng: ' + myAddress),
                  const SizedBox(height: 5),
                  Form(
                    key: formState,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) => validateString(value),
                          controller: addressController,
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                            ),
                            labelText: "Địa chỉ",
                            floatingLabelStyle: TextStyle(color: Colors.black),
                            labelStyle: TextStyle(color: Colors.black38),
                          ),
                        ),
                        TextFormField(
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          keyboardType: TextInputType.number,
                          validator: (value) => validateNumber(value),
                          controller: sdtController,
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black38,
                              ),
                            ),
                            labelText: "Số điện thoại",
                            floatingLabelStyle: TextStyle(color: Colors.black),
                            labelStyle: TextStyle(color: Colors.black38),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (formState.currentState!.validate()) {
                            await context.read<AuthenticationService>().edit(
                                  sdt: sdtController.text.trim(),
                                  address: addressController.text.trim(),
                                );
                            setState(() {});
                          }
                        },
                        child: Text('Update'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          // fixedSize: Size(300, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 100),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<AuthenticationService>().signout();
                      },
                      child: Text('Đăng Xuất'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        fixedSize: Size(300, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                      ),
                    ),
                  ),
                ],
              ),
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
        myAddress = ds['address'];
        mySDT = ds['sdt'];
        print(myName);
      }).catchError((e) {
        print(e);
      });
    }
  }
}
