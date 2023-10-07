import 'package:flutter/material.dart';
import 'package:flutter_application_7/Fournisseur/DEVISFACTURE/Devis/devis_list.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/fournisseur_list.dart';
import 'Facture/facture_list.dart';

class InEsPage extends StatefulWidget {
  const InEsPage({Key? key}) : super(key: key);

  @override
  _InEsPageState createState() => _InEsPageState();
}

class _InEsPageState extends State<InEsPage> {
  

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('Invoices and Estimates',
            style:  GoogleFonts.bebasNeue(
            fontSize: 28,
          ),),
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
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
         
          Expanded(
            child:  Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                 
                  
                  
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EstimateListPage(),
                        ),
                      );
                    },
                    child: FournisseurList(
                      IconF: Icons.edit_document,
                      TitleF: 'Estimate',
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
                          builder: (context) => InvoiceListPage(),
                        ),
                      );
                    },
                    child: FournisseurList(
                      IconF: Icons.payment,
                      TitleF: 'Invoice',
                      SubTitleF: 'check it',
                    ),
                  ),
                  
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}
