import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/registration_provider.dart';
import 'package:provider/provider.dart';

import 'editPrc.dart';

class ProfileScreenC extends StatefulWidget {
  final String image;
  final String nom;
  final String prenom;
  final String email;
  final String numtel;
  final String add;
  final String password;
  ProfileScreenC(this.image, this.nom, this.prenom, this.email, this.numtel,
      this.add, this.password);
  _ProfileScreenCState createState() => _ProfileScreenCState();
}

class _ProfileScreenCState extends State<ProfileScreenC> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numtelController = TextEditingController();
  final TextEditingController _addController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Uint8List? imageData;
  @override
  void initState() {
    super.initState();
    _nomController.text = widget.nom;
    _prenomController.text = widget.prenom;
    _emailController.text = widget.email;
    _numtelController.text = widget.numtel;
    _addController.text = widget.add;
    _passwordController.text = widget.password;
    fetchImage();
  }

  void fetchImage() async {
    RegistrationProvider registrationProvider =
        Provider.of<RegistrationProvider>(context, listen: false);
    Uint8List? fetchedImageData =
        await registrationProvider.fetchImageFromIpfs(widget.image);
    if (fetchedImageData != null) {
      setState(() {
        imageData = fetchedImageData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "My Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundImage:
                  imageData != null ? MemoryImage(imageData!) : null,
            ),
            Text(
              widget.nom,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 200.0,
              height: 20.0,
              child: Divider(
                color: Color.fromARGB(255, 166, 225, 252),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20),
              color: Color(0xFFD4ECF7),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                    ),
                    SizedBox(width: 15),
                    Text(
                      widget.numtel,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20),
              color: Color(0xFFD4ECF7),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                    ),
                    SizedBox(width: 15),
                    Text(
                      widget.email,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20),
              color: Color(0xFFD4ECF7),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                    ),
                    SizedBox(width: 15),
                    Text(
                      widget.add,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.redAccent,
                ),
                child: Center(
                  child: Text(
                    "Log out",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfile(
                          widget.image,
                          _nomController.text,
                          _prenomController.text,
                          _emailController.text,
                          _numtelController.text,
                          _addController.text,
                          _passwordController.text)),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.redAccent,
                ),
                child: Center(
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
