import 'package:mango/const/firebase.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:mango/login/controller/auth.dart';
import 'cart.dart';
import 'home/home.dart';
import './login/controller/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class appbar extends StatefulWidget {
  const appbar({
    Key? key,
  }) : super(key: key);

  @override
  State<appbar> createState() => _appbarState();
}

class _appbarState extends State<appbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    home(),
    // Text(
    //   'Destiny 3',
    //   style: optionStyle,
    // ),
    Text(
      'Destiny 3',
      style: optionStyle,
    ),
    Person()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 100,
        titleSpacing: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'MANGO',
          style: TextStyle(
            fontSize: 23,
            letterSpacing: 2,
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: Row(
          children: [
            IconButton(
                padding: EdgeInsets.only(left: 10),
                constraints: BoxConstraints(),
                onPressed: () {},
                icon: const Icon(Icons.mail_outline)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_outline))
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              padding: EdgeInsets.only(right: 10),
              constraints: BoxConstraints(),
              onPressed: () {
                debugPrint('bag tapped.');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bag()),
                );
              },
              icon: const Icon(Icons.shopping_bag_outlined)),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Mua sắm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Danh mục',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tôi',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

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
  final _uid = FirebaseAuth.instance.currentUser;
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
        print(myEmail);
      }).catchError((e) {
        print(e);
      });
    }
  }
}
