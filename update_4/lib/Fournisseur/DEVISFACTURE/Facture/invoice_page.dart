import 'package:flutter/material.dart';
import 'package:flutter_application_7/Fournisseur/DEVISFACTURE/Tools/invoice_details.dart';
import 'package:flutter_application_7/Fournisseur/DEVISFACTURE/Tools/client_details.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Data/invoice_data.dart';
import '../pdf/pdf_api.dart';
import '../pdf/pdf_invoice_api.dart';

class InvoicePage extends StatefulWidget {
  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  final _recipientController = "jinniebouaziz@gmail.com";
  final _subjectController = 'estimate';
  final _body = 'new estimate here';
  @override
  Widget build(BuildContext context) =>
     Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('Invoice Details',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClientDetails(),
            SizedBox(height: 16),
            InvoiceDetails(),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final date = DateTime.now();
                    final dueDate = date.add(Duration(days: 7));
                    final pdfFile = await PdfInvoiceApi.generate(invoice);
                    PdfApi.openFile(pdfFile);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 32.0,
                    ),
                    child: Text(
                      'View PDF',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    _sendEmail();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 32.0,
                    ),
                    child: Text(
                      'send email',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    Future<void> _sendEmail() async {
      final username = 'sywarba@gmail.com';
      final password = 'wleizajdfjajblnn';

      final smtpServer = gmail(username, password);

      final message = Message()
        ..from = Address(username, 'sywar bouaziz')
        ..recipients.add(_recipientController)
        ..subject = _subjectController
        ..text = _body;

      try {
        final sendReport = await send(message, smtpServer);

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

