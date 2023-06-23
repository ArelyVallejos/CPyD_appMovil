import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final String placeholder;
  final IconData icon;

  const TextFieldWidget({
    Key? key,
    required this.label,
    required this.placeholder,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(10.0)),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: placeholder,
              suffixIcon: Icon(
                icon,
                color: Colors.blueGrey,
              ),
            ),
          ),
        )
      ],
    );
  }
}
