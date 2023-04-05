import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ui_app/pages/homepage.dart';
import 'package:ui_app/pages/mapspage.dart';
import 'package:ui_app/util/tile.dart';
import 'package:ui_app/util/location/locations.dart';
import 'package:ui_app/pages/search.dart';
import 'package:ui_app/pages/settings.dart';
import 'package:ui_app/pages/mapspage.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, bottom: 15),
            child: Text(
              "welcome to search",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text("Hello and welcome to she shelters , ")),
        ]),
        //navbar start
        bottomNavigationBar: Container(
          color: Colors.white,
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
        )
        //navbar end
        );
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
    Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 25, left: 25, bottom: 15),
        child: Text(
          "welcome to search",
          style: TextStyle(
              fontSize: 35, color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Text("Hello and welcome to she shelters , ")),
    ]);
  }

  void _pushtoSettings() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Settings(),
    ));
  }
}
