
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Email Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _recipientController = TextEditingController();
  final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void dispose() {
    _recipientController.dispose();
    _subjectController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Email Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _recipientController,
                decoration: InputDecoration(
                  labelText: 'Recipient',
                ),
              ),
              TextFormField(
                controller: _subjectController,
                decoration: InputDecoration(
                  labelText: 'Subject',
                ),
              ),
              TextFormField(
                controller: _bodyController,
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: 'Body',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: _sendEmail,
                  child: Text('Send Email'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _sendEmail() async {
    final username = 'sywarba@gmail.com';
    final password = 'wleizajdfjajblnn';

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'sywar bouaziz')
      ..recipients.add(_recipientController.text)
      ..subject = _subjectController.text
      ..text = _bodyController.text;

    try {
      final sendReport = await send(message, smtpServer);
      
      _launchEmail();
    } on MailerException catch (e) {
      print('Message not sent: ${e.toString()}');
    }
  }

  _launchEmail() async {
    final emailUrl =
        'mailto:${_recipientController.text}?subject=${_subjectController.text}&body=${_bodyController.text}';
    if (await canLaunch(emailUrl)) {
      await launch(emailUrl);
    }
  }
}