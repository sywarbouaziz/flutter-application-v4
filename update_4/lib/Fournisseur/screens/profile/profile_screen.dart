import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/Fournisseur/screens/profile/profile_edit.dart';
import 'package:flutter_application_7/Fournisseur/screens/profile/profile_settings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../registration_provider.dart';

class ProfileScreen extends StatefulWidget {
  final String iphash;
  final String nomEnt;
  final String email;
  final String numtel;
  final String addEnt;
  final String ethaddress;
  final String category;

  ProfileScreen(this.iphash, this.nomEnt, this.email, this.numtel, this.addEnt,
      this.ethaddress, this.category);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nomEntController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numtelController = TextEditingController();
  final TextEditingController _addEntController = TextEditingController();
  final TextEditingController _ethaddressController = TextEditingController();
  final TextEditingController _categorieController = TextEditingController();
  Uint8List? imageData;
  //imageData = await fetchImageFromIpfs(ipfsHash!);
  Widget? _imageWidget;
  @override
  void initState() {
    super.initState();

    _nomEntController.text = widget.nomEnt;
    _emailController.text = widget.email;
    _numtelController.text = widget.numtel;
    _addEntController.text = widget.addEnt;
    _ethaddressController.text = widget.ethaddress;
    _categorieController.text = widget.category;
    fetchImage();
  }

  void fetchImage() async {
    RegistrationProvider registrationProvider =
        Provider.of<RegistrationProvider>(context, listen: false);
    Uint8List? fetchedImageData =
        await registrationProvider.fetchImageFromIpfs(widget.iphash);
    if (fetchedImageData != null) {
      setState(() {
        imageData = fetchedImageData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    RegistrationProvider registrationProvider =
        Provider.of<RegistrationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.bebasNeue(
            fontSize: 28,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ProfileSettings(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          /*borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),*/
        ),
        padding: EdgeInsets.only(left: 16, top: 10, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 80.0,
                backgroundImage:
                    imageData != null ? MemoryImage(imageData!) : null,
              ),
              // ElevatedButton(
              //   onPressed: () async {
              //     if (widget.iphash != null) {
              //       imageData = await registrationProvider
              //           .fetchImageFromIpfs(widget.iphash);
              //       print("welll kkkkkk");
              //       if (imageData != null) {
              //         print("image not null");
              //         setState(() {
              //           // Add the Container widget to the widget tree
              //           // to display the image
              //           _imageWidget = Container(
              //             height: 200,
              //             width: 100,
              //             child: Image.memory(
              //               imageData!,
              //               fit: BoxFit.cover,
              //             ),
              //           );
              //         });
              //       }
              //     }
              //   },
              //   child: const Text('Get File Content'),
              // ),
              SizedBox(height: 5),
              Container(
                width: 200, // Add a fixed width constraint
                child: TextField(
                  controller: _nomEntController,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              SizedBox(
                width: 200.0,
                height: 10.0,
                child: Divider(
                  color: Colors.deepPurple,
                ),
              ),
              Card(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 15),
                      Container(
                        width: 200, // Add a fixed width constraint
                        child: TextField(
                          controller: _numtelController,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 15),
                      Container(
                        width: 200, // Add a fixed width constraint
                        child: TextField(
                          controller: _emailController,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 15),
                      Container(
                        width: 200, // Add a fixed width constraint
                        child: TextField(
                          controller: _addEntController,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 15),
                      Container(
                        width: 200, // Add a fixed width constraint
                        child: TextField(
                          controller: _ethaddressController,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.deepPurple,
                      ),
                      SizedBox(width: 15),
                      Container(
                        width: 200, // Add a fixed width constraint
                        child: TextField(
                          controller: _categorieController,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
