import 'customer.dart';
import 'supplier.dart';

class Estimate {
  final EstimateInfo info;
  final Supplier supplier;
  final Customer customer;
  final List<EstimateItem> items;

  const Estimate({
    required this.info,
    required this.supplier,
    required this.customer,
    required this.items,
  });
}

class EstimateInfo {
  final String description;
  final String number;
  final DateTime date;
  final String status;

  const EstimateInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.status,
  });
}

class EstimateItem {
  final String description;
  final DateTime date;
  final int quantity;
  final double vat;
  final double unitPrice;

  const EstimateItem({
    required this.description,
    required this.date,
    required this.quantity,
    required this.vat,
    required this.unitPrice,
  });
}
