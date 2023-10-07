class User {
  final String username;
  final String email;
  final String urlAvatar;
  final String status;
  final List<Invoice> invoices;
  final List<Quote> quotes;

  User({
    required this.username,
    required this.email,
    required this.urlAvatar,
    required this.status,
    required this.invoices,
    required this.quotes,
  });
}

class Invoice {
  final String number;
  final DateTime date;
  final double amount;
  final String status;

  Invoice({
    required this.number,
    required this.date,
    required this.amount,
    required this.status,
  });
}

class Quote {
  final String number;
  final DateTime date;
  final double amount;
  final String status;

  Quote({
    required this.number,
    required this.date,
    required this.amount,
    required this.status,
  });
}
