import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:vibration/vibration.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Restaurant Booking")),
      body: ListView.builder(
        itemCount: _images.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_images[index].Restname),
            leading: Hero(
              tag: index,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network(_images[index].Image,
                    width: 100, fit: BoxFit.cover),
              ),
            ),
            onTap: () {
              Vibration.vibrate();
              getlocation();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SecondPage(heroTag: index)));
            },
          );
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final int heroTag;

  const SecondPage({required this.heroTag});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_images[heroTag].Restname)),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: heroTag,
                child: Image.network(_images[heroTag].Image),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Restaurant Address :" + _images[heroTag].Address,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: Text(
              "your current Address :" + Address,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}

// Restaurants object
class Restaurants {
  int Id;
  String Restname;
  String Image;
  String Address;
  Restaurants(
      {required this.Id,
      required this.Restname,
      required this.Address,
      required this.Image});
}

// Object in an array
final List<Restaurants> _images = [
  Restaurants(
      Id: 1,
      Restname: 'Hard Rock Cafe',
      Address: '12 Fleet St, Temple Bar, Dublin, D02 NW56',
      Image:
          'https://cdn.shopify.com/s/files/1/0539/5195/5137/files/2e45963e-563b-43f4-885b-6c582bcc9815_4c81c1c2-19f0-406a-9f85-b3a6c35bc5cf_1200x1049.jpg?v=1613929087'),
  Restaurants(
      Id: 2,
      Restname: 'Temple bar',
      Address: '47-48 Temple Bar, Dublin, Ireland Dublin 2. ',
      Image:
          'https://fastly.4sqi.net/img/general/600x600/7887623_3E--3SzFTEAhmV89vz0w726thTCTHu4caPg5XtRQBLM.jpg'),
  Restaurants(
      Id: 3,
      Restname: 'Peperina Garden Bistro',
      Address: '25 Dunville Ave, Ranelagh, Dublin 6, D06 F8N8',
      Image:
          'https://media-cdn.tripadvisor.com/media/photo-s/03/6b/cd/3a/peperina-garden-bistro.jpg'),
  Restaurants(
      Id: 4,
      Restname: 'Izumi Japanese Sushi & Chinese',
      Address: '110 Drumcondra Rd Upper, Drumcondra, Dublin 9, D09 YF84',
      Image:
          'https://static.wixstatic.com/media/6f35c2_3c1dadb0fe614521bb5edc012305352c~mv2.jpg/v1/fill/w_640,h_480,fp_0.73_0.51,q_80,usm_0.66_1.00_0.01,enc_auto/6f35c2_3c1dadb0fe614521bb5edc012305352c~mv2.jpg'),
  Restaurants(
      Id: 5,
      Restname: 'Laylas Rooftop Restaurant',
      Address: '17 Ranelagh, Dublin, D06 R3N0',
      Image: 'https://resizer.otstatic.com/v2/photos/wide-huge/3/27877894.jpg'),
  Restaurants(
      Id: 6,
      Restname: 'Pizza Yard',
      Address: '7 Sandford Rd, Ranelagh, Dublin 6, D06 A2P4',
      Image:
          'https://media-cdn.tripadvisor.com/media/photo-s/13/35/c2/a0/pizza-yard-ranelagh.jpg'),
  Restaurants(
      Id: 7,
      Restname: 'The Little Kitchen',
      Address: '129 Leeson Street Upper, Dublin 4, D04 YX03',
      Image:
          'https://media-cdn.tripadvisor.com/media/photo-s/08/8d/1e/a7/the-little-kitchen.jpg'),
  Restaurants(
      Id: 8,
      Restname: 'TriBeCa',
      Address: '65 Ranelagh, Dublin 6, D06 VX38',
      Image:
          'https://pbs.twimg.com/media/FjWuP26XEAEgVng?format=jpg&name=large'),
  Restaurants(
      Id: 9,
      Restname: 'Cinnamon Ranelagh',
      Address: '87 Ranelagh, Dublin 6',
      Image:
          'https://images.squarespace-cdn.com/content/v1/5f27e1e974b12d13979223b6/1597078500594-X9M8J4IQSA8SZ4XC4F9W/Cinnamon-Ranelagh-01.jpg?format=750w'),
  Restaurants(
      Id: 10,
      Restname: 'Michie Sushi',
      Address: '11 Chelmsford Ln, Ranelagh, Dublin 6, D06 KX84',
      Image:
          'https://media-cdn.tripadvisor.com/media/photo-s/08/f9/77/d8/michie-sushi-sandyford.jpg'),
  Restaurants(
      Id: 11,
      Restname: 'Kinara Kitchen',
      Address: '17 Ranelagh Rd, Ranelagh, Dublin 6, D06 FP82',
      Image:
          'https://static.wixstatic.com/media/79af6f_ad32cfa495f84bc788ec318d31686184~mv2.jpg/v1/fill/w_2048,h_1365,al_c,q_90/Kinara%20Kitchen%20long.jpg'),
  Restaurants(
      Id: 12,
      Restname: 'Forest Avenue Restaurant',
      Address: ' 8 Sussex Terrace, Sussex Rd, Dublin 4, D04 C7F4',
      Image:
          'https://i0.wp.com/diningwithfrankie.com/wp-content/uploads/2017/12/img_3183.jpg')
];
String Address = '';
void getlocation() async {
  await Geolocator.checkPermission();
  await Geolocator.requestPermission();
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  print(position);
  GetAddressFromLatLong(position);
}

Future<void> GetAddressFromLatLong(Position position) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
  Placemark place = placemarks[0];

  Address = '${place.street}, ${place.postalCode}, ${place.country}';
}
