import 'package:flutter/material.dart';

import '../constants.dart';

class Iconcontent extends StatelessWidget {
  Iconcontent({required this.iconCard, required this.textCard});
  final String textCard;
  final IconData iconCard;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconCard,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textCard,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}
