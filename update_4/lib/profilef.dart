// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// import '../login_page.dart';
// import '../registration_provider.dart';

// class ProfileF extends StatelessWidget {
//   final String nomEnt;
//   final String email;
//   final String numtel;
//   final String addEnt;
//   final String ethaddress;
//   final String category;
//   final String password;
//   final TextEditingController _nomEntController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _numtelController = TextEditingController();
//   final TextEditingController _addEntController = TextEditingController();
//   final TextEditingController _ethaddressController = TextEditingController();
//   final TextEditingController _categorieController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   ProfileF(this.nomEnt, this.email, this.numtel, this.addEnt, this.ethaddress,
//       this.category, this.password);

//   @override
//   Widget build(BuildContext context) {
//     final RegistrationProvide = Provider.of<RegistrationProvider>(context);
//     // final args =
//     //     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
//     // final id = args['id']!;
//     // final name = args['name']!;
//     final TextEditingController _codeController = TextEditingController();
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             reverse: true,
//             padding: EdgeInsets.all(32),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.check_circle, // Icône de vérification
//                   size: 100.0, // Taille de l'icône
//                   color: Colors.green, // Couleur de l'icône
//                 ),
//                 SizedBox(height: 90),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       border: Border.all(color: Colors.white),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 20.0),
//                       child: TextFormField(
//                         controller: TextEditingController(text: nomEnt),
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       border: Border.all(color: Colors.white),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 20.0),
//                       child: TextFormField(
//                         controller: TextEditingController(text: email),
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       border: Border.all(color: Colors.white),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 20.0),
//                       child: TextFormField(
//                         controller: TextEditingController(text: numtel),
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       border: Border.all(color: Colors.white),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 20.0),
//                       child: TextFormField(
//                         controller: TextEditingController(text: addEnt),
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       border: Border.all(color: Colors.white),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 20.0),
//                       child: TextFormField(
//                         controller: TextEditingController(text: ethaddress),
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       border: Border.all(color: Colors.white),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 20.0),
//                       child: TextFormField(
//                         controller: TextEditingController(text: category),
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       border: Border.all(color: Colors.white),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 20.0),
//                       child: TextFormField(
//                         controller: TextEditingController(text: password),
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 16.0),
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         await RegistrationProvide.updatePass(
//                             TextEditingController(text: password).text,
//                             TextEditingController(text: email).text);
//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //         builder: (BuildContext context) =>
//                         //             LoginPage()));
//                         print("les nouveaux mots de passe sont " +
//                             TextEditingController(text: password).text +
//                             TextEditingController(text: email).text);
//                       },
//                       child: Text('update'),
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// import '../login_page.dart';
// import '../registration_provider.dart';
import '../login_page.dart';
import '../registration_provider.dart';
import 'registration_provider.dart';

class ProfileF extends StatefulWidget {
  final String nomEnt;
  final String email;
  final String numtel;
  final String addEnt;
  final String ethaddress;
  final String category;
  final String password;

  ProfileF(this.nomEnt, this.email, this.numtel, this.addEnt, this.ethaddress,
      this.category, this.password);

  @override
  _ProfileFState createState() => _ProfileFState();
}

class _ProfileFState extends State<ProfileF> {
  final TextEditingController _nomEntController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numtelController = TextEditingController();
  final TextEditingController _addEntController = TextEditingController();
  final TextEditingController _ethaddressController = TextEditingController();
  final TextEditingController _categorieController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomEntController.text = widget.nomEnt;
    _emailController.text = widget.email;
    _numtelController.text = widget.numtel;
    _addEntController.text = widget.addEnt;
    _ethaddressController.text = widget.ethaddress;
    _categorieController.text = widget.category;
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
                Icon(
                  Icons.check_circle,
                  size: 100.0,
                  color: Colors.green,
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
                        controller: _nomEntController,
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
                        controller: _addEntController,
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
                        controller: _ethaddressController,
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
                        controller: _categorieController,
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
                    await RegistrationProvide.updatePass(
                        _passwordController.text, _emailController.text);
                    print("les nouveaux sont " +
                        _emailController.text +
                        " " +
                        _passwordController.text);

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
