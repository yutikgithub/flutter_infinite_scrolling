import 'package:flutter/material.dart';
import 'package:new_maps/widget/tab_one.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Maps'),
          centerTitle: true,
          elevation: 0.sp,
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'ADVENTURE',
              ),
              Tab(
                text: 'CREATION',
              ),
              Tab(
                text: 'CUSTOM TERRAIN',
              ),
              Tab(
                text: 'MINIGAME',
              ),
              Tab(
                text: 'PARKOUR',
              ),
              Tab(
                text: 'PVP',
              ),
              Tab(
                text: 'REDSTONE',
              ),
              Tab(
                text: 'SURVIVAL',
              ),
            ]
            ),
        ),
        body: const TabBarView(
          children: [
            TabOne(0),
            TabOne(1),
            TabOne(2),
            TabOne(3),
            TabOne(4),
            TabOne(5),
            TabOne(6),
            TabOne(7),
          ],
        ),
      ));
  }
}
