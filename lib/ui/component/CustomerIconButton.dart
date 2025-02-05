import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomerIconButton extends StatelessWidget {
  final VoidCallback onClik;
  final IconData iconData;
  final Color? iconTint;

  const CustomerIconButton({
    super.key,
    required this.onClik,
    required this.iconData,
    this.iconTint = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.onSurface,
      child: IconButton(
        onPressed: onClik,
        icon: Icon(
          iconData,
          color: iconTint,
        ),
      ),
    );
  }
}
