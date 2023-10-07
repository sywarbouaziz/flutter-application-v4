import 'customer.dart';
import 'invoice.dart';
import 'supplier.dart';

final supplier = Supplier(
  name: 'Sarah Field',
  address: 'Sarah Street 9, Beijing, China',
  paymentInfo: 'https://paypal.me/sarahfieldzz',
);

final customer = Customer(
  name: 'user 1',
  address: 'Apple Street, Cupertino, CA 95014',
);

final invoiceItems2 = [
 
  InvoiceItem(
    description: 'Blue Berries',
    date: DateTime.now(),
    quantity: 5,
    vat: 0.19,
    unitPrice: 0.99,
  ),
  InvoiceItem(
    description: 'hohooh',
    date: DateTime.now(),
    quantity: 4,
    vat: 0.19,
    unitPrice: 1.29,
  ),
];
final invoiceItems = [
  InvoiceItem(
    description: 'Coffee',
    date: DateTime.now(),
    quantity: 3,
    vat: 0.19,
    unitPrice: 5.99,
  ),
  InvoiceItem(
    description: 'Water',
    date: DateTime.now(),
    quantity: 8,
    vat: 0.19,
    unitPrice: 0.99,
  ),
  InvoiceItem(
    description: 'Orange',
    date: DateTime.now(),
    quantity: 3,
    vat: 0.19,
    unitPrice: 2.99,
  ),
  InvoiceItem(
    description: 'Apple',
    date: DateTime.now(),
    quantity: 8,
    vat: 0.19,
    unitPrice: 3.99,
  ),
  
];

final invoice = Invoice(
  
  supplier: supplier,
  customer: customer,
  info: InvoiceInfo(
    date: DateTime.now(),
    status: 'Pending',
    dueDate: DateTime.now().add(Duration(days: 7)),
    description: 'My description...',
    number: 'IN00022',
  ),
  items: invoiceItems,
);
final invoice2 = Invoice(
  supplier: supplier,
  customer: customer,
  info: InvoiceInfo(
    date: DateTime.now(),
    status: 'Approved',
    dueDate: DateTime.now().add(Duration(days: 7)),
    description: 'My description...',
    number: 'IN00021',
  ),
  items: invoiceItems2,
);
final invoices = [invoice, invoice2];