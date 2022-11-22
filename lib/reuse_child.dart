import 'package:flutter/material.dart';
import 'constants.dart';

class ReuseChild extends StatelessWidget {
  const ReuseChild({Key? key, required this.icone, required this.texte})
      : super(key: key);
  final IconData icone;
  final String texte;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icone, color: Colors.white, size: 70),
        const SizedBox(
          height: 20,
        ),
        Text(
          texte,
          style: kTexteStyle,
        ),
      ],
    );
  }
}
