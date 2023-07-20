import 'package:flutter/material.dart';
import '../list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showAllItems = false;
  bool _showAllText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day 3"),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
        actions: const [Icon(Icons.brightness_3_outlined)],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              // itemCount: items.length,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 150,
                    width: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          //fit: BoxFit.cover,
                          child: Image.asset(
                            items[index]['image'],
                            fit: BoxFit.cover,
                            height: 100,
                            width: 130,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text('Title: ${items[index]['title']}'),
                        Text('Date: ${items[index]['date']}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Container(
            color: Colors.white,
            height: 475,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Vertical',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                  const Text(
                    'This is the scroll view of Image',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                  SizedBox(
                    // height: 390,
                    height: _showAllItems ? 390 : 300,
                    child: ListView.builder(
                      itemCount: _showAllItems ? 10 : 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: const EdgeInsets.all(3),
                          color: const Color.fromARGB(255, 222, 218, 218),
                          child: ListTile(
                            leading: ClipRRect(
                              child: Image.network(
                                url[index],
                                fit: BoxFit.cover,
                                height: 100,
                                width: 60,
                              ),
                              borderRadius: BorderRadius.circular(110),
                            ),
                            title: Text('Picture $index'),
                            subtitle: Row(
                              children: [
                                const Icon(Icons.newspaper),
                                Text('Description of \n the Image $index')
                              ],
                            ),
                            trailing: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  textStyle: const TextStyle(fontSize: 15)),
                              child: const Text("Click Me"),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showAllItems = !_showAllItems;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      child: Text(
                        _showAllItems ? "Soo Less" : "Soo More",
                        style: TextStyle(color: Colors.white),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Wrap(
                      children: [
                        Text("Properties of Wrap widget"),
                        for (int i = 0;
                            i < (_showAllText ? text.length : 4);
                            i++)
                          Text(text[i]),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _showAllText = !_showAllText;
                              });
                            },
                            child:
                                Text(!_showAllText ? 'See More' : 'See Less'))

                        // Text($text),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
