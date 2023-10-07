//import 'dart:html';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../registration_provider.dart';
import 'fdf.dart';
import 'fgh.dart';

class SignUpC extends StatefulWidget {
  const SignUpC({Key? key}) : super(key: key);

  @override
  State<SignUpC> createState() => _SignUpCState();
}

class _SignUpCState extends State<SignUpC> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numtelController = TextEditingController();
  final TextEditingController _addController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  File? _imageFile;
  String? nomError;
  String? prenomError;
  String? emailError;
  String? numtelError;
  String? addError;

  String? passwordError;
  String? imageError;
  void dispose() {
    _nomController.dispose();
    _prenomController.dispose();
    _emailController.dispose();
    _numtelController.dispose();
    _addController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final RegistrationProvide = Provider.of<RegistrationProvider>(context);
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
                Icon(
                  Icons.shopping_basket,
                  size: 100,
                ),
                SizedBox(height: 15),
                Text(
                  'Welcome!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  ),
                ),
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
                if (imageError != null)
                  Text(imageError!, style: TextStyle(color: Colors.red)),
                SizedBox(height: 20),
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
                          hintText: 'Donner votre Nom',
                        ),
                      ),
                    ),
                  ),
                ),
                if (nomError != null)
                  Text(nomError!, style: TextStyle(color: Colors.red)),
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
                          hintText: 'Donner Votre Prénom',
                        ),
                      ),
                    ),
                  ),
                ),
                //email
                if (prenomError != null)
                  Text(prenomError!, style: TextStyle(color: Colors.red)),
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
                          hintText: 'Donner votre Email',
                        ),
                      ),
                    ),
                  ),
                ),
                if (emailError != null)
                  Text(emailError!, style: TextStyle(color: Colors.red)),
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
                        controller: _numtelController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Donner votre numero de telephone',
                        ),
                      ),
                    ),
                  ),
                ),
                if (numtelError != null)
                  Text(numtelError!, style: TextStyle(color: Colors.red)),
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
                        controller: _addController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Donner votre Adresse',
                        ),
                      ),
                    ),
                  ),
                ),
                //password
                if (addError != null)
                  Text(addError!, style: TextStyle(color: Colors.red)),
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
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Donner votre mot de passe',
                        ),
                      ),
                    ),
                  ),
                ),
                if (passwordError != null)
                  Text(passwordError!, style: TextStyle(color: Colors.red)),
                SizedBox(height: 10),
                //adress

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Process data
                      String? nom = _nomController.text;
                      String? prenom = _prenomController.text;
                      String? email = _emailController.text;
                      String numtel = _numtelController.text;
                      String add = _addController.text;

                      String password = _passwordController.text;
                      setState(() {
                        nomError =
                            nom.isEmpty ? 'Please enter your Name' : null;
                        emailError =
                            email.isEmpty ? 'Please enter your email' : null;
                        numtelError =
                            numtel.isEmpty ? 'Please enter your numtel' : null;
                        addError = add.isEmpty ? 'Please enter your Add' : null;
                        prenomError = prenom.isEmpty
                            ? 'Please enter your ethaddress'
                            : null;
                        passwordError = password.isEmpty
                            ? 'Please enter your password'
                            : null;

                        imageError =
                            _imageFile == null ? 'Please Pick an image' : null;
                      });

                      if (nomError == null &&
                          emailError == null &&
                          passwordError == null &&
                          imageError == null &&
                          addError == null &&
                          numtelError == null &&
                          prenomError == null) {
                        Random random = Random();
                        String r = "";
                        for (int i = 0; i < 6; i++) {
                          r = r + random.nextInt(9).toString();
                        }
                        RegistrationProvide.sendVerificationEmail(email, r);
                        String? ipHash =
                            await RegistrationProvide.uploadToIpfs(_imageFile!);
                        if (ipHash != null) {
                          print(ipHash);
                        } else {
                          print("NULLLLLL");
                        }

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => SecondRoute(
                                    ipHash,
                                    nom,
                                    prenom,
                                    email,
                                    numtel,
                                    add,
                                    password,
                                    r),
                                settings: RouteSettings(
                                  arguments: SecondRoute(ipHash, nom, prenom,
                                      email, numtel, add, password, r),
                                )));
                      }
                      //   if (await RegistrationProvide.verify(email)) {
                      //   } else {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (BuildContext context) =>
                      //               FirstRoute(nomEnt, email),
                      //           settings: RouteSettings(
                      //             arguments: FirstRoute(nomEnt, email),
                      //           ),
                      //         ));

                      //     // String imagehash =
                      //     //     await RegistrationProvide.uploadToIpfs(
                      //     //         selectedImage!);
                      //     //print("c'est le hash" + imagehash);
                      //     // imageData = await RegistrationProvide.fetchImageFromIpfs(ipfsHash!);
                      //     // await RegistrationProvide.registringF(
                      //     //     nomEnt,
                      //     //     email,
                      //     //     BigInt.parse(numtel),
                      //     //     addEnt,
                      //     //     ethaddress,
                      //     //     _category,
                      //     //     password);

                      //     // List l = await RegistrationProvide.get(email);
                      //     // print(l[0]);
                      //   }
                    },
                    child: Text('Submit'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                //not a member?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //Sign in
                    GestureDetector(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => LoginPage()));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
