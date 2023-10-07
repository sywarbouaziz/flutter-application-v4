// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/Fournisseur/DEVISFACTURE/in_es.dart';
import 'package:flutter_application_7/Fournisseur/Product/product_list.dart';
import 'package:flutter_application_7/Fournisseur/utils/card.dart';
import 'package:flutter_application_7/Fournisseur/utils/fournisseur_list.dart';
import 'package:provider/provider.dart';

import '../../registration_provider.dart';

class HomePage extends StatefulWidget {
  final String? email;
  HomePage(this.email);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final RegistrationProvide = Provider.of<RegistrationProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            //app bar
            AppBar(
              title: const Text('GOGO'),
              elevation: 0,
              backgroundColor: Colors.deepPurple,
              actions: [
                PopupMenuButton(
                    icon: const Icon(Icons.menu),
                    offset: const Offset(0, 40),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Row(
                              children: [
                                const Icon(Icons.logout, color: Colors.black87),
                                Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Text("Sign Out")),
                              ],
                            ),
                            onTap: () async {},
                          ),
                        ])
              ],
            ),
            SizedBox(
              height: 25,
            ),
            //Card
            Mycard(
              balance: 2500.00,
            ),
            //Clients +
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      List<Uint8List>? j = [];
                      List result =
                          await RegistrationProvide.getP(widget.email!);
                      for (int i = 0; i < result[1].length; i++) {
                        j.add(await RegistrationProvide.fetchImageFromIpfs(
                            result[1][i][0]));
                        print(result[1][i][0]);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductList(result, j),
                        ),
                      );
                    },
                    child: FournisseurList(
                      IconF: Icons.add_shopping_cart_rounded,
                      TitleF: 'Products',
                      SubTitleF: 'edit product',
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InEsPage(),
                        ),
                      );
                    },
                    child: FournisseurList(
                      IconF: Icons.document_scanner_sharp,
                      TitleF: 'Invoice and Estimate',
                      SubTitleF: 'check it',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
