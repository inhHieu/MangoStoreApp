import 'package:flutter/material.dart';
import 'package:mango/home/shop.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 5, vsync: this);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              // isScrollable: true,
              labelPadding: EdgeInsets.zero,
              controller: _tabController,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: 'SHOP'),
                Tab(text: 'PlUS SIZE'),
                Tab(text: 'NAM'),
                Tab(text: 'NỮ'),
                Tab(text: 'TRẺ EM'),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.maxFinite,
              height: 568,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Shop(),
                  // Text('1'),
                  Text('2'),
                  Text('3'),
                  Text('3'),
                  Text('3'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
