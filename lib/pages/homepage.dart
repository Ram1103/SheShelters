import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ui_app/util/location/locations.dart';
import 'package:ui_app/pages/mapspage.dart';
import 'package:ui_app/util/tile.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ui_app/pages/search.dart';
import 'package:ui_app/pages/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, bottom: 15),
            child: Text(
              "Welcome to #SheShelter 🙌",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Our Prime Locations!",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(scrollDirection: Axis.horizontal, children: [
              tile2(
                imagepath: 'lib/images/pic5.jpg',
                name: 'South',
              ),
              tile2(
                imagepath: 'lib/images/pic 1.jpg',
                name: 'North',
              ),
              tile2(imagepath: 'lib/images/pic2.jpg', name: 'Central'),
              tile2(
                imagepath: 'lib/images/pic3.jpg',
                name: 'West',
              ),
              tile2(
                imagepath: 'lib/images/pic4.jpg',
                name: 'East',
              ),
            ]),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                  "Hello and welcome to she shelters , we take immense pleasure to help you!")),
        ]),
        bottomNavigationBar: Container(
          color: Colors.transparent,
          // ignore: prefer_const_constructors
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            // ignore: prefer_const_constructors
            child: GNav(
              backgroundColor: Colors.white,
              color: Colors.lightBlue,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.lightBlueAccent,
              padding: EdgeInsets.all(16),
              gap: 8,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  onPressed: _pushtoHome,
                ),
                GButton(
                  icon: Icons.pin_drop,
                  text: 'Location',
                  onPressed: _pushtoLocation,
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                  onPressed: _pushtoSearch,
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                  onPressed: _pushtoSettings,
                )
              ],
            ),
          ),
        ));
  }

  void _pushtoHome() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomePage(),
    ));
  }

  void _pushtoLocation() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => mapspage(),
    ));
  }

  void _pushtoSearch() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Search(),
    ));
  }

  void _pushtoSettings() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Settings(),
    ));
  }
}
