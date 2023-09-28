import 'package:flutter/material.dart';
import '../common/theme.dart';

// ignore: must_be_immutable
class ButtonGridWidget extends StatefulWidget {
  IconData icon;
  String text;
  Function()? onTap;

  ButtonGridWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  State<ButtonGridWidget> createState() => _ButtonGridWidgetState();
}

class _ButtonGridWidgetState extends State<ButtonGridWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: secondaryGreen,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: white,
            ),
            Text(
              widget.text,
              style: primaryTextStyle.copyWith(
                color: white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
