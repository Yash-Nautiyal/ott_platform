import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButtoms extends StatelessWidget {
  final String? icon;
  final String text;
  final VoidCallback onPressed;
  final Color borderColor;
  final Color backgroundColor;
  const CustomButtoms({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.borderColor = const Color.fromRGBO(244, 67, 54, 0.2),
    this.backgroundColor = const Color.fromRGBO(0, 0, 0, 0.2),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          ...(icon != null
              ? [
                SvgPicture.asset(icon!, color: Colors.white, width: 17),
                const SizedBox(width: 5),
              ]
              : []),
          Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
