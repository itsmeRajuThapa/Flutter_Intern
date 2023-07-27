import 'dart:math';
import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import '../list.dart';

class DetailsOfDay4 extends StatefulWidget {
  const DetailsOfDay4({super.key});

  @override
  State<DetailsOfDay4> createState() => _DetailsOfDay4State();
}

class _DetailsOfDay4State extends State<DetailsOfDay4> {
  bool seeAllGridView = false;

  List<String> randomtext = [
    'Cat',
    'Dog',
    'Bike',
    'House',
    'JCB',
    'Biralo',
    'Bus'
  ];

  List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropShadow(
            borderRadius: 20,
            child: Container(
                width: double.infinity,
                color: Colors.amber,
                height: 50,
                child: Column(
                  children: const [
                    Text('Title : I am using title'),
                    Text('Subtitle: This is the subtitle of drop shadow'),
                    Text('Date: 2080-03-31'),
                  ],
                ))),
        SizedBox(
          height: 280,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 140),
                itemCount: seeAllGridView ? 20 : 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: colorList[index % colorList.length]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: networkList[
                                    Random().nextInt(networkList.length)],
                              ),
                            ),
                          ),
                          const Divider(height: 10),
                          Text(
                              "Title:  ${randomtext[Random().nextInt(randomtext.length)]}")
                        ],
                      ));
                },
              ),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                seeAllGridView = !seeAllGridView;
              });
            },
            child: Text(!seeAllGridView ? 'See More' : 'See Less')),
        SizedBox(height: 10),
        Divider(
          thickness: 10,
          color: Colors.black,
        ),
        Expanded(
          child: GridView.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: <Widget>[
              Container(
                color: Colors.purple,
                // height: 20,
              ),
              Container(
                color: Colors.yellow,
                // height: 20,
              ),
              Container(
                color: Colors.green,
                // height: 20,
              ),
              Container(
                color: Colors.purple,
                // height: 20,
              ),
              Container(
                color: Colors.yellow,
                // height: 20,
              ),
              Container(
                color: Colors.green,
                // height: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
