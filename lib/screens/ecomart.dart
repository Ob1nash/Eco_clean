import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'product_page.dart';

class EcomartScreen extends StatefulWidget {
 @override
 _EcomartScreenState createState() => _EcomartScreenState();
}

class _EcomartScreenState extends State<EcomartScreen> {
 List<Map<String, dynamic>> products = [];

 @override
 void initState() {
    super.initState();
    fetchData();
 }

 Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://omnisynctechnologies.com/api/eco-marketplace'));

    if (response.statusCode == 200) {
      setState(() {
        products = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      });
    } else {
      throw Exception('Failed to load data');
    }
 }

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        backgroundColor: const Color.fromARGB(255, 102, 215, 106),
        actions: [
          IconButton(
            onPressed: () {
              // Handle search action
              showSearch(context: context, delegate: ProductSearchDelegate());
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return _buildProductCard(context, product);
        },
      ),
    );
 }

 Widget _buildProductCard(BuildContext context, Map<String, dynamic> product) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: product['image'] != null
                 ? CachedNetworkImage(
                      imageUrl: product['image'],
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    )
                 : Container(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 product['product_name'],
                 style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                 ),
                ),
                const SizedBox(height: 4.0),
                Text(
                 product['description'],
                 style: const TextStyle(
                    fontSize: 14.0,
                 ),
                ),
                const SizedBox(height: 4.0),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                    Text(
                      '\$${product['price']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${product['quantity']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        const Icon(
                          Icons.monetization_on,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                 ],
                ),
                const SizedBox(height: 4.0),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                    SizedBox(
                      width: 80, // Adjusted button width
                      child: ElevatedButton(
                        onPressed: () {
                          navigateToProductPage(context, product['image']);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF75EE7B)),
                        ),
                        child: const FittedBox(
                          child: Text('Buy', style: TextStyle(fontSize: 10.0, color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80, // Adjusted button width
                      child: ElevatedButton(
                        onPressed: () {
                          navigateToProductPage(context, product['image']);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF75EE7B)),
                        ),
                        child: const FittedBox(
                          child: Text('Redeem', style: TextStyle(fontSize: 14.0, color: Colors.white)),
                        ),
                      ),
                    ),
                 ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
 }

 void navigateToProductPage(BuildContext context, String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductPage(imageUrl: imageUrl)),
    );
 }
}

class ProductSearchDelegate extends SearchDelegate<String> {
 @override
 List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
 }

 @override
 Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
 }

 @override
 Widget buildResults(BuildContext context) {
    // Implement search results based on the query
    return Container();
 }

 @override
 Widget buildSuggestions(BuildContext context) {
    // Implement suggestions based on the query
    return Container();
 }
}
