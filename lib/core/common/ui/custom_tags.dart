import 'package:flutter/material.dart';

class CustomTags extends StatelessWidget {
  final Color borderColor;
  final Color backgroundColor;
  final Widget? child;
  final String? tag;

  const CustomTags({
    super.key,
    this.tag,
    this.child,
    this.borderColor = const Color.fromRGBO(255, 82, 82, 0.3),
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
      child:
          child ??
          Text(
            tag ?? '',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.white),
          ),
    );
  }
}
