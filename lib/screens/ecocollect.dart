import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class EcoCollectScreen extends StatefulWidget {
  const EcoCollectScreen({Key? key});

  @override
  _EcoCollectScreenState createState() => _EcoCollectScreenState();
}

class _EcoCollectScreenState extends State<EcoCollectScreen> {
  File? _selectedImage;
  TextEditingController _wasteTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eco Collect'),
        backgroundColor: Color.fromARGB(255, 102, 215, 106),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload Photo of Waste:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            _buildPhotoUploadBox(context),
            SizedBox(height: 20.0),
            if (_selectedImage != null) ...[
              Text(
                'Selected Image:',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Image.file(_selectedImage!),
              SizedBox(height: 20.0),
            ],
            Text(
              'Enter Type of Waste:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _wasteTypeController,
              decoration: InputDecoration(
                labelText: 'Waste Type',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _submitForm();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoUploadBox(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _openFileExplorer(context);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.cloud_upload, size: 50.0),
            SizedBox(height: 10.0),
            Text('Upload a Photo', style: TextStyle(fontSize: 20.0)),
            SizedBox(height: 20.0),
            if (_selectedImage != null) ...[
              Text('Uploaded Image:', style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 10.0),
              Image.file(_selectedImage!),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _openFileExplorer(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        if (kIsWeb) {
          // For web platform, use the bytes property
          _selectedImage = File.fromRawPath(result.files.single.bytes!);
        } else {
          // For mobile platforms, use the path property
          _selectedImage = File(result.files.single.path!);
        }
      });
    }
  }

  void _submitForm() {
    String wasteType = _wasteTypeController.text;
    // Handle form submission
    // You can process the selected image and waste type here
  }

  @override
  void dispose() {
    _wasteTypeController.dispose();
    super.dispose();
  }
}
