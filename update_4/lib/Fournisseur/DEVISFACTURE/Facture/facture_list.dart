import 'package:flutter/material.dart';

import '../../../Data/invoice_data.dart';
import 'invoice_page.dart';


class InvoiceListPage extends StatefulWidget {
  const InvoiceListPage({Key? key}) : super(key: key);

  @override
  _InvoiceListPageState createState() => _InvoiceListPageState();
}

class _InvoiceListPageState extends State<InvoiceListPage> {
  String _selectedStatus = 'All';

  @override
  Widget build(BuildContext context) {
    final filteredInvoices = _selectedStatus == 'All'
        ? invoices
        : invoices
            .where((invoice) => invoice.info.status == _selectedStatus)
            .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('Invoices',
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
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedStatus == 'All'
                        ? Colors.deepPurple
                        : Colors.grey[400],
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedStatus = 'All';
                    });
                  },
                  child: Text(
                    'All',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedStatus == 'Pending'
                        ? Colors.deepPurple
                        : Colors.grey[400],
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedStatus = 'Pending';
                    });
                  },
                  child: Text(
                    'Pending',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedStatus == 'Approved'
                        ? Colors.deepPurple
                        : Colors.grey[400],
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedStatus = 'Approved';
                    });
                  },
                  child: Text(
                    'Approved',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredInvoices.length,
              itemBuilder: (context, index) {
                final invoice = filteredInvoices[index];
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        invoice.info.number,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        invoice.customer.name,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.deepPurple,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InvoicePage(),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
