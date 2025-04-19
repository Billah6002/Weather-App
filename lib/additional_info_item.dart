import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {
  final Icon icon;
  final String condition;
  final String value;
  const AdditionalInfoItem({
    super.key,
    required this.icon,
    required this.condition,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        SizedBox(height: 10),
        Text(condition),
        SizedBox(height: 10),
        Text(
          value.toString(),
          style:const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
