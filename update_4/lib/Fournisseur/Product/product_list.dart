import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_7/Fournisseur/models/product.dart';

import '../../Signup_pages/signup_pageF.dart';
import 'product_page.dart';

// class ProductList extends StatelessWidget {
//   List result;
//   List<Uint8List>? f;
//   ProductList(this.result, this.f);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//         title: Text(
//           'Product List',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: result[1].length,
//         itemBuilder: (context, index) {
//           final product = result[1][index];

//           return Card(
//             color: Colors.white,
//             elevation: 2.0,
//             child: ListTile(
//               leading: CircleAvatar(
//                 backgroundImage:
//                     f![index] != null ? MemoryImage(f![index]) : null,
//               ),
//               title: Text(
//                 product[1],
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               subtitle: Text(
//                 'description',
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               trailing: Icon(Icons.arrow_forward_ios),
//               onTap: () {
//                 // Navigate to product details page
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SignUpF(),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
class ProductList extends StatelessWidget {
  List result;
  List<Uint8List>? f;
  ProductList(this.result, this.f);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          'Product List',
          style: TextStyle(
            color: Colors.white,
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
      body: ListView.builder(
        itemCount: result[1].length,
        itemBuilder: (context, index) {
          final product = result[1][index];

          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    f![index] != null ? MemoryImage(f![index]) : null,
              ),
              title: Text(
                product[1],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'description',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to product details page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(product, f![index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
