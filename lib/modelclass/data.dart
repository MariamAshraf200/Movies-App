import 'package:flutter/material.dart';

class textapp extends StatelessWidget {
   String? text;
 late  Color? color;
 late double? size;
 late Key? key;


   textapp({ this.key, this.text, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text!);
  }
}
