import 'package:flutter/material.dart';

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
            child: const Center(
              child: Text(
                'Map Placeholder', // replace with your map widget
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
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