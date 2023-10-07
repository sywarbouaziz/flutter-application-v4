import 'package:flutter/material.dart';
import 'package:flutter_application_7/froc.dart';
import 'package:flutter_application_7/pofile_screenc.dart';
import 'package:flutter_application_7/profilef.dart';
import 'package:flutter_application_7/registration_provider.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'Fournisseur/persistent_bottom_nav_page.dart';
import 'Signup_pages/signup_pageF.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void dispose() {
    _emailController.dispose();
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
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                  padding: EdgeInsets.all(20),
                  child: Icon(
                    Icons.shopping_cart_checkout_rounded,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'Hello Again!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                    color: Colors.deepPurple,
                  ),
                ),

                SizedBox(height: 30),
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
                        controller: _emailController,
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
                        controller: _passwordController,
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
                //button
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        String? email = _emailController.text;
                        String? password = _passwordController.text;
                        if (await RegistrationProvide.loginF(email, password)) {
                          print("well Login is done");
                          print(email);
                          print(password);
                          List result = await RegistrationProvide.getF(email);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PersistentBottomNavPage(
                                        result[0],
                                        result[1],
                                        result[2].toString(),
                                        result[3].toString(),
                                        result[4],
                                        result[5],
                                        result[6],
                                      )));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (BuildContext context) => ProfileF(
                          //             result[0],
                          //             result[1],
                          //             result[2].toString(),
                          //             result[3],
                          //             result[4],
                          //             result[5],
                          //             result[6]),
                          //         settings: RouteSettings(
                          //           arguments: ProfileF(
                          //               result[0],
                          //               result[1],
                          //               result[2].toString(),
                          //               result[3],
                          //               result[4],
                          //               result[5],
                          //               result[6]),
                          //         )));
                        } else if (await RegistrationProvide.loginC(
                            email, password)) {
                          print("Login isdone");
                          print(email);
                          print(password);
                          List result = await RegistrationProvide.getC(email);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ProfileScreenC(
                                          result[0],
                                          result[1],
                                          result[2],
                                          result[3].toString(),
                                          result[4].toString(),
                                          result[5],
                                          result[6])));
                        } else {
                          print("login not done");
                        }
                      },
                      child: Text('Login'),
                    )),
                SizedBox(height: 10),
                //not a member?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      child: Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => ForCPage()));
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
