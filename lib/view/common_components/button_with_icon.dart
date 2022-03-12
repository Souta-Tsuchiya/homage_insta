import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonWithIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;

  ButtonWithIcon({required this.onPressed, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: FaIcon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
