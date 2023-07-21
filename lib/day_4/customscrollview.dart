import 'package:flutter/material.dart';

import '../list.dart';

class CustomeScrollView extends StatefulWidget {
  const CustomeScrollView({super.key});

  @override
  State<CustomeScrollView> createState() => _CustomeScrollViewState();
}

class _CustomeScrollViewState extends State<CustomeScrollView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        const SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Custom Scroll Views'),
            )),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          childCount: 3,
          (BuildContext context, int index) {
            // for (var i = 1; i <= 10; i++)
            return Container(
              height: 250,
              color: Colors.grey,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 194, 119, 171),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 60,
                      child: ListTile(
                        leading: const CircleAvatar(),
                        title: Text('Hello Word $index'),
                        subtitle: Text('Subtitle of ListTitle'),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        )),
      ]),
    );
  }
}
