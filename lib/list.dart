import 'package:flutter/material.dart';

List<Color> colorList = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.orange,
];
List<Icon> iconList = [
  Icon(Icons.featured_video),
  Icon(Icons.alarm_add),
  Icon(Icons.soap_outlined),
  Icon(Icons.media_bluetooth_off),
  Icon(Icons.headphones)
];

List<Image> networkList = [
  Image.network(
      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic.pexels.com%2Fphotos%2F63764%2Fpexels-photo-63764.jpeg&f=1&nofb=1&ipt=ad3ad94f8d25c20c709bc46c4f7779101c4414b1fc24528c55f228dfb57f50d4&ipo=images'),
  Image.network('https://wallpapercave.com/wp/wp8030431.jpg'),
  Image.network(
      'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwallpapercave.com%2Fwp%2Fwp1882082.jpg&f=1&nofb=1&ipt=1ab14dfc4663924e2aff1c05bd59cbf1aa59920a82c89689f7dedfc113afa694&ipo=images'),
  Image.network(
      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperheart.com%2Fwp-content%2Fuploads%2F2018%2F08%2Fbike-wallpaper-12.jpg&f=1&nofb=1&ipt=5bb75ad76f686117075a184af1c9ac03793106b11d8028236b1bc71f56c2abb0&ipo=images'),
  Image.network(
      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2Fb84W3hAu02Q%2Fmaxresdefault.jpg&f=1&nofb=1&ipt=dd4039911525bae91d5859ccbb0e677966f0119dec0804bf072e76f348d0b519&ipo=images'),
  Image.network(
      'https://img.staticmb.com/mbcontent/images/uploads/2022/12/Most-Beautiful-House-in-the-World.jpg'),
  Image.network(
      'https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg?size=626&ext=jpg'),
  Image.network(
      'https://img.freepik.com/free-photo/pug-dog-isolated-white-background_2829-11416.jpg?w=740&t=st=1689756593~exp=1689757193~hmac=b0645c139b27a9c8b948c55c24cef18045741c331baef739623fd978b2a47b4a'),
  Image.network(
      'https://www.thesprucepets.com/thmb/APYdMl_MTqwODmH4dDqaY5q0UoE=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/all-about-tabby-cats-552489-hero-a23a9118af8c477b914a0a1570d4f787.jpg'),
  Image.network(
      'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.wallpaperup.com%2Fuploads%2Fwallpapers%2F2015%2F07%2F03%2F741745%2F2f09e4a0a7fb09aeacc5a0b82eb9f0a9.jpg&f=1&nofb=1&ipt=bd4f5b1635c9f550f58b4d1e6bac249ce227babd2253d4322ff0359292718b31&ipo=images')
];
Image imageUrl = Image.network(
    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.wallpaperup.com%2Fuploads%2Fwallpapers%2F2015%2F07%2F03%2F741745%2F2f09e4a0a7fb09aeacc5a0b82eb9f0a9.jpg&f=1&nofb=1&ipt=bd4f5b1635c9f550f58b4d1e6bac249ce227babd2253d4322ff0359292718b31&ipo=images');

final List<Map<String, dynamic>> items = [
  {'image': 'assets/b1.jpeg', 'title': 'Hello Hey', 'date': '2056-07-00'},
  {'image': 'assets/b2.jpeg', 'title': 'Hirgeg', 'date': '2080-09-00'},
  {'image': 'assets/b3.jpeg', 'title': 'Image3.jpeg', 'date': '2059-07-01'},
  {'image': 'assets/b4.jpeg', 'title': 'Image4.jpeg', 'date': '2056-04-03'},
  {'image': 'assets/b5.jpeg', 'title': 'Image4.jpeg', 'date': '2057-47-05'},
  {'image': 'assets/b6.jpeg', 'title': 'Image5.jpeg', 'date': '2050-47-07'},
  {'image': 'assets/b7.jpeg', 'title': 'Image6.jpeg', 'date': '2059-47-08'},
  {'image': 'assets/b8.jpeg', 'title': 'Image7.jpeg', 'date': '2056-47-09'},
  {'image': 'assets/b9.jpeg', 'title': 'Image8.jpeg', 'date': '2066-47-17'},
  {'image': 'assets/b10.jpeg', 'title': 'Image9.jpeg', 'date': '2078-47-19'},
];

List<String> url = [
  'https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg?size=626&ext=jpg',
  'https://img.staticmb.com/mbcontent/images/uploads/2022/12/Most-Beautiful-House-in-the-World.jpg',
  'https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg?size=626&ext=jpg',
  'https://img.staticmb.com/mbcontent/images/uploads/2022/12/Most-Beautiful-House-in-the-World.jpg',
  'https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg?size=626&ext=jpg',
  'https://img.staticmb.com/mbcontent/images/uploads/2022/12/Most-Beautiful-House-in-the-World.jpg',
  'https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg?size=626&ext=jpg',
  'https://img.staticmb.com/mbcontent/images/uploads/2022/12/Most-Beautiful-House-in-the-World.jpg',
  'https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg?size=626&ext=jpg',
  'https://img.staticmb.com/mbcontent/images/uploads/2022/12/Most-Beautiful-House-in-the-World.jpg',
  'https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg?size=626&ext=jpg',
  'https://img.staticmb.com/mbcontent/images/uploads/2022/12/Most-Beautiful-House-in-the-World.jpg',
];
List text = [
  '•	direction: By default, the axis is horizontal but we can make it vertical by changing the axis from Axis.horizontal to Axis.vertical',
  '•	alignment: We can set the alignment property to align widgets. (for ex : alignment : WrapAlignment.center)',
  '•	spacing: We can give space between the children.',
  '•	runAlignment: It shows how runs themselves should be placed in the cross axis. By default, we have runAlignment as WrapAlignment.start.',
  '•	runSpacing: We can give runSpacing between the runs. (ex: runSpacing:5.0).',
  '•	crossAxisAlignment: We can align the children relative to each other in cross Axis.',
  '•	textDirection : We can arrange children in a row using textDirection (for ex : textDirection: TextDirection.rtl to arrange from right to left).',
  '•	clipBehaviour: This property takes in Clip enum as the object to decide whether the content inside the Wrap widget will be clipped or not.',
  '•	runtimeType: Type class is the object given to the runtimeType property. It determines the type of the Wrap widget at the run time.',
  '•	key: This property decides how one widget will replace another widget on the screen.',
  '•	haskCode: This property takes in an int value as the object which represents the state of the widget.',
];
