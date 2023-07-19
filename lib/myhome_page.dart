import 'dart:math';
import 'package:flutter/material.dart';

import 'list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color textColor = Colors.black;
  Color backgroundColor = Colors.purple;

  Icon iconimage = const Icon(Icons.near_me_disabled);

  var count = 0;
  void changeButton() {
    setState(() {
      backgroundColor = _getRandomColor();
    });
  }

  void changeColor() {
    setState(() {
      // Change the text color randomly
      textColor = _getRandomColor();
    });
  }

  void changeIcons() {
    setState(() {
      iconimage = _getRandomIcon();
      imageUrl = _getRandomImage();
    });
  }

  Image _getRandomImage() {
    return networkList[Random().nextInt(networkList.length)];
  }

  Icon _getRandomIcon() {
    return iconList[Random().nextInt(iconList.length)];
  }

  Color _getRandomColor() {
    return colorList[Random().nextInt(colorList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 2 Task'),
        centerTitle: true,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Icon(Icons.add)),
          const SizedBox(width: 20),
          FloatingActionButton(
              onPressed: () {
                setState(() {
                  count--;
                });
              },
              child: const Center(child: Text("-"))),
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            count.toString(),
            style: const TextStyle(fontSize: 25),
          ),
          TextButton(
              onPressed: changeColor,
              //color: Colors.blue,
              style: TextButton.styleFrom(
                  foregroundColor: textColor,
                  // backgroundColor: textColor,
                  textStyle: const TextStyle(fontSize: 24)),
              child: const Text(
                "Ambition Guru",
              )),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: changeButton,
            child: const Text('ElevationButton'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(15),
              elevation: 10,

              //maximumSize: Size(600, 50),
              backgroundColor: backgroundColor,
              textStyle: const TextStyle(fontSize: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(height: 15),
          IconButton(
            onPressed: changeIcons,
            icon: iconimage,
            color: Colors.red,
          ),
          const SizedBox(height: 10),
          Container(
            height: 300,
            width: 400,
            color: Colors.grey,
            child: imageUrl,
          )
        ]),
      ),
    );
  }
}
