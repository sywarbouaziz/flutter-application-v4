import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

import 'code_page.dart';

int generateVerificationCode() {
  final random = Random();
  return random.nextInt(9999 - 1000) + 1000;
}

class VerifPage extends StatefulWidget {
  const VerifPage({Key? key}) : super(key: key);

  @override
  State<VerifPage> createState() => _VerifPageState();
}

class _VerifPageState extends State<VerifPage> {
  final _recipientController = "jinniebouaziz@gmail.com";
  final _subjectController = 'Email Verification Code';
  late String _body;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                size: 100,
                color: Colors.deepPurple,
              ),
              const SizedBox(height: 32),
              Text(
                'Email Verifier',
                style: GoogleFonts.bebasNeue(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  _sendEmail();
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future<void> _sendEmail() async {
    final username = 'sywarba@gmail.com';
    final password = 'wleizajdfjajblnn';
    final verificationCode = generateVerificationCode();
    _body = 'Your verification code is: $verificationCode';
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'sywar bouaziz')
      ..recipients.add(_recipientController)
      ..subject = _subjectController
      ..text = _body;

    try {
      final sendReport = await send(message, smtpServer);
        Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => CodeVerificationScreen(verificationCode: verificationCode),
        ),
      );
      _launchEmail();
    } on MailerException catch (e) {
      print('Message not sent: ${e.toString()}');
    }
  }

  Future<void> _launchEmail() async {
    final emailUrl =
        'mailto:${_recipientController}?subject=${_subjectController}&body=${_body}';
    if (await canLaunch(emailUrl)) {
      await launch(emailUrl);
    }
  }
}

/*import 'package:flutter/material.dart';
import 'package:flutter_application_7/froc.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifPage extends StatefulWidget {
  const VerifPage({Key? key}) : super(key: key);

  @override
  State<VerifPage> createState() => _VerifPageState();
}

class _VerifPageState extends State<VerifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                size: 100,
                color: Colors.deepPurple,
              ),
              const SizedBox(height: 32),
              Text(
                'Email Verifier',
                style: GoogleFonts.bebasNeue(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // function here mt3 send verif
                  /*Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => pagelokhra(),
                    ),
                  );*/
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/