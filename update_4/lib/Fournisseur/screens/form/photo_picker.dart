import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPicker extends StatefulWidget {
  final Function(File) onImageSelected;

  PhotoPicker({required this.onImageSelected});

  @override
  _PhotoPickerState createState() => _PhotoPickerState();
}

class _PhotoPickerState extends State<PhotoPicker> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  Future<void> _getImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
        widget.onImageSelected(_imageFile!);
      }
    } catch (e) {
      print(e);
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select image source'),
          actions: [
            TextButton(
              child: Text('Camera'),
              onPressed: () {
                _getImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Gallery'),
              onPressed: () {
                _getImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey[300],
              ),
              child: _imageFile != null
                  ?  Image.file(
                        _imageFile!,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      )
                    
                  : Icon(Icons.photo_rounded, size: 100),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  _showImageSourceDialog();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
