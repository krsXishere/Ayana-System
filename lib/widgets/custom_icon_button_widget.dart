import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIconButtonWidget extends StatelessWidget {
  String tooltip;
  Function()? onTap;
  Color color;

  CustomIconButtonWidget({
    super.key,
    required this.tooltip,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      tooltip: tooltip,
      onPressed: onTap,
      icon: Icon(
        Icons.add,
        color: color,
      ),
    );
  }
}
