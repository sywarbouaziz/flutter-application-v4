import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
    File? _imageFile;
  final picker = ImagePicker();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _ethAddressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _ethAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        appBar: AppBar(
          title: Text(
            'Edit Profile',
            style: GoogleFonts.bebasNeue(
              fontSize: 28,
            ),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                       Center(
                child: GestureDetector(
                  onTap:_continueShowImagePicker,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : null,
                    child: _imageFile == null
                        ? Icon(
                            Icons.camera_alt,
                            size: 40,
                          )
                        : null,
                  ),
                ),
              ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name cannot be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Phone Number cannot be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Address cannot be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _ethAddressController,
                        decoration: InputDecoration(
                          labelText: 'Ethereum Address',
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[700],
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ethereum Address cannot be empty';
                          }
                          return null;
                        },
                      )
                    ])))));
  }
  
  void _showImagePicker() {}

  void _continueShowImagePicker() async {
final image = await ImagePicker().getImage(
source: ImageSource.gallery,
);
if (image != null) {
setState(() {
_imageFile = File(image.path);
});
}
}
}
