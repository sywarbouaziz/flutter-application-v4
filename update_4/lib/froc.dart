import 'package:flutter/material.dart';
import 'package:flutter_application_7/Signup_pages/signup_pageC.dart';
import 'package:flutter_application_7/Signup_pages/signup_pageF.dart';

import 'package:google_fonts/google_fonts.dart';

class ForCPage extends StatefulWidget {
  const ForCPage({Key? key}) : super(key: key);

  @override
  State<ForCPage> createState() => _ForCPageState();
}

class _ForCPageState extends State<ForCPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple,
                ),
                padding: EdgeInsets.all(20),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'Choose Your Role',
              style: GoogleFonts.bebasNeue(
                fontSize: 52,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 50),
            // fournisseur
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => SignUpF(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: Colors.deepPurple,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    'I Am a Fournisseur',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),

            // client
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => SignUpC(),
                      ),
                    );
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
                  child: Text(
                    'I Am a Client',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
