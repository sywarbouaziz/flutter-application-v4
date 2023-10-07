import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DevisOrFac extends StatefulWidget {
  const DevisOrFac({super.key});

  @override
  State<DevisOrFac> createState() => _DevisOrFacState();
}

class _DevisOrFacState extends State<DevisOrFac> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          'devis facture',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      
    );
  }
}