import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Custom AppBar widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('EcoClean'),
      backgroundColor: const Color.fromARGB(255, 102, 215, 106),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SmartBinScreen extends StatefulWidget {
  const SmartBinScreen({Key? key}) : super(key: key);

  @override
  _SmartBinScreenState createState() => _SmartBinScreenState();
}

class _SmartBinScreenState extends State<SmartBinScreen> {
  List<Map<String, dynamic>> smartDustbins = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://omnisynctechnologies.com/api/smart-dustbins'));

    if (response.statusCode == 200) {
      setState(() {
        smartDustbins = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Use the CustomAppBar here
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Smart Dustbins',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: smartDustbins.length,
                itemBuilder: (context, index) {
                  final dustbin = smartDustbins[index];
                  return ListTile(
                    title: Text(dustbin['name']),
                    subtitle: Text('Location: ${dustbin['location']}, Pincode: ${dustbin['pincode']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
