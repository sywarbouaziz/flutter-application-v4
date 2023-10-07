import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../registration_provider.dart';
import 'fdf.dart';

class SignUpF extends StatefulWidget {
  const SignUpF({Key? key}) : super(key: key);

  @override
  State<SignUpF> createState() => _SignUpFState();
}

class _SignUpFState extends State<SignUpF> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomEntController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numtelController = TextEditingController();
  final TextEditingController _addEntController = TextEditingController();
  final TextEditingController _ethaddressController = TextEditingController();
  final TextEditingController _categorieController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  File? _imageFile;
  late String _category = 'Electronics';
  String? nomEntError;
  String? emailError;
  String? numtelError;
  String? addEntError;
  String? ethaddressError;
  String? passwordError;
  String? imageError;

  List<String> _categories = [
    'Electronics',
    'Clothing',
    'Home and Garden',
    'Beauty and Personal Care',
    'Toys and Games',
    'Books',
  ];
  void dispose() {
    _nomEntController.dispose();
    _emailController.dispose();
    _numtelController.dispose();
    _addEntController.dispose();
    _ethaddressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final RegistrationProvide = Provider.of<RegistrationProvider>(context);
    //_imageFile = await RegistrationProvide.pickImage();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 60,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Become a Seller and Join',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 20,
                    color: Colors.deepPurple,
                  ),
                ),
                Text(
                  'Our Community',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 20,
                    color: Colors.deepPurple,
                  ),
                ),

                SizedBox(height: 20),
                //email
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
                        controller: _nomEntController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Business Name',
                        ),
                      ),
                    ),
                  ),
                ),
                if (nomEntError != null)
                  Text(nomEntError!, style: TextStyle(color: Colors.red)),

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
                          hintText: 'Email',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
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
                          hintText: 'Telephone Number',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your telephone number';
                          }
                          return null;
                        },
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
                        controller: _addEntController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Address',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Address';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                if (addEntError != null)
                  Text(addEntError!, style: TextStyle(color: Colors.red)),

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
                        controller: _ethaddressController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'ETH Address',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your ethereum address';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                if (ethaddressError != null)
                  Text(ethaddressError!, style: TextStyle(color: Colors.red)),
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
                      child: DropdownButtonFormField<String>(
                        value: _category,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
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
                    ),
                  ),
                ),

                SizedBox(height: 10),
                //password
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
                          hintText: 'Password',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            Text("Enter your Password",
                                style: TextStyle(color: Colors.red));
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                if (passwordError != null)
                  Text(passwordError!, style: TextStyle(color: Colors.red)),
                SizedBox(height: 10),
                //button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Process data
                      String? nomEnt = _nomEntController.text;
                      String? email = _emailController.text;
                      String numtel = _numtelController.text;
                      String addEnt = _addEntController.text;
                      String ethaddress = _ethaddressController.text;
                      String password = _passwordController.text;
                      setState(() {
                        nomEntError = nomEnt.isEmpty
                            ? 'Please enter the name of entreprise'
                            : null;
                        emailError =
                            email.isEmpty ? 'Please enter your email' : null;
                        numtelError =
                            numtel.isEmpty ? 'Please enter your numtel' : null;
                        addEntError =
                            addEnt.isEmpty ? 'Please enter your addent' : null;
                        ethaddressError = ethaddress.isEmpty
                            ? 'Please enter your ethaddress'
                            : null;
                        passwordError = password.isEmpty
                            ? 'Please enter your password'
                            : null;

                        imageError =
                            _imageFile == null ? 'Please Pick an image' : null;
                      });

                      if (nomEntError == null &&
                          emailError == null &&
                          passwordError == null &&
                          imageError == null &&
                          addEntError == null &&
                          numtelError == null &&
                          ethaddressError == null) {
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
                        print(ipHash);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => FirstRoute(
                                    ipHash,
                                    nomEnt,
                                    email,
                                    numtel,
                                    addEnt,
                                    ethaddress,
                                    _category,
                                    password,
                                    r),
                                settings: RouteSettings(
                                  arguments: FirstRoute(
                                      ipHash,
                                      nomEnt,
                                      email,
                                      numtel,
                                      addEnt,
                                      ethaddress,
                                      _category,
                                      password,
                                      r),
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
/*import 'package:flutter/material.dart';
import 'package:flutter_application_7/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
class SignUpF extends StatefulWidget {
  const SignUpF({Key? key}) : super(key: key);

  @override
  State<SignUpF> createState() => _SignUpFState();
}

class _SignUpFState extends State<SignUpF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child:SingleChildScrollView(
            reverse: true, 
            padding: EdgeInsets.all(32),
            
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shop_two_sharp,
                size: 100,
              ),
              SizedBox(height: 55),
              Text(
                'Welcome!',
                style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Become a Seller and Join',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                'Our Community',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),

              SizedBox(height: 20),
              //email
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
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //password
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
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //adress
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
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'adress',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //button
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
      ),),
    );
  }
}*/
/* another desgin 
import 'package:flutter/material.dart';
import 'package:flutter_application_7/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
class SignUpF extends StatefulWidget {
  const SignUpF({Key? key}) : super(key: key);

  @override
  State<SignUpF> createState() => _SignUpFState();
}

class _SignUpFState extends State<SignUpF> {
  String _name = '';
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
         
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Create an Account',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.deepPurple,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.deepPurple,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.deepPurple,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.deepPurple,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.deepPurple,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.deepPurple,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                 
                  onPressed: () {
                   
                  },
                  style: ElevatedButton.styleFrom(
                     padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: Colors.deepPurple,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text('Submit'),
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/