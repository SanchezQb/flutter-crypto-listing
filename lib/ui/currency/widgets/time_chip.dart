import 'package:flutter/material.dart';

class TimeChip extends StatelessWidget {
  final bool active;
  final String time;
  const TimeChip({
    Key? key,
    required this.active,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 10),
      backgroundColor: active ? Color(0xFF1a1c20) : Colors.black,
      label: Text(time),
    );
  }
}
