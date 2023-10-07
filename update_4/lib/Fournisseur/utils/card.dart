import 'package:flutter/material.dart';

class Mycard extends StatefulWidget {
  final double balance;
  const Mycard({
    Key? key,
    required this.balance
    }) : super(key: key);

  @override
  State<Mycard> createState() => _MycardState();
}

class _MycardState extends State<Mycard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepPurple[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Balance',
              
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Text(
              '\$'+widget.balance.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
