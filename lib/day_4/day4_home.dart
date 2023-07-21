import 'package:flutter/material.dart';
import '../day_3/home_screen.dart';
import '../myhome_page.dart';
import 'customscrollview.dart';
import 'day4_details.dart';

class Day4Screen extends StatefulWidget {
  const Day4Screen({super.key});

  @override
  State<Day4Screen> createState() => _Day4ScreenState();
}

class _Day4ScreenState extends State<Day4Screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(" Assessment 4"),
          centerTitle: true,
          leading: const Icon(Icons.sunny),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomeScrollView()));
                },
                icon: Icon(Icons.near_me_outlined))
          ],
          bottom: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.grey),
              indicatorColor: Colors.amber,
              // indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(
                    icon: Icon(Icons.home, color: Colors.red),
                    child: Text("Day 2 Tab")),
                Tab(
                    icon: Icon(Icons.settings, color: Colors.red),
                    child: Text("Day 3 Tab")),
                Tab(
                    icon: Icon(Icons.newspaper, color: Colors.red),
                    child: Text("Day 4 Tab")),
              ]),
        ),
        body: const TabBarView(children: [
          MyHomePage(),
          HomeScreen(),
          DetailsOfDay4(),
        ]),
      ),
    );
  }
}
