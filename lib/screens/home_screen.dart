import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EcoClean'),
        backgroundColor: const Color.fromARGB(255, 102, 215, 106),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300, // Adjust the height of the big picture container
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/big_picture.jpg'), // Replace with actual image path
                  fit: BoxFit.cover,
                ),
              ),
              // child: Center(
              //   child: Text(
              //     'Welcome to Our Blog!',
              //     style: TextStyle(
              //       fontSize: 32.0,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Latest Blog Posts',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            BlogCard(
              title: 'Title of Blog Post 1',
              description: 'Description of Blog Post 1',
              imageUrl: 'assets/icons/blog1.jpg', // Replace with actual image path
            ),
            BlogCard(
              title: 'Title of Blog Post 2',
              description: 'Description of Blog Post 2',
              imageUrl: 'assets/icons/blog2.jpg', // Replace with actual image path
            ),
            BlogCard(
              title: 'Title of Blog Post 3',
              description: 'Description of Blog Post 3',
              imageUrl: 'assets/icons/blog3.png', // Replace with actual image path
            ),
          ],
        ),
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  BlogCard({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
