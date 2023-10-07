import 'package:flutter/material.dart';
import 'package:flutter_application_7/Fournisseur/DEVISFACTURE/Devis/devis_page.dart';
import 'package:flutter_application_7/Fournisseur/DEVISFACTURE/Facture/invoice_page.dart';
import '../../../Data/Estimate.dart';
import '../../../Data/Estimate_data.dart';
import '../pdf/pdf_api.dart';

// import your Estimate data
class EstimateListPage extends StatefulWidget {
  const EstimateListPage({Key? key}) : super(key: key);

  @override
  _EstimateListPageState createState() => _EstimateListPageState();
}

class _EstimateListPageState extends State<EstimateListPage> {
  String _selectedStatus = 'All';

  @override
  Widget build(BuildContext context) {
    final filteredEstimates = _selectedStatus == 'All'
        ? estimates
        : estimates
            .where((Estimate) => Estimate.info.status == _selectedStatus)
            .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('Estimates',
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
              itemCount: filteredEstimates.length,
              itemBuilder: (context, index) {
                final Estimate = filteredEstimates[index];
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
                        Estimate.info.number,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        Estimate.customer.name,
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
                            builder: (context) => DevisPage(),
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
