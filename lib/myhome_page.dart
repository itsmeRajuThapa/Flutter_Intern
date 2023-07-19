import 'dart:math';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color textColor = Colors.black;
  List<Color> _colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];

  List<Icon> _iconList = [
    Icon(Icons.featured_video),
    Icon(Icons.alarm_add),
    Icon(Icons.soap_outlined),
    Icon(Icons.media_bluetooth_off),
    Icon(Icons.headphones)
  ];
  Icon iconimage = Icon(Icons.near_me_disabled);

  List<Image> _networkList = [
    Image.network(
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic.pexels.com%2Fphotos%2F63764%2Fpexels-photo-63764.jpeg&f=1&nofb=1&ipt=ad3ad94f8d25c20c709bc46c4f7779101c4414b1fc24528c55f228dfb57f50d4&ipo=images'),
    Image.network('https://wallpapercave.com/wp/wp8030431.jpg'),
    Image.network(
        'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwallpapercave.com%2Fwp%2Fwp1882082.jpg&f=1&nofb=1&ipt=1ab14dfc4663924e2aff1c05bd59cbf1aa59920a82c89689f7dedfc113afa694&ipo=images'),
    Image.network(
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperheart.com%2Fwp-content%2Fuploads%2F2018%2F08%2Fbike-wallpaper-12.jpg&f=1&nofb=1&ipt=5bb75ad76f686117075a184af1c9ac03793106b11d8028236b1bc71f56c2abb0&ipo=images'),
    Image.network(
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2Fb84W3hAu02Q%2Fmaxresdefault.jpg&f=1&nofb=1&ipt=dd4039911525bae91d5859ccbb0e677966f0119dec0804bf072e76f348d0b519&ipo=images')
  ];
  Image imageUrl = Image.network(
      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.wallpaperup.com%2Fuploads%2Fwallpapers%2F2015%2F07%2F03%2F741745%2F2f09e4a0a7fb09aeacc5a0b82eb9f0a9.jpg&f=1&nofb=1&ipt=bd4f5b1635c9f550f58b4d1e6bac249ce227babd2253d4322ff0359292718b31&ipo=images');

  var count = 0;
  void changeButton() {
    setState(() {
      textColor = _getRandomColor();
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
    return _networkList[Random().nextInt(_networkList.length)];
  }

  Icon _getRandomIcon() {
    return _iconList[Random().nextInt(_iconList.length)];
  }

  Color _getRandomColor() {
    return _colorList[Random().nextInt(_colorList.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Day 2 Task'),
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
              child: Icon(Icons.add)),
          SizedBox(width: 20),
          FloatingActionButton(
              onPressed: () {
                setState(() {
                  count--;
                });
              },
              child: Center(child: Text("-"))),
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            count.toString(),
            style: TextStyle(fontSize: 25),
          ),
          TextButton(
              onPressed: changeColor,
              //color: Colors.blue,
              style: TextButton.styleFrom(
                  foregroundColor: textColor,
                  // backgroundColor: textColor,
                  textStyle: TextStyle(fontSize: 24)),
              child: Text(
                "Ambition Guru",
              )),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('ElevationButton'),
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(8),
                //maximumSize: Size(600, 50),
                backgroundColor: textColor,
                textStyle: TextStyle(fontSize: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          SizedBox(height: 15),
          IconButton(
            onPressed: changeIcons,
            icon: iconimage,
            color: Colors.red,
          ),
          SizedBox(height: 10),
          Container(
            height: 400,
            width: 400,
            child: imageUrl,
          )
        ]),
      ),
    );
  }
}
