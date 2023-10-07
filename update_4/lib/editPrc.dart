import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/registration_provider.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class EditProfile extends StatefulWidget {
  final String iphash;
  final String nom;
  final String prenom;
  final String email;
  final String numtel;
  final String add;
  final String password;
  EditProfile(this.iphash, this.nom, this.prenom, this.email, this.numtel,
      this.add, this.password);
  @override
  EditProfilePage createState() => EditProfilePage();
}

class EditProfilePage extends State<EditProfile> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numtelController = TextEditingController();
  final TextEditingController _addController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPassword = false;
  Uint8List? imageData;
  File? _imageFile;
  void initState() {
    super.initState();
    _nomController.text = widget.nom;
    _emailController.text = widget.email;
    _numtelController.text = widget.numtel;
    _addController.text = widget.add;
    _prenomController.text = widget.prenom;
    _passwordController.text = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    final RegistrationProvide = Provider.of<RegistrationProvider>(context);
    final TextEditingController _codeController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                SizedBox(height: 90),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: _nomController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: _prenomController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: _numtelController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: _addController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),

// ...Continued

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    String? ipHash =
                        await RegistrationProvide.uploadToIpfs(_imageFile!);
                    await RegistrationProvide.updateClient(
                        ipHash,
                        _nomController.text,
                        _prenomController.text,
                        _emailController.text,
                        BigInt.parse(_numtelController.text),
                        _addController.text,
                        _passwordController.text);
                    print("Informations are well updated SUPER");

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginPage()));
//                         print("les nouveaux mots de passe sont " +
//                             TextEditingController(text: password).text +
//                             TextEditingController(text: email).text);
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Set button color
                    onPrimary: Colors.white, // Set text color
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
