import 'package:flutter/material.dart';

class MenuOption {
  final String title;
  final IconData icon;
  final Function onTap;

  MenuOption({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
