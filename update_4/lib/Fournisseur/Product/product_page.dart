import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/Fournisseur/Product/edit_product.dart';
import 'package:flutter_application_7/registration_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../registration_provider.dart';

import '../models/product.dart';

class ProductScreen extends StatefulWidget {
  final List product;
  final Uint8List image;
  ProductScreen(this.product, this.image);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  //Product get product => widget.product;
  String? selectedImageUrl;
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    final RegistrationProvide = Provider.of<RegistrationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product[1],
          style: GoogleFonts.bebasNeue(fontSize: 28),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          // IconButton(
          //   icon: Icon(Icons.edit),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => ProductEditPage(product: product),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              child: Image.memory(widget.image),
              height: 200,
              width: 1000,
              padding: const EdgeInsets.all(2),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product[1],
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '\$${widget.product[3]}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.deepPurple,
                        ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.product[4] ??
                        'no product description dfgjdfglkdjfgldfgjldfkgjdl /n fgkjdflkgjdfl/nfdgfdg/Ndgdfg/n dfgdfgd',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(height: 1.5),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
