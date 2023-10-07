import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/Fournisseur/screens/form/photo_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../registration_provider.dart';

class ProductForm extends StatefulWidget {
  @override
  final String? email;
  // final String ipHash;
  // final String productName;
  // final String price;
  // final String description;
  ProductForm(this.email);
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late String _productName;
  late String _category = 'Electronics'; // Initialize to default value
  late int _quantity;
  late String _description;
  File? _imageFile;

  List<String> _categories = [
    'Electronics',
    'Clothing',
    'Home and Garden',
    'Beauty and Personal Care',
    'Toys and Games',
    'Books',
  ];
  void dispose() {
    _productNameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
    //    void initState() {
    //   super.initState();

    //   _productNameController.text = widget.productName;
    //   _priceController.text = widget.price;
    //   _descriptionController.text = widget.description;

    // }
  }

  @override
  Widget build(BuildContext context) {
    final RegistrationProvide = Provider.of<RegistrationProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Product',
            style: GoogleFonts.bebasNeue(
              fontSize: 28,
            ),
          ),
          backgroundColor: Colors.deepPurple,
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Do something with the form values
                }
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //photo
                  //
                  GestureDetector(
                    onTap: () async {
                      _imageFile = await RegistrationProvide.pickImage();
                      if (_imageFile != null) {
                        setState(() {
                          _imageFile = File(_imageFile!.path);
                        });
                      }
                    },
                    child: CircleAvatar(
                      backgroundImage:
                          _imageFile != null ? FileImage(_imageFile!) : null,
                      radius: 50.0,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _productNameController,
                    decoration: InputDecoration(
                      labelText: 'Product Name',
                      labelStyle: TextStyle(
                        color: Colors.deepPurple,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter a product name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _productName = value!;
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    value: _category,
                    decoration: InputDecoration(
                      labelText: 'Category',
                      labelStyle: TextStyle(
                        color: Colors.deepPurple,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    items: _categories.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select a category';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _category = value!;
                      });
                    },
                    onSaved: (value) {
                      _category = value!;
                    },
                  ),

                  SizedBox(height: 10),
                  TextFormField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      labelStyle: TextStyle(
                        color: Colors.deepPurple,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a price';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),

                  TextFormField(
                    maxLines: 3,
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(
                        color: Colors.deepPurple,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String? ipHash =
                          await RegistrationProvide.uploadToIpfs(_imageFile!);
                      await RegistrationProvide.addP(
                          widget.email!,
                          ipHash,
                          _productNameController.text,
                          _category,
                          _priceController.text,
                          _descriptionController.text);
                      if (ipHash != null) {
                        print(ipHash);
                      } else {
                        print("NULLLLLL");
                      }
                      List result =
                          await RegistrationProvide.getP(widget.email!);
                      print(result[0]);
                    },
                    child: Text('Submit'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
