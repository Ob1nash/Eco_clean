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
            child: Center(
              child: Image.asset(
                'assets/icons/map_image.png', // path to your map image asset
                fit: BoxFit.cover, // adjust the fit as needed
              ),
            ),
          ),
          SizedBox(height: 20), // add spacing between the map and buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded( // Wrap the button with Expanded widget
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // handle button press for lights
                    },
                    icon: Icon(Icons.lightbulb, size: 20),
                    label: Text('Lights'),
                  ),
                ),
                SizedBox(width: 10), // Add spacing between buttons
                Expanded( // Wrap the button with Expanded widget
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // handle button press for battery
                    },
                    icon: Icon(Icons.battery_full, size: 20),
                    label: Text('Battery'),
                  ),
                ),
                SizedBox(width: 10), // Add spacing between buttons
                Expanded( // Wrap the button with Expanded widget
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // handle button press for paper and card boards
                    },
                    icon: Icon(Icons.description, size: 20),
                    label: Text('Paper and Card Boards'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
