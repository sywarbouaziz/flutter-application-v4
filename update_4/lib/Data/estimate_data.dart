import 'customer.dart';
import 'estimate.dart';
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

final estimateItems2 = [
 
  EstimateItem(
    description: 'Blue Berries',
    date: DateTime.now(),
    quantity: 5,
    vat: 0.19,
    unitPrice: 0.99,
  ),
  EstimateItem(
    description: 'hohooh',
    date: DateTime.now(),
    quantity: 4,
    vat: 0.19,
    unitPrice: 1.29,
  ),
];
final EstimateItems = [
  EstimateItem(
    description: 'hhhhhh',
    date: DateTime.now(),
    quantity: 3,
    vat: 0.19,
    unitPrice: 5.99,
  ),
  EstimateItem(
    description: 'ghgh',
    date: DateTime.now(),
    quantity: 8,
    vat: 0.19,
    unitPrice: 0.99,
  ),
  EstimateItem(
    description: 'Orange',
    date: DateTime.now(),
    quantity: 3,
    vat: 0.19,
    unitPrice: 2.99,
  ),
  EstimateItem(
    description: 'Apple',
    date: DateTime.now(),
    quantity: 8,
    vat: 0.19,
    unitPrice: 3.99,
  ),
 
];

final estimate = Estimate(
  
  supplier: supplier,
  customer: customer,
  info: EstimateInfo(
    date: DateTime.now(),
    status: 'Approved',
    
    description: 'My description...',
    number: 'ES00022',
  ),
  items: EstimateItems,
);
final estimate2 = Estimate(
  supplier: supplier,
  customer: customer,
  info: EstimateInfo(
    date: DateTime.now(),
    status: 'Approved',
    description: 'My description...',
    number: 'ES00021',
  ),
  items: estimateItems2,
);
final estimates = [estimate, estimate2];