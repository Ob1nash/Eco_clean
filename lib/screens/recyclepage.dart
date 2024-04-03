import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class RecyclePageScreen extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recycle Page'),
        backgroundColor: const Color.fromARGB(255, 102, 215, 106),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200, // adjust the height of the map container
            color: Colors.blueGrey, // change the color as needed
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(51.509364, -0.128928), // Center of the map
                zoom: 9.2, // Zoom level
              ),
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                 source: 'OpenStreetMap contributors',
                 onSourceTapped: null,
                ),
              ],
              children: [
                TileLayer(
                 urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                 userAgentPackageName: 'com.example.app',
                ),
              ],
            ),
          ),
          SizedBox(height: 20), // add spacing between the map and buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                 onPressed: () {
                    // handle button press for lights
                 },
                 icon: Icon(Icons.lightbulb, size: 20),
                 label: Text('Lights'),
                ),
                ElevatedButton.icon(
                 onPressed: () {
                    // handle button press for battery
                 },
                 icon: Icon(Icons.battery_full, size: 20),
                 label: Text('Battery'),
                ),
                ElevatedButton.icon(
                 onPressed: () {
                    // handle button press for paper and card boards
                 },
                 icon: Icon(Icons.description, size: 20),
                 label: Text('Paper and Card Boards'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
 }
}
