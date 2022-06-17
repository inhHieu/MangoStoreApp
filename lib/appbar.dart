import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:mango/login/controller/auth.dart';
import 'bag.dart';
import 'home/home.dart';

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
    person()
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

class person extends StatelessWidget {
  const person({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.read<AuthenticationService>().signout();
        },
        child: Text('signed out'));
  }
}
