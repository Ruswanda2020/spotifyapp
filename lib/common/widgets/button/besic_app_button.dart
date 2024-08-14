import 'package:flutter/material.dart';

class BesicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  const BesicAppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(
        height ?? 80,
      )),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
