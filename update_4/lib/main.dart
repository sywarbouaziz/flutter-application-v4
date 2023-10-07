import 'package:flutter/material.dart';
import 'package:flutter_application_7/Fournisseur/persistent_bottom_nav_page.dart';
import 'package:flutter_application_7/Fournisseur/screens/home_page.dart';
import 'package:flutter_application_7/registration_provider.dart';
import 'package:provider/provider.dart';

import 'Fournisseur/Product/product_list.dart';
import 'Fournisseur/Product/product_page.dart';
import 'Fournisseur/models/product.dart';
import 'Fournisseur/screens/form/product_form.dart';

///import 'Fournisseur/screens/home_page.dart';
import 'Signup_pages/signup_pageC.dart';
import 'Signup_pages/signup_pageF.dart';
import 'froc.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = Product(
      name: "yossra",
      imageUrls: [
        'https://th.bing.com/th/id/R.35b91db87589f4c2640da04cd2156436?rik=0RP2LAjtrh4kHg&riu=http%3a%2f%2f47bf27f91a0b1190a802-5e12d9db40f00b709a94922ff2488490.r40.cf2.rackcdn.com%2fproduct-hugerect-81182-32661-1362643376-a905dab72b012c9acf198186e82776c4.jpg&ehk=TeYTUVJtDo7kml7HrYg56cDJT%2fFMzxBGq05iPEA8rbc%3d&risl=&pid=ImgRaw&r=0'
      ],
      cost: 20,
      description: "jacket cuire",
      category: mensCategory,
      productType: "Jacket",
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RegistrationProvider>(
          create: (_) => RegistrationProvider(context),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ForCPage(),
      ),
    );
  }
}
