import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoChip({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        text,
        style: const TextStyle(fontSize: 12),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      avatar: Icon(icon, size: 14),
      backgroundColor: Colors.blue[50],
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
