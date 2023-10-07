// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FournisseurList extends StatefulWidget {
  final IconData IconF;
  final String TitleF;
  final String SubTitleF;
  const FournisseurList({
    Key? key,
    required this.IconF,
    required this.SubTitleF,
    required this.TitleF,
  }) : super(key: key);

  @override
  State<FournisseurList> createState() => _FournisseurListState();
}

class _FournisseurListState extends State<FournisseurList> {
  @override
  Widget build(BuildContext context) {
    return Row(
    
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          widget.IconF,
          size: 40,
        ),
       
        Column(
          children: [
            Text(
              widget.TitleF,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              widget.SubTitleF,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
