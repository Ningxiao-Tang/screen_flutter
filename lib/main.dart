import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(target: LatLng(43.2519, -79.9351), zoom: 12.0),
              markers: _createMarkers(),
              onMapCreated: (GoogleMapController controller) {mapController = controller;},
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 10),
                        Text('Where to?', style: TextStyle(color: Colors.white, fontSize: 18),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 350.0,
                    //color: Colors.black.withOpacity(0.3),
                    child: ListView(
                      padding: EdgeInsets.all(10.0),
                      children: <Widget>[
                        _buildRouteCard('51', 'Hamilton GO Centre', 'Whitney / Lower Horning', '19', Colors.deepPurple),
                        _buildRouteCard('5', 'Greenhill at Cochrane', 'Whitney / Lower Horning', '2', Colors.teal),
                        _buildRouteCard('10', 'Eastgate Square', 'Osler / Main', '0', Colors.red),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16.0, // Use top and left to adjust position instead of wrapping in Padding
              left: 16.0,
              child: SafeArea(
                child: Image.asset(
                  'assets/profile.png',
                  width: 60.0,
                  height: 60.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Set<Marker> _createMarkers() {
    return {
      Marker(
        markerId: MarkerId('bike1'),
        position: LatLng(43.2518, -79.9353),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    };
  }

  Widget _buildRouteCard(String number, String title, String subtitle, String time, Color color) {
    return Card(
      color: color,
      child: Container(
        //color: Colors.white,
        height: 110,
        width: double.infinity,
        padding: EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(number, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                SizedBox(height: 5),
                Text(title, style: TextStyle(color: Colors.white, fontSize: 16),),
                Text(subtitle, style: TextStyle(color: Colors.white70, fontSize: 14),),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time, style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                Text('minutes', style: TextStyle(color: Colors.white70, fontSize: 14),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
