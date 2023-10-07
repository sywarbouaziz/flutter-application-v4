import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product.dart';

class ProductEditPage extends StatefulWidget {
  final Product product;

  ProductEditPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductEditPageState createState() => _ProductEditPageState();
}

class _ProductEditPageState extends State<ProductEditPage> {
  late TextEditingController _nameController;
  late TextEditingController _costController;
  late TextEditingController _descriptionController;
  late String _selectedCategory;


  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.name);
    _costController = TextEditingController(text: widget.product.cost.toStringAsFixed(2));
    _descriptionController = TextEditingController(text: widget.product.description ?? '');
    _selectedCategory = widget.product.category.title;

  }

  @override
  void dispose() {
    _nameController.dispose();
    _costController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product',
        style: GoogleFonts.bebasNeue(fontSize: 28),),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed:_saveChanges
              
            
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _costController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Cost'),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: _buildCategoryDropdownItems(),
              onChanged: (value) => setState(() => _selectedCategory = value!),
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 16.0),
            
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: InputDecoration(labelText: 'Description'),
            ),
           
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildCategoryDropdownItems() {
    return [
      for (var category in [mensCategory, womensCategory, petsCategory])
        DropdownMenuItem(
          value: category.title,
          child: Text(category.title),
        )
    ];
  }


  Category _getSelectedCategory() {
    switch (_selectedCategory) {
      case 'Men':
        return mensCategory;
      case 'Women':
        return womensCategory;
      case 'Pets':
        return petsCategory;
      default:
        throw Exception('Invalid category: $_selectedCategory');
    }
  }

  void _saveChanges() {
  final newProduct = widget.product.copyWith(
    name: _nameController.text,
    cost: double.parse(_costController.text),
    description: _descriptionController.text,
    category: _getSelectedCategory(),
  );

  // data saving

  Navigator.pop(context, newProduct);
}
}