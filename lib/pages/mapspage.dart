import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ui_app/pages/homepage.dart';
import 'package:ui_app/util/location/locations.dart' as locations;
import 'package:ui_app/pages/search.dart';
import 'package:ui_app/pages/settings.dart';

void main() {
  runApp(const mapspage());
}

class mapspage extends StatefulWidget {
  const mapspage({super.key});

  @override
  State<mapspage> createState() => _mapspageState();
}

class _mapspageState extends State<mapspage> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Safe Shelter Locations!'),
            elevation: 2,
          ),
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(0, 0),
              zoom: 2,
            ),
            markers: _markers.values.toSet(),
          ),
          bottomNavigationBar: Container(
            color: Colors.transparent,
            // ignore: prefer_const_constructors

            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              // ignore: prefer_const_constructors
              child: GNav(
                backgroundColor: Colors.transparent,
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
          )),
    );
  }

  void _pushtoLocation() {
    theme:
    ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.green[700],
    );
    child:
    Scaffold(
        appBar: AppBar(
          title: const Text('Safe Shelter Locations!'),
          elevation: 2,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(0, 0),
            zoom: 2,
          ),
          markers: _markers.values.toSet(),
        ));
  }

  void _pushtoHome() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomePage(),
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
