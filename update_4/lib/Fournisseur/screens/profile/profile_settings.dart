import 'package:flutter/material.dart';
import 'package:flutter_application_7/Fournisseur/screens/profile/password_edit.dart';
import 'package:flutter_application_7/Fournisseur/screens/profile/profile_edit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/fournisseur_list.dart';

class ProfileSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile Settings',
          style: GoogleFonts.bebasNeue(
            fontSize: 28,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          /*borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),*/
        ),
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('assets/koko.png'),
            ),
            SizedBox(height: 20),
            Text(
              "dfgfd",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(
              width: 200.0,
              height: 20.0,
              child: Divider(
                color: Colors.deepPurple,
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      );
                    },
                    child: FournisseurList(
                      IconF: Icons.edit_document,
                      TitleF: 'edit profile',
                      SubTitleF: 'check it',
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePasswordPage(),
                        ),
                      );
                    },
                    child: FournisseurList(
                      IconF: Icons.payment,
                      TitleF: 'change password',
                      SubTitleF: 'check it',
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

